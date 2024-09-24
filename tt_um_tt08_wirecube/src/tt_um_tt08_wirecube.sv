// SPDX-FileCopyrightText: © 2024 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module tt_um_tt08_wirecube (
    // Tiny Tapeout digital interface
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    logic rst_n_sync;

    // Sync rst_n to negedge of clock
    always_ff @(negedge clk) begin
        rst_n_sync <= rst_n;
    end
    
    logic [5:0] rrggbb;
    logic hsync;
    logic vsync;
    logic next_vertical;
    logic next_frame;
    
    wirecube_top #(
    
    ) wirecube_top_inst (
        .clk_i      (clk),
        .rst_ni     (rst_n_sync),
        
        // Input PMOD
        .ui_in      (ui_in),

        // VGA signals
        .rrggbb_o         (rrggbb),
        .hsync_o          (hsync),
        .vsync_o          (vsync),
        .next_vertical_o  (next_vertical),
        .next_frame_o     (next_frame)
    );
    
    logic [1:0] R;
    logic [1:0] G;
    logic [1:0] B;
    
    assign R = rrggbb[5:4];
    assign G = rrggbb[3:2];
    assign B = rrggbb[1:0];
    
    // Output PMOD - Tiny VGA

    assign uo_out[0] = R[1];
    assign uo_out[1] = G[1];
    assign uo_out[2] = B[1];
    assign uo_out[3] = vsync;
    assign uo_out[4] = R[0];
    assign uo_out[5] = G[0];
    assign uo_out[6] = B[0];
    assign uo_out[7] = hsync;
    
    // Bidir PMOD - SPI and additional signals
    
    // Top row
    /*assign TODO   = uio_in[0];*/  assign uio_oe[0] = 1'b0; assign uio_out[0] = 1'b0;
    /*assign TODO   = uio_in[1];*/  assign uio_oe[1] = 1'b0; assign uio_out[1] = 1'b0;
    /*assign TODO   = uio_in[2];*/  assign uio_oe[2] = 1'b1; assign uio_out[2] = 1'b0;
    /*assign TODO   = uio_in[3];*/  assign uio_oe[3] = 1'b0; assign uio_out[3] = 1'b0;

    // Bottom row
    assign uio_out[4] = 1'b0; assign uio_oe[4] = 1'b0;
    assign uio_out[5] = 1'b0; assign uio_oe[5] = 1'b0;
    assign uio_out[6] = 1'b0; assign uio_oe[6] = 1'b0;
    assign uio_out[7] = 1'b0; assign uio_oe[7] = 1'b0;

endmodule
