/*
 * Copyright (c) 2024 Sagar Dev Achar
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_demosiine_sda (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
    );

    wire [1:0] r, g, b;
    wire audio;
  
    wire [9:0] x, y;
    wire h_sync, v_sync;
    wire frame_active;

    wire mode_toggle_audio = ui_in[7];
    
    vga_controller vga_controller_1 (
        .x(x), .y(y),
        .h_sync(h_sync), .v_sync(v_sync),
        .frame_active(frame_active),
        .clk(clk), .rst_n(rst_n)
    );
    
    graphics_engine graphics_engine_1 (
        .r(r), .g(g), .b(b),
        .x(x), .y(y[8:0]),
        .frame_active(frame_active), .v_sync(v_sync),
        .clk(clk), .rst_n(rst_n),

        .video_modes({ui_in[6:0]})
    );
    
    audio_engine audio_engine_1 (
        .audio(audio),
        .clk(clk), .rst_n(rst_n),

        .silence(mode_toggle_audio)
    );
    
    // All output pins must be assigned. If not used, assign to 0.
    assign uo_out  = {
        h_sync, b[0], g[0], r[0],
        v_sync, b[1], g[1], r[1]
    };
    assign uio_out = {audio, 7'd0};
    assign uio_oe  = 8'b1000_0000;
    
    wire _unused = &{ena, uio_in, y[9]};
endmodule
