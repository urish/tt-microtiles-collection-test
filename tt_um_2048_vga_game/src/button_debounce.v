/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module button_debounce (
    input  wire clk,
    input  wire rst_n,
    input  wire button,
    output reg  debounced
);

  reg [17:0] debounce_counter;  // 18-bit counter for 10 ms debounce time at 25 MHz clock
  reg button_sync_0, button_sync_1;

  // Synchronize the button input to the clock domain to avoid metastability
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      button_sync_0 <= 1'b0;
      button_sync_1 <= 1'b0;
    end else begin
      button_sync_0 <= button;
      button_sync_1 <= button_sync_0;
    end
  end

  // Debounce logic
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      debounce_counter <= 18'b0;
      debounced <= 1'b0;
    end else begin
      if (button_sync_1 == debounced) begin
        debounce_counter <= 18'b0;
      end else begin
        if (debounce_counter == 18'd250000) begin
          debounced <= button_sync_1;
          debounce_counter <= 18'b0;
        end else begin
          debounce_counter <= debounce_counter + 1;
        end
      end
    end
  end
endmodule
