/* Automatically generated from https://wokwi.com/projects/384804985843168257 */

`default_nettype none

module tt_um_wokwi_384804985843168257(
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
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b0;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24 = 1'b0;
  wire net25;
  wire net26;
  wire net27 = 1'b0;

  assign uo_out[0] = net9;
  assign uo_out[1] = net10;
  assign uo_out[2] = net10;
  assign uo_out[3] = net9;
  assign uo_out[4] = net9;
  assign uo_out[5] = net9;
  assign uo_out[6] = net9;
  assign uo_out[7] = net9;
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
    .a (net1),
    .b (net2),
    .out (net14)
  );
  or_cell or1 (
    .a (net7),
    .b (net8),
    .out (net15)
  );
  or_cell or2 (
    .a (net3),
    .b (net4),
    .out (net16)
  );
  and_cell and2 (
    .a (net5),
    .b (net6),
    .out (net17)
  );
  nand_cell nand2 (
    .a (net18),
    .b (net19),
    .out (net20)
  );
  nand_cell nand3 (
    .a (net19),
    .b (net18),
    .out (net21)
  );
  nand_cell nand4 (
    .a (net19),
    .b (net19),
    .out (net22)
  );
  nand_cell nand5 (
    .a (net19),
    .b (net19),
    .out (net23)
  );
  and_cell and3 (
    .a (net20),
    .b (net23),
    .out (net9)
  );
  and_cell and4 (
    .a (net21),
    .b (net22),
    .out (net25)
  );
  not_cell not1 (
    .in (net25),
    .out (net10)
  );
  nand_cell nand6 (
    .a (net16),
    .b (net15),
    .out (net19)
  );
  or_cell or3 (
    .a (net9),
    .b (net25),
    .out (net26)
  );
  xor_cell xor1 (
    .a (net14),
    .b (net17),
    .out (net18)
  );
endmodule
