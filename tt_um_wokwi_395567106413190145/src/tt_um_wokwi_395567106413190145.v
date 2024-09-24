/* Automatically generated from https://wokwi.com/projects/395567106413190145 */

`default_nettype none

module tt_um_wokwi_395567106413190145(
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
  wire net4 = ui_in[2];
  wire net5 = ui_in[3];
  wire net6 = ui_in[4];
  wire net7 = ui_in[5];
  wire net8 = ui_in[6];
  wire net9 = ui_in[7];
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18 = uio_in[0];
  wire net19 = 1'b0;
  wire net20 = uio_in[1];
  wire net21 = 1'b0;
  wire net22;
  wire net23 = 1'b1;
  wire net24;
  wire net25;
  wire net26 = 1'b1;
  wire net27 = uio_in[5];
  wire net28 = 1'b0;
  wire net29 = uio_in[6];
  wire net30 = 1'b0;
  wire net31;
  wire net32 = 1'b0;
  wire net33 = 1'b1;
  wire net34 = 1'b1;
  wire net35 = 1'b0;
  wire net36 = 1'b1;
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
  wire net101;
  wire net102;
  wire net103;
  wire net104;
  wire net105;
  wire net106;
  wire net107;
  wire net108;
  wire net109;
  wire net110;
  wire net111;
  wire net112;
  wire net113;
  wire net114;
  wire net115;
  wire net116;
  wire net117;
  wire net118;
  wire net119;
  wire net120;
  wire net121;
  wire net122;
  wire net123;
  wire net124;
  wire net125;
  wire net126;
  wire net127;
  wire net128;
  wire net129;
  wire net130;
  wire net131;
  wire net132;
  wire net133;
  wire net134;
  wire net135;
  wire net136;
  wire net137;
  wire net138;
  wire net139;
  wire net140;
  wire net141;
  wire net142;
  wire net143;
  wire net144;
  wire net145;
  wire net146;
  wire net147;
  wire net148;
  wire net149;
  wire net150;
  wire net151;
  wire net152;
  wire net153;
  wire net154;
  wire net155;
  wire net156;

  assign uo_out[0] = net10;
  assign uo_out[1] = net11;
  assign uo_out[2] = net12;
  assign uo_out[3] = net13;
  assign uo_out[4] = net14;
  assign uo_out[5] = net15;
  assign uo_out[6] = net16;
  assign uo_out[7] = net17;
  assign uio_out[0] = net19;
  assign uio_oe[0] = net19;
  assign uio_out[1] = net21;
  assign uio_oe[1] = net21;
  assign uio_out[2] = net22;
  assign uio_oe[2] = net23;
  assign uio_out[3] = net24;
  assign uio_oe[3] = net23;
  assign uio_out[4] = net25;
  assign uio_oe[4] = net26;
  assign uio_out[5] = net28;
  assign uio_oe[5] = net28;
  assign uio_out[6] = net30;
  assign uio_oe[6] = net30;
  assign uio_out[7] = net31;
  assign uio_oe[7] = net26;

  xor_cell xor1 (
    .a (net9),
    .b (net37),
    .out (net38)
  );
  xor_cell xor2 (
    .a (net39),
    .b (net2),
    .out (net40)
  );
  nand_cell nand1 (
    .a (net9),
    .b (net37),
    .out (net41)
  );
  nand_cell nand2 (
    .a (net38),
    .b (net42),
    .out (net43)
  );
  nand_cell nand3 (
    .a (net43),
    .b (net41),
    .out (net17)
  );
  xor_cell xor3 (
    .a (net7),
    .b (net44),
    .out (net45)
  );
  xor_cell xor4 (
    .a (net46),
    .b (net47),
    .out (net48)
  );
  nand_cell nand4 (
    .a (net7),
    .b (net44),
    .out (net49)
  );
  nand_cell nand5 (
    .a (net45),
    .b (net50),
    .out (net51)
  );
  nand_cell nand6 (
    .a (net51),
    .b (net49),
    .out (net52)
  );
  xor_cell xor5 (
    .a (net5),
    .b (net53),
    .out (net46)
  );
  xor_cell xor6 (
    .a (net45),
    .b (net50),
    .out (net54)
  );
  nand_cell nand7 (
    .a (net5),
    .b (net53),
    .out (net55)
  );
  nand_cell nand8 (
    .a (net46),
    .b (net47),
    .out (net56)
  );
  nand_cell nand9 (
    .a (net56),
    .b (net55),
    .out (net57)
  );
  xor_cell xor7 (
    .a (net3),
    .b (net58),
    .out (net39)
  );
  xor_cell xor8 (
    .a (net38),
    .b (net42),
    .out (net59)
  );
  nand_cell nand10 (
    .a (net3),
    .b (net58),
    .out (net60)
  );
  nand_cell nand11 (
    .a (net39),
    .b (net2),
    .out (net61)
  );
  nand_cell nand12 (
    .a (net61),
    .b (net60),
    .out (net62)
  );
  xor_cell xor9 (
    .a (net2),
    .b (net4),
    .out (net58)
  );
  xor_cell xor10 (
    .a (net2),
    .b (net6),
    .out (net53)
  );
  xor_cell xor11 (
    .a (net2),
    .b (net8),
    .out (net44)
  );
  xor_cell xor12 (
    .a (net2),
    .b (net18),
    .out (net37)
  );
  not_cell not1 (
    .in (net40),
    .out (net63)
  );
  not_cell not2 (
    .in (net54),
    .out (net64)
  );
  not_cell not3 (
    .in (net40),
    .out (net65)
  );
  not_cell not4 (
    .in (net48),
    .out (net66)
  );
  not_cell not5 (
    .in (net54),
    .out (net67)
  );
  not_cell not6 (
    .in (net54),
    .out (net68)
  );
  not_cell not7 (
    .in (net48),
    .out (net69)
  );
  not_cell not8 (
    .in (net40),
    .out (net70)
  );
  not_cell not9 (
    .in (net54),
    .out (net71)
  );
  not_cell not10 (
    .in (net40),
    .out (net72)
  );
  not_cell not11 (
    .in (net48),
    .out (net73)
  );
  not_cell not12 (
    .in (net48),
    .out (net74)
  );
  not_cell not13 (
    .in (net40),
    .out (net75)
  );
  not_cell not14 (
    .in (net48),
    .out (net76)
  );
  not_cell not15 (
    .in (net40),
    .out (net77)
  );
  not_cell not16 (
    .in (net40),
    .out (net78)
  );
  not_cell not17 (
    .in (net54),
    .out (net79)
  );
  not_cell not18 (
    .in (net48),
    .out (net80)
  );
  not_cell not19 (
    .in (net40),
    .out (net81)
  );
  not_cell not20 (
    .in (net40),
    .out (net82)
  );
  and_cell and1 (
    .a (net64),
    .b (net63),
    .out (net83)
  );
  or_cell or1 (
    .a (net83),
    .b (net48),
    .out (net84)
  );
  and_cell and2 (
    .a (net54),
    .b (net40),
    .out (net85)
  );
  or_cell or2 (
    .a (net85),
    .b (net59),
    .out (net86)
  );
  or_cell or3 (
    .a (net84),
    .b (net86),
    .out (net10)
  );
  or_cell or4 (
    .a (net67),
    .b (net87),
    .out (net88)
  );
  and_cell and3 (
    .a (net66),
    .b (net65),
    .out (net87)
  );
  or_cell or5 (
    .a (net88),
    .b (net89),
    .out (net11)
  );
  and_cell and4 (
    .a (net48),
    .b (net40),
    .out (net89)
  );
  or_cell or6 (
    .a (net69),
    .b (net40),
    .out (net90)
  );
  or_cell or7 (
    .a (net90),
    .b (net54),
    .out (net12)
  );
  and_cell and5 (
    .a (net71),
    .b (net70),
    .out (net91)
  );
  or_cell or8 (
    .a (net91),
    .b (net92),
    .out (net93)
  );
  and_cell and6 (
    .a (net68),
    .b (net48),
    .out (net92)
  );
  or_cell or9 (
    .a (net93),
    .b (net94),
    .out (net95)
  );
  and_cell and7 (
    .a (net48),
    .b (net72),
    .out (net94)
  );
  and_cell and8 (
    .a (net96),
    .b (net40),
    .out (net97)
  );
  and_cell and9 (
    .a (net54),
    .b (net76),
    .out (net96)
  );
  or_cell or10 (
    .a (net97),
    .b (net59),
    .out (net98)
  );
  or_cell or11 (
    .a (net95),
    .b (net98),
    .out (net13)
  );
  and_cell and10 (
    .a (net79),
    .b (net81),
    .out (net99)
  );
  or_cell or12 (
    .a (net99),
    .b (net100),
    .out (net14)
  );
  and_cell and11 (
    .a (net48),
    .b (net78),
    .out (net100)
  );
  and_cell and12 (
    .a (net74),
    .b (net77),
    .out (net101)
  );
  and_cell and13 (
    .a (net54),
    .b (net80),
    .out (net102)
  );
  and_cell and14 (
    .a (net54),
    .b (net75),
    .out (net103)
  );
  or_cell or13 (
    .a (net101),
    .b (net102),
    .out (net104)
  );
  or_cell or14 (
    .a (net104),
    .b (net105),
    .out (net15)
  );
  or_cell or15 (
    .a (net103),
    .b (net59),
    .out (net105)
  );
  and_cell and15 (
    .a (net106),
    .b (net48),
    .out (net107)
  );
  and_cell and16 (
    .a (net54),
    .b (net82),
    .out (net108)
  );
  and_cell and17 (
    .a (net54),
    .b (net73),
    .out (net109)
  );
  or_cell or16 (
    .a (net110),
    .b (net111),
    .out (net16)
  );
  or_cell or17 (
    .a (net108),
    .b (net59),
    .out (net111)
  );
  or_cell or18 (
    .a (net107),
    .b (net109),
    .out (net110)
  );
  not_cell not21 (
    .in (net54),
    .out (net106)
  );
  xor_cell xor13 (
    .a (net62),
    .b (net20),
    .out (net47)
  );
  or_cell or19 (
    .a (net47),
    .b (net20),
    .out (net112)
  );
  not_cell not22 (
    .in (net112),
    .out (net113)
  );
  and_cell and18 (
    .a (net113),
    .b (net20),
    .out (net114)
  );
  xor_cell xor14 (
    .a (net57),
    .b (net114),
    .out (net50)
  );
  and_cell and19 (
    .a (net50),
    .b (net20),
    .out (net115)
  );
  xor_cell xor15 (
    .a (net52),
    .b (net115),
    .out (net42)
  );
  dff_cell flop1 (
    .d (net116),
    .clk (net1),
    .q (net117)
  );
  dff_cell flop2 (
    .d (net117),
    .clk (net1),
    .q (net118)
  );
  dff_cell flop3 (
    .d (net118),
    .clk (net1),
    .q (net119)
  );
  dff_cell flop4 (
    .d (net119),
    .clk (net1),
    .q (net120)
  );
  xor_cell xor16 (
    .a (net120),
    .b (net121),
    .out (net116)
  );
  xor_cell xor17 (
    .a (net122),
    .b (net123),
    .out (net121)
  );
  xor_cell xor18 (
    .a (net124),
    .b (net22),
    .out (net123)
  );
  dff_cell flop5 (
    .d (net120),
    .clk (net1),
    .q (net122)
  );
  dff_cell flop6 (
    .d (net122),
    .clk (net1),
    .q (net124)
  );
  dff_cell flop7 (
    .d (net124),
    .clk (net1),
    .q (net125)
  );
  dff_cell flop8 (
    .d (net125),
    .clk (net1),
    .q (net22)
  );
  dff_cell flop9 (
    .d (net126),
    .clk (net1),
    .q (net127)
  );
  dff_cell flop10 (
    .d (net127),
    .clk (net1),
    .q (net128)
  );
  dff_cell flop11 (
    .d (net128),
    .clk (net1),
    .q (net129)
  );
  dff_cell flop12 (
    .d (net129),
    .clk (net1),
    .q (net130)
  );
  xor_cell xor19 (
    .a (net130),
    .b (net131),
    .out (net126)
  );
  xor_cell xor20 (
    .a (net132),
    .b (net133),
    .out (net131)
  );
  xor_cell xor21 (
    .a (net134),
    .b (net135),
    .out (net133)
  );
  dff_cell flop13 (
    .d (net130),
    .clk (net1),
    .q (net132)
  );
  dff_cell flop14 (
    .d (net132),
    .clk (net1),
    .q (net134)
  );
  dff_cell flop15 (
    .d (net134),
    .clk (net1),
    .q (net136)
  );
  dff_cell flop16 (
    .d (net136),
    .clk (net1),
    .q (net135),
    .notq (net24)
  );
  dff_cell flop17 (
    .d (net137),
    .clk (net27),
    .q (net138)
  );
  dff_cell flop18 (
    .d (net138),
    .clk (net27),
    .q (net139)
  );
  dff_cell flop19 (
    .d (net139),
    .clk (net27),
    .q (net140)
  );
  dff_cell flop20 (
    .d (net140),
    .clk (net27),
    .q (net141)
  );
  xor_cell xor22 (
    .a (net141),
    .b (net142),
    .out (net137)
  );
  xor_cell xor23 (
    .a (net143),
    .b (net144),
    .out (net142)
  );
  xor_cell xor24 (
    .a (net145),
    .b (net25),
    .out (net144)
  );
  dff_cell flop21 (
    .d (net141),
    .clk (net27),
    .q (net143)
  );
  dff_cell flop22 (
    .d (net143),
    .clk (net27),
    .q (net145)
  );
  dff_cell flop23 (
    .d (net145),
    .clk (net27),
    .q (net146)
  );
  dff_cell flop24 (
    .d (net146),
    .clk (net27),
    .q (net25)
  );
  dff_cell flop25 (
    .d (net147),
    .clk (net29),
    .q (net148)
  );
  dff_cell flop26 (
    .d (net148),
    .clk (net29),
    .q (net149)
  );
  dff_cell flop27 (
    .d (net149),
    .clk (net29),
    .q (net150)
  );
  dff_cell flop28 (
    .d (net150),
    .clk (net29),
    .q (net151)
  );
  xor_cell xor25 (
    .a (net151),
    .b (net152),
    .out (net147)
  );
  xor_cell xor26 (
    .a (net153),
    .b (net154),
    .out (net152)
  );
  xor_cell xor27 (
    .a (net155),
    .b (net31),
    .out (net154)
  );
  dff_cell flop29 (
    .d (net151),
    .clk (net29),
    .q (net153)
  );
  dff_cell flop30 (
    .d (net153),
    .clk (net29),
    .q (net155)
  );
  dff_cell flop31 (
    .d (net155),
    .clk (net29),
    .q (net156)
  );
  dff_cell flop32 (
    .d (net156),
    .clk (net29),
    .q (net31)
  );
endmodule
