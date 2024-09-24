// SPDX-FileCopyrightText: © 2024 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module tt_um_tt08_wirecube (
    // Tiny Tapeout digital interface
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
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
    
endmodule
