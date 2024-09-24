/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_benpayne_ps2_decoder (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_oe = cs ? 8'b11111111 : 8'b00000000; // [uio_out[7:0] are always outputs
  assign uo_out[7:3] = 5'b00000; // uo_out[7:3] set to always 0

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, uio_in, ui_in[7:4], 1'b0};

  wire ps2_clk_internal;
  wire ps2_data_internal;
  wire [7:0] ps2_key_data;
  wire valid;
  wire interupt;
  wire int_clear;
  wire cs;
  wire data_rdy;

  reg cs_prev = 0;
  reg cs_trigger = 0;

  assign int_clear = ui_in[2];
  assign cs = ui_in[3];

  assign uo_out[0] = valid;
  //assign uo_out[1] = interupt;
  assign uo_out[2] = ~data_rdy;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      cs_prev <= 0;
      cs_trigger <= 0;
    end else begin
      cs_prev <= cs;
      if (cs_prev == 0 && cs) begin
        cs_trigger <= 1;
      end else begin
        cs_trigger <= 0;
      end 
    end
  end

  debounce ps2_clk_debounce(
    .clk(clk),
    .reset(~rst_n),
    .button(ui_in[0]),
    .debounced_button(ps2_clk_internal)
  );

  debounce ps2_data_debounce(
    .clk(clk),
    .reset(~rst_n),
    .button(ui_in[1]),
    .debounced_button(ps2_data_internal)
  );

  dual_port_fifo memory(
    .clk(clk),
    .rst(~rst_n),
    .wr_en(valid),
    .rd_en(cs_trigger),
    .empty(data_rdy),
    .data_in(ps2_key_data),
    .data_out(uio_out)
  );

  ps2_decoder ps2_decoder_inst (
    .clk(clk),
    .reset(~rst_n),
    .ps2_clk(ps2_clk_internal),
    .ps2_data(ps2_data_internal),
    .data(ps2_key_data),
    .valid(valid),
    .interupt(uo_out[1]),
    .int_clear(int_clear)
  );
endmodule
