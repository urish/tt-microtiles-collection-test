`default_nettype none

module tt_um_wokwi_395614106833794049 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;

assign {h, g, f, e, d, c, b, a} = ui_in;
assign {p, o, n, m, l, k, j, i} = uio_in;

wire s = (a&~b)^c^d;

wire t = (((a^~b)&c)|(d^e))^((d|~a)&b)^f;

wire u = (((a&~b)^c^d)&(c|e|a))^((b^a^f)|(d&~c));

wire v = (((a&~b)^c^d)&(c|e|~a))^((b^a)|(d&~c)|e);

wire w = ((((a|b)&(c|~d))^(e&f)^(g&h))&(((f^d)|(i^~h))^(g|b)^(~h|b)))^
         ((((e|~g)^j^f)&(e|~g)&(e^~b))|((a^b)&~j&~c)|(j&~i)|h|d)^
         ((((a^d)&c&~f)^(e|~g)^(h&~b))&((a&~b)|j|g)&(g|f)&~e&i)^
         (((j&~g)|(a^~b))&((i&d)|~a|~f))^((~c|i)&(i|b))^((j|f)&~h&a);

wire x = ~(e&f);

wire y = (g&~h)^i^j;

wire z = (((k^~l)&m)|(n^o))^((n|~k)&l)^p;

assign uo_out = {z, y, x, w, v, u, t, s};
assign uio_out = 8'b0;
assign uio_oe = 8'b0;

endmodule
