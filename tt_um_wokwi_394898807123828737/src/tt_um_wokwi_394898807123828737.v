/* Automatically generated from https://wokwi.com/projects/394898807123828737 */

`default_nettype none

module tt_um_wokwi_394898807123828737(
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,    // Dedicated outputs
  input  wire [7:0] uio_in,    // IOs: Input path
  output wire [7:0] uio_out,    // IOs: Output path
  output wire [7:0] uio_oe,    // IOs: Enable path (active high: 0=input, 1=output)
  input ena,
  input clk,
  input rst_n
);
  wire net1 = clk;
  wire net2 = rst_n;
  wire net3 = ui_in[0];
  wire net4 = ui_in[1];
  wire net5 = ui_in[2];
  wire net6 = ui_in[3];
  wire net7 = ui_in[4];
  wire net8 = ui_in[5];
  wire net9 = ui_in[6];
  wire net10 = ui_in[7];
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15 = 1'b0;
  wire net16 = 1'b1;
  wire net17 = 1'b1;
  wire net18 = 1'b0;
  wire net19 = 1'b1;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24;
  wire net25;
  wire net26;
  wire net27;
  wire net28;
  wire net29;
  wire net30;
  wire net31;
  wire net32;
  wire net33;
  wire net34;
  wire net35;
  wire net36;
  wire net37;
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48;
  wire net49;
  wire net50;
  wire net51;
  wire net52;
  wire net53;
  wire net54;
  wire net55;
  wire net56;
  wire net57;
  wire net58;
  wire net59;
  wire net60;
  wire net61;
  wire net62;
  wire net63;
  wire net64;
  wire net65;
  wire net66;
  wire net67;
  wire net68;
  wire net69;
  wire net70;
  wire net71;
  wire net72;
  wire net73;
  wire net74;
  wire net75;
  wire net76;
  wire net77;

  assign uo_out[0] = net1;
  assign uo_out[1] = net2;
  assign uo_out[2] = net11;
  assign uo_out[3] = net12;
  assign uo_out[4] = net13;
  assign uo_out[5] = net14;
  assign uo_out[6] = net3;
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

  and_cell and2 (
    .a (net2),
    .b (net20),
    .out (net21)
  );
  dff_cell flop2 (
    .d (net21),
    .clk (net1),
    .q (net22)
  );
  and_cell and3 (
    .a (net2),
    .b (net22),
    .out (net23)
  );
  dff_cell flop3 (
    .d (net23),
    .clk (net1),
    .q (net24)
  );
  and_cell and4 (
    .a (net2),
    .b (net24),
    .out (net25)
  );
  dff_cell flop4 (
    .d (net25),
    .clk (net1),
    .q (net26)
  );
  and_cell and5 (
    .a (net2),
    .b (net26),
    .out (net27)
  );
  dff_cell flop5 (
    .d (net27),
    .clk (net1),
    .q (net11)
  );
  xor_cell xor1 (
    .a (net11),
    .b (net26),
    .out (net28)
  );
  not_cell not1 (
    .in (net28),
    .out (net20)
  );
  nand_cell nand1 (
    .a (net29),
    .b (net3),
    .out (net30)
  );
  nand_cell nand2 (
    .a (net3),
    .b (net22),
    .out (net31)
  );
  nand_cell nand3 (
    .a (net29),
    .b (net22),
    .out (net32)
  );
  nand_cell nand4 (
    .a (net33),
    .b (net32),
    .out (net34)
  );
  and_cell and1 (
    .a (net30),
    .b (net31),
    .out (net33)
  );
  nand_cell nand5 (
    .a (net35),
    .b (net4),
    .out (net36)
  );
  nand_cell nand6 (
    .a (net4),
    .b (net24),
    .out (net37)
  );
  nand_cell nand7 (
    .a (net35),
    .b (net24),
    .out (net38)
  );
  nand_cell nand8 (
    .a (net39),
    .b (net38),
    .out (net40)
  );
  and_cell and6 (
    .a (net36),
    .b (net37),
    .out (net39)
  );
  dff_cell flop1 (
    .d (net34),
    .clk (net1),
    .q (net35)
  );
  dff_cell flop6 (
    .d (net40),
    .clk (net1),
    .q (net41)
  );
  nand_cell nand9 (
    .a (net41),
    .b (net5),
    .out (net42)
  );
  nand_cell nand10 (
    .a (net5),
    .b (net26),
    .out (net43)
  );
  nand_cell nand11 (
    .a (net41),
    .b (net26),
    .out (net44)
  );
  nand_cell nand12 (
    .a (net45),
    .b (net44),
    .out (net46)
  );
  and_cell and7 (
    .a (net42),
    .b (net43),
    .out (net45)
  );
  dff_cell flop7 (
    .d (net46),
    .clk (net1),
    .q (net47)
  );
  nand_cell nand13 (
    .a (net47),
    .b (net6),
    .out (net48)
  );
  nand_cell nand14 (
    .a (net6),
    .b (net11),
    .out (net49)
  );
  nand_cell nand15 (
    .a (net47),
    .b (net11),
    .out (net50)
  );
  nand_cell nand16 (
    .a (net51),
    .b (net50),
    .out (net52)
  );
  and_cell and8 (
    .a (net48),
    .b (net49),
    .out (net51)
  );
  dff_cell flop8 (
    .d (net52),
    .clk (net1),
    .q (net13)
  );
  nand_cell nand17 (
    .a (net29),
    .b (net7),
    .out (net53)
  );
  nand_cell nand18 (
    .a (net7),
    .b (net22),
    .out (net54)
  );
  nand_cell nand19 (
    .a (net29),
    .b (net22),
    .out (net55)
  );
  nand_cell nand20 (
    .a (net56),
    .b (net55),
    .out (net57)
  );
  and_cell and9 (
    .a (net53),
    .b (net54),
    .out (net56)
  );
  nand_cell nand21 (
    .a (net58),
    .b (net8),
    .out (net59)
  );
  nand_cell nand22 (
    .a (net8),
    .b (net24),
    .out (net60)
  );
  nand_cell nand23 (
    .a (net58),
    .b (net24),
    .out (net61)
  );
  nand_cell nand24 (
    .a (net62),
    .b (net61),
    .out (net63)
  );
  and_cell and10 (
    .a (net59),
    .b (net60),
    .out (net62)
  );
  dff_cell flop9 (
    .d (net57),
    .clk (net1),
    .q (net58)
  );
  dff_cell flop10 (
    .d (net63),
    .clk (net1),
    .q (net64)
  );
  nand_cell nand25 (
    .a (net64),
    .b (net9),
    .out (net65)
  );
  nand_cell nand26 (
    .a (net9),
    .b (net26),
    .out (net66)
  );
  nand_cell nand27 (
    .a (net64),
    .b (net26),
    .out (net67)
  );
  nand_cell nand28 (
    .a (net68),
    .b (net67),
    .out (net69)
  );
  and_cell and11 (
    .a (net65),
    .b (net66),
    .out (net68)
  );
  dff_cell flop11 (
    .d (net69),
    .clk (net1),
    .q (net70)
  );
  nand_cell nand29 (
    .a (net70),
    .b (net10),
    .out (net71)
  );
  nand_cell nand30 (
    .a (net10),
    .b (net11),
    .out (net72)
  );
  nand_cell nand31 (
    .a (net70),
    .b (net11),
    .out (net73)
  );
  nand_cell nand32 (
    .a (net74),
    .b (net73),
    .out (net75)
  );
  and_cell and12 (
    .a (net71),
    .b (net72),
    .out (net74)
  );
  dff_cell flop12 (
    .d (net75),
    .clk (net1),
    .q (net14)
  );
  and_cell and13 (
    .a (net13),
    .b (net14),
    .out (net12)
  );
  and_cell and14 (
    .a (net2),
    .b (net76),
    .out (net77)
  );
  dff_cell flop13 (
    .d (net77),
    .clk (net1),
    .q (net29)
  );
  xor_cell xor2 (
    .a (net10),
    .b (net10),
    .out (net76)
  );
endmodule
