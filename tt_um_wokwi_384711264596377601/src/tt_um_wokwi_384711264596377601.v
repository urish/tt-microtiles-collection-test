/* Automatically generated from https://wokwi.com/projects/384711264596377601 */

`default_nettype none

module tt_um_wokwi_384711264596377601(
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,    // Dedicated outputs
  input  wire [7:0] uio_in,    // IOs: Input path
  output wire [7:0] uio_out,    // IOs: Output path
  output wire [7:0] uio_oe,    // IOs: Enable path (active high: 0=input, 1=output)
  input ena,
  input clk,
  input rst_n
);
  wire net1 = ui_in[0];
  wire net2 = ui_in[1];
  wire net3 = ui_in[2];
  wire net4 = ui_in[3];
  wire net5 = ui_in[4];
  wire net6 = ui_in[5];
  wire net7 = ui_in[6];
  wire net8;
  wire net9 = 1'b1;
  wire net10 = 1'b0;
  wire net11 = 1'b1;
  wire net12 = 1'b0;
  wire net13 = 1'b1;
  wire net14 = 1'b0;
  wire net15 = 1'b0;
  wire net16 = 1'b0;
  wire net17;
  wire net18;
  wire net19 = 1'b0;
  wire net20;
  wire net21;
  wire net22;
  wire net23 = 1'b0;
  wire net24 = 1'b0;
  wire net25 = 1'b0;

  assign uo_out[0] = net8;
  assign uo_out[1] = 0;
  assign uo_out[2] = net8;
  assign uo_out[3] = net8;
  assign uo_out[4] = net8;
  assign uo_out[5] = net8;
  assign uo_out[6] = net8;
  assign uo_out[7] = net8;
  assign uio_out[0] = 0;
  assign uio_oe[0] = 0;
  assign uio_out[1] = 0;
  assign uio_oe[1] = 0;
  assign uio_out[2] = 0;
  assign uio_oe[2] = 0;
  assign uio_out[3] = 0;
  assign uio_oe[3] = 0;
  assign uio_out[4] = 0;
  assign uio_oe[4] = 0;
  assign uio_out[5] = 0;
  assign uio_oe[5] = 0;
  assign uio_out[6] = 0;
  assign uio_oe[6] = 0;
  assign uio_out[7] = 0;
  assign uio_oe[7] = 0;

  and_cell and1 (
    .a (net2),
    .b (net7),
    .out (net17)
  );
  and_cell and2 (
    .a (net17),
    .b (net1),
    .out (net18)
  );
  and_cell and3 (
    .a (net17),
    .b (net20),
    .out (net21)
  );
  and_cell and4 (
    .a (net3),
    .b (net6),
    .out (net20)
  );
  and_cell and5 (
    .a (net1),
    .b (net21),
    .out (net22)
  );
  or_cell or1 (
    .a (net4),
    .b (net5),
    .out (net8)
  );
endmodule
