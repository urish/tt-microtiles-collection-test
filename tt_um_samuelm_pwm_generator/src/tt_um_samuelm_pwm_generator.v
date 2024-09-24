/*
 * Copyright (c) 2024 Samuel Matea
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`include "pwm_generator.v"

module tt_um_samuelm_pwm_generator (
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
    assign uo_out[7:1] = 0;    // only uo_out[0] is used as output for pwm_out
    assign uio_out = 0;        
    assign uio_oe[7:0]  = 8'b0001_0000;

  // List all unused inputs to prevent warnings
    wire _unused = &{ena, uio_in[4], 1'b0};

    pwm_generator pwm_generator_inst(
        .in         ({uio_in[3:0],ui_in[7:0]}),
        .sel        (uio_in[6]),
        .wr_en      (uio_in[7]),
        .out_en     (uio_in[5]),
        .pwm_out    (uo_out[0]),
        .clk        (clk),
        .rst_n      (rst_n)
    );
    
endmodule
