/* Automatically generated from https://wokwi.com/projects/395034561853515777 */

`default_nettype none

module tt_um_wokwi_395034561853515777(
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
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15 = 1'b1;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
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
  wire net127 = 1'b0;

  assign uo_out[0] = net8;
  assign uo_out[1] = net9;
  assign uo_out[2] = net10;
  assign uo_out[3] = net11;
  assign uo_out[4] = net12;
  assign uo_out[5] = net13;
  assign uo_out[6] = net14;
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

  and_cell and1 (
    .a (net1),
    .b (net16),
    .out (net17)
  );
  and_cell and2 (
    .a (net2),
    .b (net16),
    .out (net18)
  );
  and_cell and3 (
    .a (net3),
    .b (net16),
    .out (net19)
  );
  and_cell and4 (
    .a (net4),
    .b (net16),
    .out (net20)
  );
  and_cell and5 (
    .a (net5),
    .b (net21),
    .out (net22)
  );
  and_cell and6 (
    .a (net22),
    .b (net23),
    .out (net16)
  );
  and_cell and7 (
    .a (net6),
    .b (net24),
    .out (net25)
  );
  and_cell and8 (
    .a (net7),
    .b (net23),
    .out (net26)
  );
  and_cell and9 (
    .a (net17),
    .b (net19),
    .out (net27)
  );
  and_cell and10 (
    .a (net18),
    .b (net19),
    .out (net28)
  );
  and_cell and11 (
    .a (net17),
    .b (net20),
    .out (net29)
  );
  and_cell and12 (
    .a (net18),
    .b (net20),
    .out (net30)
  );
  xor_cell xor1 (
    .a (net28),
    .b (net29),
    .out (net31)
  );
  and_cell and13 (
    .a (net28),
    .b (net29),
    .out (net32)
  );
  xor_cell xor2 (
    .a (net32),
    .b (net30),
    .out (net33)
  );
  and_cell and14 (
    .a (net32),
    .b (net30),
    .out (net34)
  );
  and_cell and15 (
    .a (net25),
    .b (net21),
    .out (net35)
  );
  and_cell and16 (
    .a (net1),
    .b (net35),
    .out (net36)
  );
  and_cell and17 (
    .a (net2),
    .b (net35),
    .out (net37)
  );
  and_cell and18 (
    .a (net3),
    .b (net35),
    .out (net38)
  );
  and_cell and19 (
    .a (net4),
    .b (net35),
    .out (net39)
  );
  xor_cell xor3 (
    .a (net36),
    .b (net38),
    .out (net40)
  );
  and_cell and20 (
    .a (net36),
    .b (net38),
    .out (net41)
  );
  xor_cell xor4 (
    .a (net41),
    .b (net37),
    .out (net42)
  );
  and_cell and21 (
    .a (net41),
    .b (net37),
    .out (net43)
  );
  xor_cell xor5 (
    .a (net42),
    .b (net39),
    .out (net44)
  );
  and_cell and22 (
    .a (net42),
    .b (net39),
    .out (net45)
  );
  or_cell or1 (
    .a (net43),
    .b (net45),
    .out (net46)
  );
  and_cell and23 (
    .a (net26),
    .b (net24),
    .out (net47)
  );
  and_cell and24 (
    .a (net1),
    .b (net47),
    .out (net48)
  );
  and_cell and25 (
    .a (net2),
    .b (net47),
    .out (net49)
  );
  and_cell and26 (
    .a (net3),
    .b (net47),
    .out (net50)
  );
  and_cell and27 (
    .a (net4),
    .b (net47),
    .out (net51)
  );
  xor_cell xor6 (
    .a (net48),
    .b (net50),
    .out (net52)
  );
  not_cell not5 (
    .in (net48),
    .out (net53)
  );
  and_cell and28 (
    .a (net53),
    .b (net50),
    .out (net54)
  );
  not_cell not6 (
    .in (net5),
    .out (net24)
  );
  not_cell not7 (
    .in (net6),
    .out (net23)
  );
  not_cell not8 (
    .in (net7),
    .out (net21)
  );
  xor_cell xor7 (
    .a (net54),
    .b (net49),
    .out (net55)
  );
  xor_cell xor8 (
    .a (net55),
    .b (net51),
    .out (net56)
  );
  and_cell and29 (
    .a (net57),
    .b (net51),
    .out (net58)
  );
  not_cell not9 (
    .in (net55),
    .out (net57)
  );
  or_cell or2 (
    .a (net27),
    .b (net40),
    .out (net59)
  );
  or_cell or3 (
    .a (net59),
    .b (net52),
    .out (net60)
  );
  or_cell or4 (
    .a (net31),
    .b (net44),
    .out (net61)
  );
  or_cell or5 (
    .a (net61),
    .b (net56),
    .out (net62)
  );
  or_cell or6 (
    .a (net33),
    .b (net46),
    .out (net63)
  );
  or_cell or7 (
    .a (net63),
    .b (net58),
    .out (net64)
  );
  not_cell not10 (
    .in (net60),
    .out (net65)
  );
  not_cell not11 (
    .in (net62),
    .out (net66)
  );
  not_cell not12 (
    .in (net64),
    .out (net67)
  );
  not_cell not13 (
    .in (net34),
    .out (net68)
  );
  and_cell and30 (
    .a (net62),
    .b (net68),
    .out (net69)
  );
  and_cell and31 (
    .a (net60),
    .b (net64),
    .out (net70)
  );
  and_cell and32 (
    .a (net70),
    .b (net68),
    .out (net71)
  );
  and_cell and33 (
    .a (net66),
    .b (net67),
    .out (net72)
  );
  and_cell and34 (
    .a (net72),
    .b (net34),
    .out (net73)
  );
  or_cell or8 (
    .a (net69),
    .b (net71),
    .out (net74)
  );
  or_cell or9 (
    .a (net74),
    .b (net73),
    .out (net8)
  );
  and_cell and35 (
    .a (net60),
    .b (net67),
    .out (net75)
  );
  and_cell and36 (
    .a (net75),
    .b (net68),
    .out (net76)
  );
  and_cell and37 (
    .a (net62),
    .b (net67),
    .out (net77)
  );
  and_cell and38 (
    .a (net77),
    .b (net68),
    .out (net78)
  );
  and_cell and39 (
    .a (net60),
    .b (net62),
    .out (net79)
  );
  and_cell and40 (
    .a (net79),
    .b (net68),
    .out (net80)
  );
  and_cell and41 (
    .a (net65),
    .b (net66),
    .out (net81)
  );
  and_cell and42 (
    .a (net81),
    .b (net64),
    .out (net82)
  );
  and_cell and43 (
    .a (net66),
    .b (net67),
    .out (net83)
  );
  and_cell and44 (
    .a (net83),
    .b (net34),
    .out (net84)
  );
  and_cell and45 (
    .a (net82),
    .b (net68),
    .out (net85)
  );
  or_cell or10 (
    .a (net76),
    .b (net78),
    .out (net86)
  );
  or_cell or11 (
    .a (net80),
    .b (net85),
    .out (net87)
  );
  or_cell or12 (
    .a (net87),
    .b (net84),
    .out (net88)
  );
  or_cell or13 (
    .a (net86),
    .b (net88),
    .out (net9)
  );
  and_cell and46 (
    .a (net60),
    .b (net68),
    .out (net89)
  );
  and_cell and47 (
    .a (net64),
    .b (net68),
    .out (net90)
  );
  and_cell and48 (
    .a (net66),
    .b (net67),
    .out (net91)
  );
  and_cell and49 (
    .a (net91),
    .b (net34),
    .out (net92)
  );
  or_cell or14 (
    .a (net89),
    .b (net90),
    .out (net93)
  );
  or_cell or15 (
    .a (net93),
    .b (net92),
    .out (net10)
  );
  and_cell and50 (
    .a (net62),
    .b (net67),
    .out (net94)
  );
  and_cell and51 (
    .a (net94),
    .b (net68),
    .out (net95)
  );
  and_cell and52 (
    .a (net65),
    .b (net62),
    .out (net96)
  );
  and_cell and53 (
    .a (net96),
    .b (net68),
    .out (net97)
  );
  and_cell and54 (
    .a (net60),
    .b (net66),
    .out (net98)
  );
  and_cell and55 (
    .a (net98),
    .b (net64),
    .out (net99)
  );
  and_cell and56 (
    .a (net99),
    .b (net68),
    .out (net100)
  );
  and_cell and57 (
    .a (net66),
    .b (net67),
    .out (net101)
  );
  and_cell and58 (
    .a (net101),
    .b (net34),
    .out (net102)
  );
  or_cell or16 (
    .a (net95),
    .b (net97),
    .out (net103)
  );
  or_cell or17 (
    .a (net100),
    .b (net102),
    .out (net104)
  );
  or_cell or18 (
    .a (net103),
    .b (net104),
    .out (net11)
  );
  and_cell and59 (
    .a (net65),
    .b (net62),
    .out (net105)
  );
  and_cell and60 (
    .a (net66),
    .b (net65),
    .out (net106)
  );
  and_cell and61 (
    .a (net105),
    .b (net68),
    .out (net107)
  );
  and_cell and62 (
    .a (net106),
    .b (net67),
    .out (net108)
  );
  and_cell and63 (
    .a (net108),
    .b (net34),
    .out (net109)
  );
  or_cell or19 (
    .a (net107),
    .b (net109),
    .out (net12)
  );
  and_cell and64 (
    .a (net66),
    .b (net64),
    .out (net110)
  );
  and_cell and65 (
    .a (net110),
    .b (net68),
    .out (net111)
  );
  and_cell and66 (
    .a (net65),
    .b (net64),
    .out (net112)
  );
  and_cell and67 (
    .a (net112),
    .b (net68),
    .out (net113)
  );
  or_cell or20 (
    .a (net111),
    .b (net113),
    .out (net114)
  );
  and_cell and68 (
    .a (net66),
    .b (net67),
    .out (net115)
  );
  and_cell and69 (
    .a (net115),
    .b (net34),
    .out (net116)
  );
  or_cell or21 (
    .a (net114),
    .b (net116),
    .out (net13)
  );
  and_cell and70 (
    .a (net62),
    .b (net67),
    .out (net117)
  );
  and_cell and71 (
    .a (net117),
    .b (net68),
    .out (net118)
  );
  and_cell and72 (
    .a (net65),
    .b (net62),
    .out (net119)
  );
  and_cell and73 (
    .a (net119),
    .b (net68),
    .out (net120)
  );
  and_cell and74 (
    .a (net64),
    .b (net66),
    .out (net121)
  );
  and_cell and75 (
    .a (net121),
    .b (net68),
    .out (net122)
  );
  and_cell and76 (
    .a (net67),
    .b (net66),
    .out (net123)
  );
  and_cell and77 (
    .a (net123),
    .b (net34),
    .out (net124)
  );
  or_cell or22 (
    .a (net122),
    .b (net124),
    .out (net125)
  );
  or_cell or23 (
    .a (net118),
    .b (net120),
    .out (net126)
  );
  or_cell or24 (
    .a (net126),
    .b (net125),
    .out (net14)
  );
endmodule
