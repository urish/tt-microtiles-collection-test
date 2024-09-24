/*
 * Copyright (c) 2024 Zachary Catlin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// mixer: sums the input lines, then uses that to drive a PWM

module logs_mixer #(
  parameter N = 1,   // number of audio inputs
  parameter K = 2    // PWM effectively divides the output by 2^K
) (
  input  wire clk,      // clock
  input  wire reset,    // reset (active HIGH)
  input  wire [(N-1):0] audio_in, // input audio lines
  input  wire [(N-1):0] audio_mask, // which lines to actually mix
  output reg  audio_out // output audio line
);
  parameter SUM_WIDTH = $clog2(N + 1);

  // PWM counter
  reg [(K-1):0] counter;

  wire [(K-1):0] sum;

  generate
    if (K > SUM_WIDTH) begin : gen_zero_pad
      assign sum[(K-1):SUM_WIDTH] = 0;
    end
  endgenerate

  // sum the input lines...
  logs_popcount #(N) popcount(
    .word(audio_in & audio_mask),
    .sum(sum[(SUM_WIDTH-1):0])
  );

  always @(posedge clk) begin
    if (reset) begin
      audio_out <= 0;
      counter <= 0;
    end
    else begin
      audio_out <= (counter < sum); // ...and use the sum as the PWM duty cycle
      counter <= counter + 1;
    end
  end
endmodule
