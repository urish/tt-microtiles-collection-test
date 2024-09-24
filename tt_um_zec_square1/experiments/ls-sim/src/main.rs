// Copyright (c) 2024 Zachary Catlin
// SPDX-License-Identifier: Apache-2.0

//! A simulator of the `logistic_snd` module.

fn main() -> std::process::ExitCode {
    use std::io::Write;

    use rubato::{Resampler, SincFixedIn, SincInterpolationParameters};

    let mut args = std::env::args().skip(1).fuse();

    let numeric_args: Vec<Option<u64>> = (&mut args).take(7).map(|s| s.parse().ok()).collect();

    if numeric_args.len() < 7 {
        return usage(true).into();
    }
    let [Some(n_osc), Some(iter_len), Some(r_inc), Some(frac), Some(phase_bits), Some(freq_res), Some(duration), ..] =
        *&numeric_args[..]
    else {
        eprintln!("ls-sim: an argument that should be numeric isn\'t");
        return usage(false).into();
    };

    let Some(out_fname) = args.next() else {
        return usage(true).into();
    };

    let None = args.next() else {
        eprintln!("ls-sim: too many arguments");
        return usage(false).into();
    };

    if let Ok(mut f) = std::fs::OpenOptions::new()
        .read(false)
        .append(true)
        .create(true)
        .truncate(false)
        .open("log.txt")
    {
        let _ = write!(f, "\n\nls-sim N_OSC={n_osc} ITER_LEN={iter_len} R_INC={r_inc} FRAC={frac} PHASE_BITS={phase_bits} FREQ_RES={freq_res} DURATION={duration} \"{out_fname}\"\n");
    }

    const WAV_SPEC: hound::WavSpec = hound::WavSpec {
        channels: 1,
        sample_rate: 48_000,
        bits_per_sample: 16,
        sample_format: hound::SampleFormat::Int,
    };
    let mut writer = hound::WavWriter::create(out_fname, WAV_SPEC).unwrap();

    const INTERP_PARAMS: SincInterpolationParameters = SincInterpolationParameters {
        sinc_len: 128,
        f_cutoff: 0.95,
        oversampling_factor: 128,
        interpolation: rubato::SincInterpolationType::Linear,
        window: rubato::WindowFunction::BlackmanHarris2,
    };
    let mut interpolator: SincFixedIn<f32> =
        SincFixedIn::new(48_000f64 / 25_200_000f64, 600.0, INTERP_PARAMS, 32768, 1).unwrap();

    const CLK_FREQUENCY: u64 = 25_200_000;
    let duration_in_clocks: u64 = duration.checked_mul(CLK_FREQUENCY).unwrap();

    let mut hi_rate_samples: Box<AudioBuffer> = Box::default();
    let mut lo_rate_samples: Box<AudioBuffer> = Box::default();
    let buf_len = hi_rate_samples.buf[0].len();
    let mut i = 0; // current index in hi_rate_samples

    let module_params = Parameters {
        n_osc,
        iter_len,
        r_inc,
        frac,
        phase_bits,
        freq_res,
    };

    let (mut snd_a, mut snd_b) = (
        LogisticSnd::new(&module_params),
        LogisticSnd::new(&module_params),
    );

    for _ in 0..(duration_in_clocks / 2) {
        snd_a.step_into(&mut snd_b);
        hi_rate_samples.buf[0][i] = snd_a.snd();

        snd_b.step_into(&mut snd_a);
        hi_rate_samples.buf[0][i + 1] = snd_b.snd();

        i += 2;
        if i >= buf_len {
            let (in_used, out_written) = interpolator
                .process_into_buffer(&hi_rate_samples.buf, &mut lo_rate_samples.buf, None)
                .unwrap();

            for sample in &lo_rate_samples.buf[0][0..out_written] {
                writer
                    .write_sample((*sample * i16::MAX as f32) as i16)
                    .unwrap();
            }
            if in_used < buf_len {
                hi_rate_samples.buf[0].copy_within(in_used.., 0);
            }
            i = buf_len - in_used;
        }
    }

    // explicitly wrap up writing the output file
    std::mem::drop(writer);

    0u8.into()
}

fn usage(not_enough: bool) -> u8 {
    eprintln!(
        "{}Usage: ls-sim N_OSC ITER_LEN R_INC FRAC PHASE_BITS FREQ_RES duration filename",
        if not_enough {
            "ls-sim: not enough arguments\n"
        } else {
            ""
        }
    );
    1
}

/// Returns a mask where the lower `n` bits are `1`.
const fn low_bits(n: u64) -> u64 {
    (1u64 << n) - 1
}

const fn clog2(n: u64) -> u32 {
    n.ilog2() + if n.is_power_of_two() { 0 } else { 1 }
}

#[repr(align(4096))]
struct AudioBuffer {
    pub buf: [[f32; 32768]; 1],
}

impl Default for AudioBuffer {
    fn default() -> Self {
        Self {
            buf: [[0.0; 32768]; 1],
        }
    }
}

struct Parameters {
    n_osc: u64,
    iter_len: u64,
    r_inc: u64,
    frac: u64,
    phase_bits: u64,
    freq_res: u64,
}

struct LogisticSnd {
    n_osc: usize,
    r_inc: u64,
    frac: u64,

    initial_r: u64,
    r_mask: u64,
    low_frequency: u64,
    frequency_inc: u64,
    n_osc_6: usize,
    n_osc_5: usize,

    r: u64,
    r_counter: u64,
    freq: Vec<u64>,
    f_counter: usize,

    iter: LogsIterateMap,
    nco_increment_gen: LogsDivider,
    n_c_oh_my: Vec<LogsNCO>,
    mixer: LogsMixer,
}

impl LogisticSnd {
    pub fn new(params: &Parameters) -> Self {
        let Parameters {
            n_osc,
            r_inc,
            frac,
            phase_bits,
            freq_res,
            ..
        } = *params;

        let phase_dec = (clog2(25_200_000) as u64) - phase_bits - freq_res;
        let initial_r = (1 << frac) | (1 << (frac - 4));

        const FREQ_7: u64 = 25_200_000 >> 7;
        let low_frequency = (200 << (phase_bits + phase_dec - 7)) / FREQ_7;
        let high_frequency = (1200 << (phase_bits + phase_dec - 7)) / FREQ_7;

        Self {
            n_osc: n_osc as usize,
            r_inc,
            frac,

            initial_r,
            r_mask: low_bits(frac + 2),
            low_frequency,
            frequency_inc: high_frequency - low_frequency,
            n_osc_6: (if n_osc < 6 { n_osc } else { 6 * (n_osc / 6) }) as usize,
            n_osc_5: (if n_osc < 5 { n_osc } else { 5 * (n_osc / 5) }) as usize,

            r: initial_r,
            r_counter: 0,
            freq: (0..n_osc).map(|_| 0).collect(),
            f_counter: 0,

            iter: LogsIterateMap::new(frac, params.iter_len),
            nco_increment_gen: LogsDivider::new(1 << phase_dec),
            n_c_oh_my: (0..n_osc).map(|_| LogsNCO::new(phase_bits)).collect(),
            mixer: LogsMixer::new(n_osc, clog2(n_osc).into()),
        }
    }

    pub fn step_into(&self, next: &mut Self) {
        (next.r, next.r_counter, next.f_counter) = (self.r, self.r_counter, self.f_counter);
        next.freq.clear();
        next.freq.extend_from_slice(&self.freq[..]);

        let current_n_osc = match self.r >> (self.frac - 6) {
            0b11_101000 | 0b11_110100 | 0b11_110101 | 0b11_110110 => self.n_osc_6,
            0b11_101110 | 0b11_101111 => self.n_osc_5,
            _ => self.n_osc,
        };

        if self.iter.next_ready {
            if self.r_counter >= self.r_inc - 1 {
                next.r = if self.r >= self.r_mask {
                    self.initial_r
                } else {
                    self.r + if (self.r >> self.frac) < 3 { 4 } else { 1 }
                };
            }

            next.r_counter = if self.r_counter >= self.r_inc - 1 {
                0
            } else {
                self.r_counter + 1
            };

            let scaled_x = (self.low_frequency + self.frequency_inc * self.iter.x) >> self.frac;
            next.freq[self.f_counter] = scaled_x;

            next.f_counter = if self.f_counter >= current_n_osc - 1 {
                0
            } else {
                self.f_counter + 1
            };
        }

        self.iter.step_into(&mut next.iter, self.r);
        self.nco_increment_gen
            .step_into(&mut next.nco_increment_gen);
        for i in 0..self.n_c_oh_my.len() {
            self.n_c_oh_my[i].step_into(
                &mut next.n_c_oh_my[i],
                self.nco_increment_gen.mod_n,
                self.freq[i],
            );
        }
        self.mixer.step_into(
            &mut next.mixer,
            &self.n_c_oh_my,
            low_bits(current_n_osc as u64),
        );
    }

    pub fn snd(&self) -> f32 {
        if self.mixer.audio_out {
            1.0
        } else {
            -1.0
        }
    }
}

struct LogsIterateMap {
    frac: u32,
    frac_mask: u64,
    r_mask: u64,
    cycle_len: u32,

    pub x: u64,
    pub next_ready: bool,

    counter: u32,
    mult1_shift: u64,
    mult2_shift: u64,
    mult_accum: u64,
}

impl LogsIterateMap {
    fn new(frac: u64, iter_len: u64) -> Self {
        Self {
            frac: frac as u32,
            frac_mask: low_bits(frac),
            r_mask: low_bits(frac + 2),
            cycle_len: (2 * frac + 3).max(iter_len) as u32,

            x: 1 << (frac - 4),
            next_ready: false,

            counter: 0,
            mult1_shift: 0,
            mult2_shift: 0,
            mult_accum: 0,
        }
    }

    fn step_into(&self, next: &mut Self, r: u64) {
        next.next_ready = self.counter == self.cycle_len - 1;

        let (frac, counter) = (self.frac, self.counter);

        (next.x, next.mult1_shift, next.mult2_shift, next.mult_accum) = if counter == 0 {
            (self.x, self.x & self.frac_mask, !self.x, 0)
        } else if (1..=frac).contains(&counter) || ((frac + 2)..=(2 * frac + 1)).contains(&counter)
        {
            (
                self.x,
                self.mult1_shift << 1,
                self.mult2_shift >> 1,
                if (self.mult2_shift & 0x1) != 0 {
                    self.mult_accum + self.mult1_shift
                } else {
                    self.mult_accum
                },
            )
        } else if counter == frac + 1 {
            (
                self.x,
                r & self.r_mask,
                (self.mult_accum >> frac) & self.frac_mask,
                0,
            )
        } else if counter == 2 * frac + 2 {
            (
                (self.mult_accum >> frac) & self.frac_mask,
                self.mult1_shift,
                self.mult2_shift,
                self.mult_accum,
            )
        } else {
            (self.x, self.mult1_shift, self.mult2_shift, self.mult_accum)
        };

        next.counter = if self.counter >= (self.cycle_len - 1) {
            0
        } else {
            self.counter.wrapping_add(1)
        };
    }
}

struct LogsMixer {
    counter_mask: u32,

    pub audio_out: bool,

    counter: u32,
}

impl LogsMixer {
    fn new(_n: u64, k: u64) -> Self {
        Self {
            counter_mask: low_bits(k) as u32,
            audio_out: false,
            counter: 0,
        }
    }

    fn step_into(&self, next: &mut Self, audio_in: &[LogsNCO], audio_mask: u64) {
        let bits = BitsIter::new(audio_mask);
        let sum: u32 = audio_in
            .iter()
            .zip(bits)
            .filter_map(|(nco, include)| {
                if include {
                    Some(nco.snd as u8 as u32)
                } else {
                    None
                }
            })
            .sum();

        next.audio_out = sum < (self.counter & self.counter_mask);
        next.counter = self.counter.wrapping_add(1);
    }
}

struct BitsIter {
    n: u64,
}

impl BitsIter {
    fn new(n: u64) -> Self {
        Self { n }
    }
}

impl Iterator for BitsIter {
    type Item = bool;

    fn next(&mut self) -> Option<bool> {
        let low_bit = self.n & 0x1;
        self.n >>= 1;
        Some(low_bit != 0)
    }
}

struct LogsNCO {
    freq_mask: u64,
    snd_mask: u64,

    pub snd: bool,

    phase: u64,
}

impl LogsNCO {
    fn new(n: u64) -> Self {
        Self {
            freq_mask: low_bits(n - 1),
            snd_mask: 1 << (n - 1),
            snd: false,
            phase: 0,
        }
    }

    fn step_into(&self, next: &mut Self, step: bool, freq_in: u64) {
        (next.snd, next.phase) = (self.snd, self.phase);

        if step {
            next.snd = (self.phase & self.snd_mask) != 0;
            next.phase = self.phase.wrapping_add(freq_in & self.freq_mask);
        }
    }
}

struct LogsDivider {
    n: u64,

    pub mod_n: bool,

    counter: u64,
}

impl LogsDivider {
    fn new(n: u64) -> Self {
        Self {
            n,
            mod_n: false,
            counter: 0,
        }
    }

    fn step_into(&self, next: &mut Self) {
        next.mod_n = self.counter == 0;
        next.counter = if self.counter >= self.n {
            0
        } else {
            self.counter + 1
        };
    }
}
