`default_nettype none
module tt_um_cfib_demo (
    output wire [2:0] r,
    output wire [3:0] g,
    output wire [2:0] b,
    output wire hsync,
    output wire vsync,
    output wire pwm,
    input  wire osc // clock
);

    wire clk;
    wire locked;

    clk_wiz_0 pll_inst(.osc(osc),.clock(clk),.locked(locked));
    
    assign r[0] = 1'b0;
    assign b[0] = 1'b0;
    assign g[1:0] = 2'b0;

    top top_inst(.clock(clk), .reset(~locked),  .hsync(hsync), .vsync(vsync),
                                                .r(r[2:1]), .g(g[3:2]), .b(b[2:1]),
                                                .pwm(pwm));

endmodule
