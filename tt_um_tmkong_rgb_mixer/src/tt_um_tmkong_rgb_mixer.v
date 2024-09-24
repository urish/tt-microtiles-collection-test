/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_tmkong_rgb_mixer (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire rst = ! rst_n;
    assign uo_out[7:3] = 5'b0_0000;
    wire [7:0] enc0, enc1, enc2;

    wire [1:0] debug_enc = ui_in[7:6];


    rgb_mixer rgb_mixer (
        .clk(clk),
        .reset(rst),
        .enc0_a(ui_in[0]),
        .enc0_b(ui_in[1]),
        .enc1_a(ui_in[2]),
        .enc1_b(ui_in[3]),
        .enc2_a(ui_in[4]),
        .enc2_b(ui_in[5]),
        .pwm0_out(uo_out[0]),
        .pwm1_out(uo_out[1]),
        .pwm2_out(uo_out[2]),
        // debug
        .enc0(enc0),
        .enc1(enc1),
        .enc2(enc2)
    );

endmodule
