/*
 * Copyright (c) 2024 Zachary Catlin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// generates a pulse once every N clocks

module logs_divider #(
  parameter N = 2
) (
  input  wire clk,    // clock
  input  wire reset,  // reset (active HIGH)
  output reg  mod_n   // output (HIGH once every N clocks)
);

  parameter NBITS = $clog2(N);
  reg [(NBITS-1):0] counter;

  always @(posedge clk) begin
    if (reset) begin
      counter <= 0;
      mod_n <= 0;
    end
    else begin
      mod_n   <= ~|counter; // "counter == 0"
      counter <= (counter >= (N-1)) ? 0 : counter + 1;
    end
  end
endmodule
