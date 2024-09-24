/* Automatically generated from https://wokwi.com/projects/390913889347409921 */

`default_nettype none

module tt_um_wokwi_390913889347409921(
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
  wire net8 = ui_in[7];
  wire net9;
  wire net10 = 1'b1;
  wire net11 = 1'b0;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18 = 1'b0;
  wire net19 = 1'b0;
  wire net20 = 1'b0;
  wire net21;

  assign uo_out[0] = net9;
  assign uo_out[1] = 0;
  assign uo_out[2] = 0;
  assign uo_out[3] = 0;
  assign uo_out[4] = 0;
  assign uo_out[5] = 0;
  assign uo_out[6] = 0;
  assign uo_out[7] = 0;
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

  or_cell gate7 (
    .a (net5),
    .b (net7),
    .out (net12)
  );
  or_cell gate8 (
    .a (net6),
    .b (net7),
    .out (net13)
  );
  and_cell gate9 (
    .a (net2),
    .b (net3),
    .out (net14)
  );
  and_cell gate10 (
    .a (net15),
    .b (net12),
    .out (net16)
  );
  and_cell gate12 (
    .a (net17),
    .b (net8),
    .out (net9)
  );
  or_cell or1 (
    .a (net1),
    .b (net4),
    .out (net15)
  );
  or_cell or2 (
    .a (net14),
    .b (net13),
    .out (net21)
  );
  and_cell and1 (
    .a (net16),
    .b (net21),
    .out (net17)
  );
endmodule
