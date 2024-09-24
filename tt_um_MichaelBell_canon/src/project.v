/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_MichaelBell_canon (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire pwm;

    wire [9:0] low_count;
    wire [6:0] crotchet;

    pwm_music i_music(
        .clk(clk),
        .rst_n(rst_n),

        .pwm(pwm),

        .fast_start(ui_in[1:0]),

        .low_count(low_count),
        .crotchet(crotchet)
    );

    wire [5:0] video_colour;
    wire vga_blank;
    display i_display(
        .clk(clk),
        .rst_n(rst_n),

        .low_count(low_count),
        .crotchet(crotchet ^ {ui_in[7:2], 1'b0}),

        .hsync(uo_out[7]),
        .vsync(uo_out[3]),
        .blank(vga_blank),
        .colour(video_colour)
    );

  assign uio_out[7] = pwm;

  assign uo_out[0] = vga_blank ? 1'b0 : video_colour[5];
  assign uo_out[1] = vga_blank ? 1'b0 : video_colour[3];
  assign uo_out[2] = vga_blank ? 1'b0 : video_colour[1];
  assign uo_out[4] = vga_blank ? 1'b0 : video_colour[4];
  assign uo_out[5] = vga_blank ? 1'b0 : video_colour[2];
  assign uo_out[6] = vga_blank ? 1'b0 : video_colour[0];     

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out[6:0] = 0;
  assign uio_oe  = 8'b10000000;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, uio_in, 1'b0};

endmodule
