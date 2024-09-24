`default_nettype none
module tt_um_cfib_demo (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire hsync, vsync, pwm;
    wire [1:0] r, g, b;
    
    assign uo_out[0] = r[1];
    assign uo_out[1] = g[1];
    assign uo_out[2] = b[1];
    assign uo_out[3] = vsync;
    assign uo_out[4] = r[0];
    assign uo_out[5] = g[0];
    assign uo_out[6] = b[0];
    assign uo_out[7] = hsync;
    
    assign uio_oe  = 8'b10000000;
    assign uio_out = {pwm, 7'b0};
    
    wire _used = &{ena, uio_in[7:0], 1'b0};
    wire reset = ~rst_n;

    top top_inst(.clock(clk), .reset(reset),  .hsync(hsync), .vsync(vsync),
                                              .r(r), .g(g), .b(b),
                                              .pwm(pwm));

endmodule
