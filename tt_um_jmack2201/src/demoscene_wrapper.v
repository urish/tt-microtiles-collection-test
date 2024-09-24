module demoscene_wrapper (
    input clk, rst_n,
    input [7:0] vga_control,
    output [1:0] vga_r, vga_b, vga_g,
    output hsync, vsync
);
    reg [9:0] h_count, v_count;
    reg visible;

    hvsync_generator vga (
        .clk(clk),
        .reset(~rst_n),
        .hpos(h_count),
        .vpos(v_count),
        .display_on(visible),
        .hsync(hsync),
        .vsync(vsync)
    );

    pixel_color pixel (
        .clk(clk),
        .visible(visible),
        .hpos(h_count),
        .vpos(v_count),
        .hsync(hsync),
        .vsync(vsync),
        .rst_n(rst_n),
        .vga_control(vga_control),
        .R(vga_r),
        .G(vga_g),
        .B(vga_b)
    );

endmodule