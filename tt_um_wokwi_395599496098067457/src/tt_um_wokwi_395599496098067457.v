/* Automatically generated from https://wokwi.com/projects/395599496098067457 */

`default_nettype none

module tt_um_wokwi_395599496098067457(
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
  wire net2 = ui_in[0];
  wire net3 = ui_in[1];
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
  wire net14 = 1'b0;
  wire net15 = 1'b1;
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

  assign uo_out[0] = net4;
  assign uo_out[1] = net5;
  assign uo_out[2] = net6;
  assign uo_out[3] = net7;
  assign uo_out[4] = net8;
  assign uo_out[5] = net9;
  assign uo_out[6] = net10;
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
    .d (net16),
    .clk (net1),
    .q (net17),
    .notq (net18)
  );
  dff_cell flop2 (
    .d (net19),
    .clk (net1),
    .q (net20)
  );
  dff_cell flop3 (
    .d (net21),
    .clk (net1),
    .q (net22),
    .notq (net23)
  );
  dff_cell flop4 (
    .d (net24),
    .clk (net1),
    .q (net25)
  );
  and_cell and1 (
    .a (net18),
    .b (net20),
    .out (net26)
  );
  and_cell and2 (
    .a (net26),
    .b (net22),
    .out (net16)
  );
  xor_cell xor1 (
    .a (net20),
    .b (net22),
    .out (net27)
  );
  and_cell and3 (
    .a (net18),
    .b (net27),
    .out (net19)
  );
  and_cell and4 (
    .a (net18),
    .b (net23),
    .out (net21)
  );
  dff_cell flop5 (
    .d (net13),
    .clk (net1),
    .q (net28),
    .notq (net29)
  );
  dff_cell flop6 (
    .d (net30),
    .clk (net1),
    .q (net31),
    .notq (net32)
  );
  dff_cell flop7 (
    .d (net33),
    .clk (net1),
    .q (net34),
    .notq (net35)
  );
  dff_cell flop8 (
    .d (net36),
    .clk (net1),
    .q (net37),
    .notq (net38)
  );
  and_cell and5 (
    .a (net31),
    .b (net29),
    .out (net39)
  );
  and_cell and6 (
    .a (net28),
    .b (net32),
    .out (net40)
  );
  and_cell and7 (
    .a (net40),
    .b (net38),
    .out (net41)
  );
  and_cell and8 (
    .a (net38),
    .b (net39),
    .out (net42)
  );
  or_cell or1 (
    .a (net41),
    .b (net42),
    .out (net30)
  );
  and_cell and9 (
    .a (net43),
    .b (net32),
    .out (net44)
  );
  and_cell and10 (
    .a (net38),
    .b (net34),
    .out (net43)
  );
  and_cell and11 (
    .a (net45),
    .b (net46),
    .out (net47)
  );
  and_cell and12 (
    .a (net43),
    .b (net29),
    .out (net48)
  );
  and_cell and13 (
    .a (net38),
    .b (net35),
    .out (net45)
  );
  and_cell and14 (
    .a (net28),
    .b (net31),
    .out (net46)
  );
  or_cell or2 (
    .a (net44),
    .b (net48),
    .out (net49)
  );
  or_cell or3 (
    .a (net49),
    .b (net47),
    .out (net33)
  );
  and_cell and15 (
    .a (net50),
    .b (net51),
    .out (net52)
  );
  and_cell and16 (
    .a (net37),
    .b (net35),
    .out (net50)
  );
  and_cell and17 (
    .a (net32),
    .b (net29),
    .out (net51)
  );
  and_cell and18 (
    .a (net38),
    .b (net34),
    .out (net53)
  );
  and_cell and19 (
    .a (net31),
    .b (net28),
    .out (net54)
  );
  and_cell and20 (
    .a (net53),
    .b (net54),
    .out (net55)
  );
  or_cell or4 (
    .a (net52),
    .b (net55),
    .out (net36)
  );
  and_cell and23 (
    .a (net3),
    .b (net56),
    .out (net57)
  );
  and_cell and26 (
    .a (net2),
    .b (net58),
    .out (net59)
  );
  not_cell not2 (
    .in (net2),
    .out (net56)
  );
  not_cell not3 (
    .in (net3),
    .out (net58)
  );
  and_cell and33 (
    .a (net17),
    .b (net59),
    .out (net60)
  );
  and_cell and34 (
    .a (net25),
    .b (net59),
    .out (net61)
  );
  and_cell and35 (
    .a (net22),
    .b (net59),
    .out (net62)
  );
  and_cell and36 (
    .a (net20),
    .b (net59),
    .out (net63)
  );
  and_cell and37 (
    .a (net37),
    .b (net57),
    .out (net64)
  );
  and_cell and38 (
    .a (net28),
    .b (net57),
    .out (net65)
  );
  and_cell and39 (
    .a (net31),
    .b (net57),
    .out (net66)
  );
  and_cell and40 (
    .a (net34),
    .b (net57),
    .out (net67)
  );
  or_cell or6 (
    .a (net60),
    .b (net64),
    .out (net68)
  );
  or_cell or10 (
    .a (net63),
    .b (net67),
    .out (net69)
  );
  or_cell or13 (
    .a (net62),
    .b (net66),
    .out (net70)
  );
  or_cell or16 (
    .a (net61),
    .b (net65),
    .out (net71)
  );
  and_cell and52 (
    .a (net69),
    .b (net71),
    .out (net72)
  );
  and_cell and53 (
    .a (net73),
    .b (net74),
    .out (net75)
  );
  or_cell or12 (
    .a (net68),
    .b (net70),
    .out (net76)
  );
  or_cell or19 (
    .a (net72),
    .b (net75),
    .out (net77)
  );
  or_cell or20 (
    .a (net76),
    .b (net77),
    .out (net4)
  );
  not_cell not5 (
    .in (net69),
    .out (net73)
  );
  not_cell not6 (
    .in (net71),
    .out (net74)
  );
  or_cell or21 (
    .a (net78),
    .b (net79),
    .out (net80)
  );
  or_cell or22 (
    .a (net75),
    .b (net81),
    .out (net82)
  );
  or_cell or23 (
    .a (net73),
    .b (net80),
    .out (net5)
  );
  and_cell and54 (
    .a (net70),
    .b (net71),
    .out (net78)
  );
  and_cell and55 (
    .a (net83),
    .b (net74),
    .out (net79)
  );
  not_cell not7 (
    .in (net70),
    .out (net83)
  );
  or_cell or24 (
    .a (net69),
    .b (net83),
    .out (net84)
  );
  or_cell or25 (
    .a (net84),
    .b (net71),
    .out (net6)
  );
  and_cell and57 (
    .a (net73),
    .b (net70),
    .out (net85)
  );
  and_cell and58 (
    .a (net86),
    .b (net71),
    .out (net87)
  );
  and_cell and59 (
    .a (net69),
    .b (net83),
    .out (net86)
  );
  and_cell and60 (
    .a (net74),
    .b (net70),
    .out (net81)
  );
  or_cell or26 (
    .a (net75),
    .b (net81),
    .out (net8)
  );
  or_cell or27 (
    .a (net68),
    .b (net79),
    .out (net88)
  );
  or_cell or28 (
    .a (net89),
    .b (net68),
    .out (net7)
  );
  or_cell or29 (
    .a (net82),
    .b (net90),
    .out (net89)
  );
  or_cell or30 (
    .a (net87),
    .b (net85),
    .out (net90)
  );
  or_cell or31 (
    .a (net88),
    .b (net86),
    .out (net91)
  );
  and_cell and61 (
    .a (net69),
    .b (net74),
    .out (net92)
  );
  or_cell or32 (
    .a (net91),
    .b (net92),
    .out (net9)
  );
  or_cell or33 (
    .a (net93),
    .b (net94),
    .out (net10)
  );
  or_cell or34 (
    .a (net85),
    .b (net81),
    .out (net94)
  );
  or_cell or35 (
    .a (net68),
    .b (net86),
    .out (net93)
  );
endmodule
