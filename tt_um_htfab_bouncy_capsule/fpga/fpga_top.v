`default_nettype none

module fpga_top(
    input wire clk,
    input wire btnC,
    input wire btnU,
    input wire btnL,
    input wire btnR,
    input wire btnD,
    input wire [15:0] sw,
    output wire [15:0] led,
    output wire [7:0] JB,
    output wire [7:0] JC,
    output wire [3:0] vgaRed,
    output wire [3:0] vgaGreen,
    output wire [3:0] vgaBlue,
    output wire hsync,
    output wire vsync
);

reg rst_n;
reg clk_vga;
reg clk_int;

initial begin
    rst_n <= 0;
end

always @(posedge clk) begin
    {clk_vga, clk_int} <= {clk_vga, clk_int} + 1;
end

always @(posedge clk_vga) begin
    rst_n <= ~btnC;
end

wire [7:0] uo_out;
wire [7:0] uio_out;
wire [7:0] uio_oe;

tt_um_htfab_bouncy_capsule i_project(
    .ui_in(sw[7:0]),
    .uo_out(uo_out),
    .uio_in(sw[15:8]),
    .uio_out(uio_out),
    .uio_oe(uio_oe),
    .ena(1'b1),
    .clk(clk_vga),
    .rst_n(rst_n)
);

wire [1:0] R;
wire [1:0] G;
wire [1:0] B;
assign {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]} = uo_out;

assign JB = uo_out;
assign JC = uio_out;
assign vgaRed = {R, R};
assign vgaGreen = {G, G};
assign vgaBlue = {B, B};

assign led = sw;

endmodule
