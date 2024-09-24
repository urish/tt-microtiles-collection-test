// Copyright (c) 2024 Zachary Catlin
// SPDX-License-Identifier: Apache-2.0

static PROG_NAME: &'static str = "fst2wav";

fn main() -> std::process::ExitCode {
    main_fallible().err().unwrap_or(0).into()
}

fn main_fallible() -> Result<(), u8> {
    use bwavfile::{WaveFmt, WaveWriter};
    use vcd::Value;

    let args: Vec<String> = std::env::args().collect();

    let [_, ref wav_fname] = args[..] else {
        eprintln!("{}: Wrong number of arguments", PROG_NAME);
        eprintln!("Usage: {} output-wav", PROG_NAME);
        return Err(1);
    };

    let stdin = std::io::stdin();
    let mut vcd_p = vcd::Parser::new(stdin.lock());

    let mut wav = WaveWriter::create(wav_fname, WaveFmt::new_pcm_mono(25_200_000, 16))
        .and_then(|ww| ww.audio_frame_writer())
        .map_err(|e| {
            eprintln!("{}: error opening {}: {}", PROG_NAME, wav_fname, e);
            3
        })?;

    let header = vcd_p.parse_header().map_err(|e| {
        eprintln!("{}: error parsing VCD header: {}", PROG_NAME, e);
        4
    })?;

    let clk = header
        .find_var(&["TOP", "tb", "clk"])
        .ok_or_else(|| {
            eprintln!("{}: could not find variable clk", PROG_NAME);
            5
        })?
        .code;

    let snd_out = header
        .find_var(&["TOP", "tb", "snd_out"])
        .ok_or_else(|| {
            eprintln!("{}: could not find variable snd_out", PROG_NAME);
            5
        })?
        .code;

    let mut clk_val = Value::X;
    let mut snd_val = Value::X;

    let mut sample_buf = [0i16; 0x10_0000];
    let mut j = 0;

    for command_result in vcd_p {
        use vcd::Command::*;

        let command = command_result.map_err(|e| {
            eprintln!("{}: error reading VCD command: {}", PROG_NAME, e);
            6
        })?;
        match command {
            ChangeScalar(i, v) if i == clk => {
                // sample snd_out on the falling edge of the clock
                if clk_val == Value::V1 && v == Value::V0 {
                    sample_buf[j] = match snd_val {
                        Value::V1 => i16::MAX,
                        _ => i16::MIN,
                    };
                    j += 1;
                    if j >= sample_buf.len() {
                        wav.write_frames(&sample_buf).unwrap();
                        j = 0;
                        eprint!(".");
                    }
                }
                clk_val = v;
            }
            ChangeScalar(i, v) if i == snd_out => {
                snd_val = v;
            }
            _ => {}
        }
    }

    if j > 0 {
        wav.write_frames(&sample_buf[..j]).unwrap();
    }
    let _ = wav.end().expect("failed to finalize output file");
    eprint!("\n");

    Ok(())
}
