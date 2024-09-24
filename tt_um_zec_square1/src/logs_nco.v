/*
 * Copyright (c) 2024 Zachary Catlin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// numerically-controlled oscillator: generates a square wave
// of frequency f(step) * (freq_in / 2^N)

module logs_nco #(
  parameter N = 5   // number of bits in phase accumulator
) (
  input  wire clk,     // clock
  input  wire reset,   // reset (active HIGH)
  input  wire step,    // whether to step our logic
  input  wire [(N-2):0] freq_in, // frequency (in units of [frequency of clock] / 2^N)
  output reg  snd      // square wave out
);

  // our phase accumulator
  reg [(N-1):0] phase;

  always @(posedge clk) begin
    if (reset) begin
      phase <= 0;
      snd <= 0;
    end
    else if (step) begin
      snd <= phase[N-1];
      phase <= phase + {1'b0,freq_in};
    end
  end
endmodule
