/*
 * Copyright (c) 2024 Zachary Catlin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// A sonification of the logistic map (https://en.wikipedia.org/wiki/Logistic_map):
//
//         x_(n+1) := r * x_n * (1 - x_n)     (0 < x_n < 1, 1 < r < 4)
//
// as PWM'ed audio.

module logistic_snd #(
  parameter N_OSC = 4,       // number of square-wave generators running
  parameter ITER_LEN = 100,  // number of clock cycles for an iteration of the map
  parameter R_INC = 1000,    // the number of iterations of the map after which
                             // we should update 'r'

  parameter FREQ  = 30'd25_200_000, // frequency of clk (Hz)
  parameter LO_F  = 200,     // frequency corresponding to x_n = 0 (Hz)
  parameter HI_F  = 1200,    // frequency corresponding to x_n = 1 (Hz)

  parameter FRAC  = 8,       // fractional part of r, x

  parameter PHASE_BITS = 12, // number of bits in phase accumulators
  parameter FREQ_RES   = 0   // approximate frequency resolution
                             // of square-wave generators is 2^FREQ_RES Hz
) (
  input  wire clk,   // clock
  input  wire reset, // reset (active HIGH)
  output wire snd    // PWM audio
);

  // this section implements the logistic map,
  // changing r every R_INC iterations of the map

  wire [(FRAC-1):0] x;  // the 'x' variable in 0.FRAC fixed-point
  wire next_x_ready;    // this is 1 when a new value of 'x' is produced by the
                        // logs_iterate_map block

  reg [(2+FRAC-1):0] r; // the 'r' variable in 2.FRAC fixed-point

  parameter R_COUNTER_BITS = (R_INC >= 2) ? $clog2(R_INC) : 1;

  reg [(R_COUNTER_BITS-1):0] r_counter;

  parameter INITIAL_R = (1 << FRAC) | (1 << (FRAC - 4)); // 1.0625

  // increment more in the area r < 3; this makes us spend more time in 3 <= r < 4
  wire [1:0] r_top = r[(2+FRAC-1):FRAC];
  wire [(2+FRAC-1):0] r_increment = (r_top < 2'b11) ? 4 : 1;

  always @(posedge clk) begin
    if (reset) begin
      r <= INITIAL_R; // initialize 'r' to 1.0625
      r_counter <= 0;
    end
    else begin
      if (next_x_ready & (r_counter >= (R_INC-1))) begin
        r <= (&r) ? INITIAL_R : r + r_increment;  // increment, wrapping from 4.0 to INITIAL_R
      end

      if (next_x_ready) begin
        r_counter <= (r_counter >= (R_INC-1)) ? 0 : r_counter + 1;
      end
    end
  end

  logs_iterate_map #(FRAC, ITER_LEN) iter(
    .clk(clk),
    .reset(reset),

    .r(r),
    .x(x),

    .next_ready(next_x_ready)
  );


  // this section implements the square-wave generators, the frequencies
  // being derived from values of 'x'

  // we make use of the fact that 25_200_000 is divisible by 128
  parameter LOW_FREQUENCY  = (LO_F << (PHASE_BITS + PHASE_DEC - 7)) / (FREQ >> 7);
  parameter HIGH_FREQUENCY = (HI_F << (PHASE_BITS + PHASE_DEC - 7)) / (FREQ >> 7);
  parameter FREQUENCY_INC  = HIGH_FREQUENCY - LOW_FREQUENCY;

  wire [(PHASE_BITS + FRAC - 1):0] low_frequency_w = LOW_FREQUENCY;
  wire [(PHASE_BITS + FRAC - 1):0] frequency_inc_w = FREQUENCY_INC;
  wire [(PHASE_BITS + FRAC - 1):0] x_scaled_product
    = low_frequency_w + (frequency_inc_w * {{(PHASE_BITS){1'b0}}, x});

  // the 'x' value, appropriately scaled to a frequency for the NCOs
  wire [(PHASE_BITS-2):0] scaled_x = x_scaled_product[(PHASE_BITS + FRAC - 2):FRAC];

  // the frequency registers for the NCOs
  reg [(PHASE_BITS-2):0] freq [(N_OSC-1):0];

  parameter FC_LEN = $clog2(N_OSC);

  // which square wave's frequency should we update now?
  reg [(FC_LEN-1):0] f_counter;

  // the number of oscillators we care about at any given time, minus one
  wire [(FC_LEN-1):0] max_n_osc;
  // which oscillators we care about at any given time
  wire [(N_OSC-1):0] osc_mask;

  wire [(FC_LEN-1):0] max_osc_default = N_OSC - 1;
  parameter N_OSC_6 = (N_OSC < 6) ? N_OSC : 6 * (N_OSC / 6);
  wire [(FC_LEN-1):0] max_osc_6 = N_OSC_6 - 1;
  parameter N_OSC_5 = (N_OSC < 5) ? N_OSC : 5 * (N_OSC / 5);
  wire [(FC_LEN-1):0] max_osc_5 = N_OSC_5 - 1;

  // so, why change the number of used oscillators?
  // because, in non-chaotic regions, it sounds better when
  // you use a multiple of stable cycle length.

  // quick and dirty selection of some regions for said special treatment:

  assign {max_n_osc, osc_mask}
    = (r[(FRAC+1):(FRAC-6)] == 8'b11_101000) ? {max_osc_6, {(N_OSC - N_OSC_6){1'b0}}, {N_OSC_6{1'b1}}} :
      ((r[(FRAC+1):(FRAC-4)] == 6'b11_1101) & ~&r[(FRAC-5):(FRAC-6)]) ? {max_osc_6, {(N_OSC - N_OSC_6){1'b0}}, {N_OSC_6{1'b1}}} :
      (r[(FRAC+1):(FRAC-5)] == 7'b11_10111) ? {max_osc_5, {(N_OSC - N_OSC_5){1'b0}}, {N_OSC_5{1'b1}}} :
      {max_osc_default, {N_OSC{1'b1}}};

  integer j;

  always @(posedge clk) begin
    if (reset) begin
      f_counter <= 0;

      for (j = 0; j < N_OSC; j = j + 1) begin
        freq[j] <= 0;
      end
    end
    else if (next_x_ready) begin
      freq[f_counter] <= scaled_x;
      f_counter <= (f_counter >= max_n_osc) ? 0 : f_counter + 1;
    end
  end

  // the output of the square-wave generators
  wire [(N_OSC-1):0] osc;

  // log2(slowdown of phase accumulators from clk)
  parameter PHASE_DEC = $clog2(FREQ) - PHASE_BITS - FREQ_RES;

  wire nco_increment;
  logs_divider #(1 << PHASE_DEC) nco_increment_gen(
    .clk(clk),
    .reset(reset),
    .mod_n(nco_increment)
  );

  genvar i;
  generate
    for (i = 0; i < N_OSC; i = i + 1) begin
      logs_nco #(PHASE_BITS) n_c_oh_my(
        .clk(clk),
        .reset(reset),
        .step(nco_increment),
        .freq_in(freq[i]),
        .snd(osc[i])
      );
    end
  endgenerate


  // this section mixes the square waves and output the result!

  logs_mixer #(N_OSC, $clog2(N_OSC + 1)) mixer(
    .clk(clk),
    .reset(reset),
    .audio_in(osc),
    .audio_mask(osc_mask),
    .audio_out(snd)
  );

endmodule
