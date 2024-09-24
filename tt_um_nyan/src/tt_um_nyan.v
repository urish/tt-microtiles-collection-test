`default_nettype none

module tt_um_nyan
    /* verilator lint_off UNUSED */
    (
        input wire [7:0] ui_in,
        output wire [7:0] uo_out,
        input wire [7:0] uio_in,
        output wire [7:0] uio_out,
        output wire [7:0] uio_oe,
        input wire ena,
        input wire clk,
        input wire rst_n
    );
    /* verilator lint_on UNUSED */

    assign uio_out[6:0] = 7'b0000000;
    assign uio_oe = 8'b10000000;

    graphics gfx(.clk(clk), .rst_n(rst_n), .vga_pmod(uo_out));

    music music(.clk(clk), .rst_n(rst_n), .pwm(uio_out[7]));
endmodule
