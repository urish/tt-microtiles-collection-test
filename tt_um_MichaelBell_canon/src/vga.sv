// SPDX-FileCopyrightText: © 2022 Leo Moser <leo.moser@pm.me>, 2024 Michael Bell
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

    /*
        Default parameters are SVGA 800x600
        clock = 36MHz for 56.25 Hz (a VESA standard DMT mode)
    */

module vga #(
    parameter WIDTH=800,    // display width
    parameter HEIGHT=600,   // display height
    parameter HFRONT=24,    // horizontal front porch
    parameter HSYNC=72,     // horizontal sync
    parameter HBACK=128,    // horizontal back porch
    parameter VFRONT=1,     // vertical front porch
    parameter VSYNC=2,      // vertical sync
    parameter VBACK=22      // vertical back porch
)(
    input  logic clk,       // clock
    input  logic reset_n,   // reset
    input  logic [9:0] low_count, // counter for x
    output logic hsync,     // 1'b1 if in hsync region
    output logic vsync,     // 1'b1 if in vsync region
    output logic blank,     // 1'b1 if in blank region
    output logic [9:0] x_pos,
    output logic [9:0] y_pos,
    output logic vsync_pulse,
    output logic next_row
);

    localparam HTOTAL = WIDTH + HFRONT + HSYNC + HBACK;
    localparam VTOTAL = HEIGHT + VFRONT + VSYNC + VBACK;

    logic signed [$clog2(VTOTAL-1) : 0] y_pos_internal;

    /* Horizontal and Vertical Timing */
    
    logic vblank;
    logic vblank_w;
    logic next_frame;
     
    // Horizontal timing
    assign next_row = low_count == WIDTH - 1;
    logic hsync_tmp;
    logic hblank_tmp;
    logic hblank;
    assign hsync_tmp = (low_count >= HTOTAL - HSYNC - HBACK) && (low_count < HTOTAL - HBACK);
    always_ff @(posedge clk)
        hsync <= hsync_tmp;
    assign hblank_tmp = low_count >= WIDTH - 1;
    always_ff @(posedge clk)
        hblank <= hblank_tmp;

    // Vertical timing
    timing #(
        .RESOLUTION     (HEIGHT),
        .FRONT_PORCH    (VFRONT),
        .SYNC_PULSE     (VSYNC),
        .BACK_PORCH     (VBACK),
        .TOTAL          (VTOTAL),
        .POLARITY       (1'b1)
    ) timing_ver (
        .clk        (clk),
        .enable     (next_row),
        .reset_n    (reset_n),
        .sync       (vsync),
        .blank      (vblank_w),
        .next       (next_frame),
        .counter    (y_pos_internal)
    );

    assign blank = hblank || vblank;
    assign vsync_pulse = next_row && (y_pos_internal == -VBACK - VSYNC + 1);

    assign x_pos = blank ? 10'd0 : low_count;
    assign y_pos = vblank ? 10'd0 : y_pos_internal[9:0];

    always_ff @(posedge clk) vblank <= vblank_w;

    wire _unused = &{next_frame, 1'b0};

endmodule
