/* Automatically generated from https://wokwi.com/projects/394888799427677185 */

`default_nettype none

module tt_um_wokwi_394888799427677185(
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
  wire net15;
  wire net16;
  wire net17;
  wire net18 = 1'b1;
  wire net19 = 1'b1;
  wire net20 = 1'b0;
  wire net21 = 1'b1;
  wire net22;
  wire net23;
  wire net24;
  wire net25;
  wire net26;
  wire net27;
  wire net28 = 1'b0;
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
  wire net78;
  wire net79;
  wire net80;
  wire net81;
  wire net82;
  wire net83;
  wire net84;
  wire net85;
  wire net86;
  wire net87;
  wire net88;
  wire net89;
  wire net90;
  wire net91;
  wire net92;
  wire net93;
  wire net94;
  wire net95;
  wire net96;
  wire net97;
  wire net98;
  wire net99;
  wire net100;

  assign uo_out[0] = net11;
  assign uo_out[1] = net12;
  assign uo_out[2] = net13;
  assign uo_out[3] = net14;
  assign uo_out[4] = net15;
  assign uo_out[5] = net16;
  assign uo_out[6] = net17;
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

  dff_cell flop1 (
    .d (net22),
    .clk (net1),
    .q (net16)
  );
  dff_cell flop2 (
    .d (net23),
    .clk (net1),
    .q (net15)
  );
  dff_cell flop3 (
    .d (net24),
    .clk (net1),
    .q (net14)
  );
  dff_cell flop4 (
    .d (net25),
    .clk (net1),
    .q (net13)
  );
  and_cell and1 (
    .a (net2),
    .b (net26),
    .out (net22)
  );
  and_cell and2 (
    .a (net2),
    .b (net16),
    .out (net23)
  );
  and_cell and3 (
    .a (net2),
    .b (net15),
    .out (net24)
  );
  and_cell and4 (
    .a (net2),
    .b (net14),
    .out (net25)
  );
  not_cell not1 (
    .in (net27),
    .out (net26)
  );
  xor_cell xor1 (
    .a (net13),
    .b (net14),
    .out (net27)
  );
  not_cell not2 (
    .in (net6),
    .out (net29)
  );
  not_cell not3 (
    .in (net16),
    .out (net30)
  );
  and_cell and5 (
    .a (net29),
    .b (net16),
    .out (net31)
  );
  and_cell and6 (
    .a (net6),
    .b (net30),
    .out (net32)
  );
  or_cell or1 (
    .a (net31),
    .b (net32),
    .out (net33)
  );
  not_cell not4 (
    .in (net33),
    .out (net34)
  );
  not_cell not5 (
    .in (net5),
    .out (net35)
  );
  not_cell not6 (
    .in (net15),
    .out (net36)
  );
  and_cell and7 (
    .a (net35),
    .b (net15),
    .out (net37)
  );
  and_cell and8 (
    .a (net5),
    .b (net36),
    .out (net38)
  );
  or_cell or2 (
    .a (net37),
    .b (net38),
    .out (net39)
  );
  not_cell not7 (
    .in (net39),
    .out (net40)
  );
  not_cell not8 (
    .in (net4),
    .out (net41)
  );
  not_cell not9 (
    .in (net14),
    .out (net42)
  );
  and_cell and9 (
    .a (net41),
    .b (net14),
    .out (net43)
  );
  and_cell and10 (
    .a (net4),
    .b (net42),
    .out (net44)
  );
  or_cell or3 (
    .a (net43),
    .b (net44),
    .out (net45)
  );
  not_cell not10 (
    .in (net45),
    .out (net46)
  );
  not_cell not11 (
    .in (net3),
    .out (net47)
  );
  not_cell not12 (
    .in (net13),
    .out (net48)
  );
  and_cell and11 (
    .a (net47),
    .b (net13),
    .out (net49)
  );
  and_cell and12 (
    .a (net3),
    .b (net48),
    .out (net50)
  );
  or_cell or4 (
    .a (net49),
    .b (net50),
    .out (net51)
  );
  not_cell not13 (
    .in (net51),
    .out (net52)
  );
  and_cell and13 (
    .a (net34),
    .b (net40),
    .out (net53)
  );
  and_cell and14 (
    .a (net46),
    .b (net52),
    .out (net54)
  );
  and_cell and15 (
    .a (net53),
    .b (net54),
    .out (net55)
  );
  or_cell or5 (
    .a (net32),
    .b (net56),
    .out (net57)
  );
  or_cell or6 (
    .a (net58),
    .b (net59),
    .out (net60)
  );
  or_cell or7 (
    .a (net57),
    .b (net60),
    .out (net61)
  );
  and_cell and16 (
    .a (net34),
    .b (net38),
    .out (net56)
  );
  and_cell and17 (
    .a (net34),
    .b (net40),
    .out (net62)
  );
  and_cell and18 (
    .a (net62),
    .b (net44),
    .out (net58)
  );
  and_cell and19 (
    .a (net34),
    .b (net40),
    .out (net63)
  );
  and_cell and20 (
    .a (net46),
    .b (net50),
    .out (net64)
  );
  and_cell and21 (
    .a (net63),
    .b (net64),
    .out (net59)
  );
  or_cell or8 (
    .a (net61),
    .b (net55),
    .out (net11)
  );
  not_cell not14 (
    .in (net10),
    .out (net65)
  );
  not_cell not15 (
    .in (net16),
    .out (net66)
  );
  and_cell and22 (
    .a (net65),
    .b (net16),
    .out (net67)
  );
  and_cell and23 (
    .a (net10),
    .b (net66),
    .out (net68)
  );
  or_cell or9 (
    .a (net67),
    .b (net68),
    .out (net69)
  );
  not_cell not16 (
    .in (net69),
    .out (net70)
  );
  not_cell not17 (
    .in (net9),
    .out (net71)
  );
  not_cell not18 (
    .in (net15),
    .out (net72)
  );
  and_cell and24 (
    .a (net71),
    .b (net15),
    .out (net73)
  );
  and_cell and25 (
    .a (net9),
    .b (net72),
    .out (net74)
  );
  or_cell or10 (
    .a (net73),
    .b (net74),
    .out (net75)
  );
  not_cell not19 (
    .in (net75),
    .out (net76)
  );
  not_cell not20 (
    .in (net8),
    .out (net77)
  );
  not_cell not21 (
    .in (net14),
    .out (net78)
  );
  and_cell and26 (
    .a (net77),
    .b (net14),
    .out (net79)
  );
  and_cell and27 (
    .a (net8),
    .b (net78),
    .out (net80)
  );
  or_cell or11 (
    .a (net79),
    .b (net80),
    .out (net81)
  );
  not_cell not22 (
    .in (net81),
    .out (net82)
  );
  not_cell not23 (
    .in (net7),
    .out (net83)
  );
  not_cell not24 (
    .in (net13),
    .out (net84)
  );
  and_cell and28 (
    .a (net83),
    .b (net13),
    .out (net85)
  );
  and_cell and29 (
    .a (net7),
    .b (net84),
    .out (net86)
  );
  or_cell or12 (
    .a (net85),
    .b (net86),
    .out (net87)
  );
  not_cell not25 (
    .in (net87),
    .out (net88)
  );
  and_cell and30 (
    .a (net70),
    .b (net76),
    .out (net89)
  );
  and_cell and31 (
    .a (net82),
    .b (net88),
    .out (net90)
  );
  and_cell and32 (
    .a (net89),
    .b (net90),
    .out (net91)
  );
  or_cell or13 (
    .a (net68),
    .b (net92),
    .out (net93)
  );
  or_cell or14 (
    .a (net94),
    .b (net95),
    .out (net96)
  );
  or_cell or15 (
    .a (net93),
    .b (net96),
    .out (net97)
  );
  and_cell and33 (
    .a (net70),
    .b (net74),
    .out (net92)
  );
  and_cell and34 (
    .a (net70),
    .b (net76),
    .out (net98)
  );
  and_cell and35 (
    .a (net98),
    .b (net80),
    .out (net94)
  );
  and_cell and36 (
    .a (net70),
    .b (net76),
    .out (net99)
  );
  and_cell and37 (
    .a (net82),
    .b (net86),
    .out (net100)
  );
  and_cell and38 (
    .a (net99),
    .b (net100),
    .out (net95)
  );
  or_cell or16 (
    .a (net97),
    .b (net91),
    .out (net12)
  );
  and_cell and39 (
    .a (net11),
    .b (net12),
    .out (net17)
  );
endmodule
