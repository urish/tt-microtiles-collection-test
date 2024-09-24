/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module galois_lfsr (
    input wire clk,
    input wire rst_n,
    output reg [31:0] lfsr
);

  wire feedback = lfsr[31] ^ lfsr[21] ^ lfsr[1] ^ lfsr[0];

  always @(posedge clk) begin
    if (~rst_n) begin
      lfsr <= 32'h2048FAFA;  // Initialize LFSR to non-zero value
    end else begin
      lfsr <= {lfsr[30:0], feedback};  // Shift left and insert feedback bit
    end
  end

endmodule
