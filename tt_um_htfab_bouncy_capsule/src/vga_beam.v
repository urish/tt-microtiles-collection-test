`default_nettype none

module vga_beam(
  input wire clk,
  input wire rst,
  output reg [9:0] x,
  output reg [9:0] y,
  output reg hsync,
  output reg vsync,
  output wire blank
);

parameter H_FPORCH = 640;
parameter H_SYNC   = 656;
parameter H_BPORCH = 752;
parameter H_NEXT   = 799;
parameter V_FPORCH = 480;
parameter V_SYNC   = 490;
parameter V_BPORCH = 492;
parameter V_NEXT   = 524;

always @(posedge clk) begin
    if(rst || x == H_NEXT) begin
        x <= 0;
        if(rst || y == V_NEXT) begin
            y <= 0;
        end else begin
            y <= y + 1;
        end
    end else begin
        x <= x + 1;
    end
    hsync <= (x >= H_SYNC && x < H_BPORCH);
    vsync <= (y >= V_SYNC && y < V_BPORCH);
end

assign blank = (x >= H_FPORCH || y >= V_FPORCH);

endmodule
