/* Automatically generated from https://wokwi.com/projects/394640918790880257 */

`default_nettype none

module tt_um_wokwi_394640918790880257(
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
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16 = 1'b1;
  wire net17 = 1'b1;
  wire net18 = 1'b0;
  wire net19 = 1'b0;
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
  wire net157;
  wire net158;
  wire net159;
  wire net160;
  wire net161;
  wire net162;
  wire net163;
  wire net164;
  wire net165;
  wire net166;
  wire net167;
  wire net168;
  wire net169;
  wire net170;
  wire net171;
  wire net172;
  wire net173;
  wire net174;
  wire net175;
  wire net176;
  wire net177;
  wire net178;
  wire net179;
  wire net180;
  wire net181;
  wire net182;
  wire net183;
  wire net184;
  wire net185;
  wire net186;
  wire net187;
  wire net188;
  wire net189;
  wire net190;
  wire net191;
  wire net192;
  wire net193;
  wire net194;
  wire net195;
  wire net196;
  wire net197;
  wire net198;
  wire net199;
  wire net200;
  wire net201;
  wire net202;
  wire net203 = 1'b0;
  wire net204;
  wire net205;
  wire net206;
  wire net207;
  wire net208;
  wire net209;
  wire net210;
  wire net211;
  wire net212;
  wire net213;
  wire net214;
  wire net215;
  wire net216;
  wire net217;
  wire net218;
  wire net219;
  wire net220;
  wire net221;
  wire net222;
  wire net223;

  assign uo_out[0] = net9;
  assign uo_out[1] = net10;
  assign uo_out[2] = net11;
  assign uo_out[3] = net12;
  assign uo_out[4] = 0;
  assign uo_out[5] = net13;
  assign uo_out[6] = net14;
  assign uo_out[7] = net15;
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

  dffsr_cell flop2 (
    .d (net20),
    .clk (net21),
    .s (net4),
    .r (net3),
    .q (net9),
    .notq (net22)
  );
  dffsr_cell flop3 (
    .d (net9),
    .clk (net21),
    .s (net4),
    .r (net3),
    .q (net10),
    .notq (net23)
  );
  dffsr_cell flop4 (
    .d (net10),
    .clk (net21),
    .s (net4),
    .r (net3),
    .q (net11),
    .notq (net24)
  );
  or_cell or2 (
    .a (net25),
    .b (net9),
    .out (net26)
  );
  or_cell or3 (
    .a (net11),
    .b (net10),
    .out (net25)
  );
  or_cell or4 (
    .a (net5),
    .b (net27),
    .out (net28)
  );
  or_cell or5 (
    .a (net6),
    .b (net29),
    .out (net27)
  );
  and_cell and1 (
    .a (net30),
    .b (net1),
    .out (net21)
  );
  dffsr_cell flop5 (
    .d (net11),
    .clk (net21),
    .s (net4),
    .r (net3),
    .q (net12),
    .notq (net31)
  );
  and_cell and3 (
    .a (net15),
    .b (net28),
    .out (net32)
  );
  dffsr_cell flop6 (
    .d (net4),
    .clk (net1),
    .s (net32),
    .r (net33),
    .q (net34)
  );
  or_cell or7 (
    .a (net3),
    .b (net35),
    .out (net33)
  );
  dffsr_cell flop7 (
    .d (net9),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net37)
  );
  dffsr_cell flop8 (
    .d (net10),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net38)
  );
  dffsr_cell flop9 (
    .d (net11),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net39)
  );
  dffsr_cell flop10 (
    .d (net12),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net40)
  );
  dffsr_cell flop11 (
    .d (net5),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net41)
  );
  dffsr_cell flop12 (
    .d (net6),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net42)
  );
  dffsr_cell flop13 (
    .d (net7),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net43)
  );
  dffsr_cell flop14 (
    .d (net8),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net44)
  );
  dffsr_cell flop23 (
    .d (net37),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net45)
  );
  dffsr_cell flop24 (
    .d (net38),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net46)
  );
  dffsr_cell flop25 (
    .d (net39),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net47)
  );
  dffsr_cell flop26 (
    .d (net40),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net48)
  );
  dffsr_cell flop27 (
    .d (net41),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net49)
  );
  dffsr_cell flop28 (
    .d (net42),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net50)
  );
  dffsr_cell flop29 (
    .d (net43),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net51)
  );
  dffsr_cell flop30 (
    .d (net44),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net52)
  );
  not_cell not3 (
    .in (net28),
    .out (net35)
  );
  dffsr_cell flop15 (
    .d (net9),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net54)
  );
  dffsr_cell flop16 (
    .d (net10),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net55)
  );
  dffsr_cell flop17 (
    .d (net11),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net56)
  );
  dffsr_cell flop18 (
    .d (net12),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net57)
  );
  dffsr_cell flop19 (
    .d (net5),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net58)
  );
  dffsr_cell flop20 (
    .d (net6),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net59)
  );
  dffsr_cell flop21 (
    .d (net7),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net60)
  );
  dffsr_cell flop22 (
    .d (net8),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net61)
  );
  dffsr_cell flop31 (
    .d (net54),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net62)
  );
  dffsr_cell flop32 (
    .d (net55),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net63)
  );
  dffsr_cell flop33 (
    .d (net56),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net64)
  );
  dffsr_cell flop34 (
    .d (net57),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net65)
  );
  dffsr_cell flop35 (
    .d (net58),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net66)
  );
  dffsr_cell flop36 (
    .d (net59),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net67)
  );
  dffsr_cell flop37 (
    .d (net60),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net68)
  );
  dffsr_cell flop38 (
    .d (net61),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net69)
  );
  dffsr_cell flop39 (
    .d (net45),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net70)
  );
  dffsr_cell flop40 (
    .d (net46),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net71)
  );
  dffsr_cell flop41 (
    .d (net47),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net72)
  );
  dffsr_cell flop42 (
    .d (net48),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net73)
  );
  dffsr_cell flop43 (
    .d (net49),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net74)
  );
  dffsr_cell flop44 (
    .d (net50),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net75)
  );
  dffsr_cell flop45 (
    .d (net51),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net76)
  );
  dffsr_cell flop46 (
    .d (net52),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net77)
  );
  dffsr_cell flop47 (
    .d (net70),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net78)
  );
  dffsr_cell flop48 (
    .d (net71),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net79)
  );
  dffsr_cell flop49 (
    .d (net72),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net80)
  );
  dffsr_cell flop50 (
    .d (net73),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net81)
  );
  dffsr_cell flop51 (
    .d (net74),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net82)
  );
  dffsr_cell flop52 (
    .d (net75),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net83)
  );
  dffsr_cell flop53 (
    .d (net76),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net84)
  );
  dffsr_cell flop54 (
    .d (net77),
    .clk (net36),
    .s (net4),
    .r (net3),
    .q (net85)
  );
  dffsr_cell flop55 (
    .d (net62),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net86)
  );
  dffsr_cell flop56 (
    .d (net63),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net87)
  );
  dffsr_cell flop57 (
    .d (net64),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net88)
  );
  dffsr_cell flop58 (
    .d (net65),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net89)
  );
  dffsr_cell flop59 (
    .d (net66),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net90)
  );
  dffsr_cell flop60 (
    .d (net67),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net91)
  );
  dffsr_cell flop61 (
    .d (net68),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net92)
  );
  dffsr_cell flop62 (
    .d (net69),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net93)
  );
  dffsr_cell flop63 (
    .d (net86),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net94)
  );
  dffsr_cell flop64 (
    .d (net87),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net95)
  );
  dffsr_cell flop65 (
    .d (net88),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net96)
  );
  dffsr_cell flop66 (
    .d (net89),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net97)
  );
  dffsr_cell flop67 (
    .d (net90),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net98)
  );
  dffsr_cell flop68 (
    .d (net91),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net99)
  );
  dffsr_cell flop69 (
    .d (net92),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net100)
  );
  dffsr_cell flop70 (
    .d (net93),
    .clk (net53),
    .s (net4),
    .r (net3),
    .q (net101)
  );
  xor_cell xor4 (
    .a (net44),
    .b (net61),
    .out (net102)
  );
  xor_cell xor5 (
    .a (net43),
    .b (net60),
    .out (net103)
  );
  xor_cell xor6 (
    .a (net42),
    .b (net59),
    .out (net104)
  );
  xor_cell xor7 (
    .a (net41),
    .b (net58),
    .out (net105)
  );
  xor_cell xor8 (
    .a (net40),
    .b (net57),
    .out (net106)
  );
  xor_cell xor9 (
    .a (net39),
    .b (net56),
    .out (net107)
  );
  xor_cell xor10 (
    .a (net38),
    .b (net55),
    .out (net108)
  );
  xor_cell xor11 (
    .a (net37),
    .b (net54),
    .out (net109)
  );
  not_cell not4 (
    .in (net102),
    .out (net110)
  );
  not_cell not5 (
    .in (net103),
    .out (net111)
  );
  not_cell not6 (
    .in (net104),
    .out (net112)
  );
  not_cell not7 (
    .in (net105),
    .out (net113)
  );
  not_cell not8 (
    .in (net106),
    .out (net114)
  );
  not_cell not9 (
    .in (net107),
    .out (net115)
  );
  not_cell not10 (
    .in (net108),
    .out (net116)
  );
  not_cell not11 (
    .in (net109),
    .out (net117)
  );
  and_cell and4 (
    .a (net111),
    .b (net110),
    .out (net118)
  );
  and_cell and5 (
    .a (net113),
    .b (net112),
    .out (net119)
  );
  and_cell and6 (
    .a (net115),
    .b (net114),
    .out (net120)
  );
  and_cell and7 (
    .a (net117),
    .b (net116),
    .out (net121)
  );
  and_cell and8 (
    .a (net119),
    .b (net118),
    .out (net122)
  );
  and_cell and9 (
    .a (net121),
    .b (net120),
    .out (net123)
  );
  and_cell and10 (
    .a (net123),
    .b (net122),
    .out (net124)
  );
  xor_cell xor12 (
    .a (net52),
    .b (net69),
    .out (net125)
  );
  xor_cell xor13 (
    .a (net51),
    .b (net68),
    .out (net126)
  );
  xor_cell xor14 (
    .a (net50),
    .b (net67),
    .out (net127)
  );
  xor_cell xor15 (
    .a (net49),
    .b (net66),
    .out (net128)
  );
  xor_cell xor16 (
    .a (net48),
    .b (net65),
    .out (net129)
  );
  xor_cell xor17 (
    .a (net47),
    .b (net64),
    .out (net130)
  );
  xor_cell xor18 (
    .a (net46),
    .b (net63),
    .out (net131)
  );
  xor_cell xor19 (
    .a (net45),
    .b (net62),
    .out (net132)
  );
  not_cell not12 (
    .in (net125),
    .out (net133)
  );
  not_cell not13 (
    .in (net126),
    .out (net134)
  );
  not_cell not14 (
    .in (net127),
    .out (net135)
  );
  not_cell not15 (
    .in (net128),
    .out (net136)
  );
  not_cell not16 (
    .in (net129),
    .out (net137)
  );
  not_cell not17 (
    .in (net130),
    .out (net138)
  );
  not_cell not18 (
    .in (net131),
    .out (net139)
  );
  not_cell not19 (
    .in (net132),
    .out (net140)
  );
  and_cell and11 (
    .a (net134),
    .b (net133),
    .out (net141)
  );
  and_cell and12 (
    .a (net136),
    .b (net135),
    .out (net142)
  );
  and_cell and13 (
    .a (net138),
    .b (net137),
    .out (net143)
  );
  and_cell and14 (
    .a (net140),
    .b (net139),
    .out (net144)
  );
  and_cell and15 (
    .a (net142),
    .b (net141),
    .out (net145)
  );
  and_cell and16 (
    .a (net144),
    .b (net143),
    .out (net146)
  );
  and_cell and17 (
    .a (net146),
    .b (net145),
    .out (net147)
  );
  xor_cell xor20 (
    .a (net77),
    .b (net93),
    .out (net148)
  );
  xor_cell xor21 (
    .a (net76),
    .b (net92),
    .out (net149)
  );
  xor_cell xor22 (
    .a (net75),
    .b (net91),
    .out (net150)
  );
  xor_cell xor23 (
    .a (net74),
    .b (net90),
    .out (net151)
  );
  xor_cell xor24 (
    .a (net73),
    .b (net89),
    .out (net152)
  );
  xor_cell xor25 (
    .a (net72),
    .b (net88),
    .out (net153)
  );
  xor_cell xor26 (
    .a (net71),
    .b (net87),
    .out (net154)
  );
  xor_cell xor27 (
    .a (net70),
    .b (net86),
    .out (net155)
  );
  not_cell not20 (
    .in (net148),
    .out (net156)
  );
  not_cell not21 (
    .in (net149),
    .out (net157)
  );
  not_cell not22 (
    .in (net150),
    .out (net158)
  );
  not_cell not23 (
    .in (net151),
    .out (net159)
  );
  not_cell not24 (
    .in (net152),
    .out (net160)
  );
  not_cell not25 (
    .in (net153),
    .out (net161)
  );
  not_cell not26 (
    .in (net154),
    .out (net162)
  );
  not_cell not27 (
    .in (net155),
    .out (net163)
  );
  and_cell and18 (
    .a (net157),
    .b (net156),
    .out (net164)
  );
  and_cell and19 (
    .a (net159),
    .b (net158),
    .out (net165)
  );
  and_cell and20 (
    .a (net161),
    .b (net160),
    .out (net166)
  );
  and_cell and21 (
    .a (net163),
    .b (net162),
    .out (net167)
  );
  and_cell and22 (
    .a (net165),
    .b (net164),
    .out (net168)
  );
  and_cell and23 (
    .a (net167),
    .b (net166),
    .out (net169)
  );
  and_cell and24 (
    .a (net169),
    .b (net168),
    .out (net170)
  );
  xor_cell xor28 (
    .a (net85),
    .b (net101),
    .out (net171)
  );
  xor_cell xor29 (
    .a (net84),
    .b (net100),
    .out (net172)
  );
  xor_cell xor30 (
    .a (net83),
    .b (net99),
    .out (net173)
  );
  xor_cell xor31 (
    .a (net82),
    .b (net98),
    .out (net174)
  );
  xor_cell xor32 (
    .a (net81),
    .b (net97),
    .out (net175)
  );
  xor_cell xor33 (
    .a (net80),
    .b (net96),
    .out (net176)
  );
  xor_cell xor34 (
    .a (net79),
    .b (net95),
    .out (net177)
  );
  xor_cell xor35 (
    .a (net78),
    .b (net94),
    .out (net178)
  );
  not_cell not28 (
    .in (net171),
    .out (net179)
  );
  not_cell not29 (
    .in (net172),
    .out (net180)
  );
  not_cell not30 (
    .in (net173),
    .out (net181)
  );
  not_cell not31 (
    .in (net174),
    .out (net182)
  );
  not_cell not32 (
    .in (net175),
    .out (net183)
  );
  not_cell not33 (
    .in (net176),
    .out (net184)
  );
  not_cell not34 (
    .in (net177),
    .out (net185)
  );
  not_cell not35 (
    .in (net178),
    .out (net186)
  );
  and_cell and25 (
    .a (net180),
    .b (net179),
    .out (net187)
  );
  and_cell and26 (
    .a (net182),
    .b (net181),
    .out (net188)
  );
  and_cell and27 (
    .a (net184),
    .b (net183),
    .out (net189)
  );
  and_cell and28 (
    .a (net186),
    .b (net185),
    .out (net190)
  );
  and_cell and29 (
    .a (net188),
    .b (net187),
    .out (net191)
  );
  and_cell and30 (
    .a (net190),
    .b (net189),
    .out (net192)
  );
  and_cell and31 (
    .a (net192),
    .b (net191),
    .out (net193)
  );
  dffsr_cell flop71 (
    .d (net4),
    .clk (net1),
    .s (net14),
    .r (net3),
    .q (net194),
    .notq (net195)
  );
  and_cell and32 (
    .a (net34),
    .b (net195),
    .out (net196)
  );
  and_cell and33 (
    .a (net194),
    .b (net34),
    .out (net197)
  );
  or_cell or8 (
    .a (net198),
    .b (net199),
    .out (net14)
  );
  or_cell or9 (
    .a (net80),
    .b (net81),
    .out (net199)
  );
  or_cell or10 (
    .a (net78),
    .b (net79),
    .out (net198)
  );
  and_cell and34 (
    .a (net147),
    .b (net124),
    .out (net200)
  );
  and_cell and35 (
    .a (net193),
    .b (net170),
    .out (net201)
  );
  and_cell and36 (
    .a (net201),
    .b (net200),
    .out (net202)
  );
  or_cell or6 (
    .a (net8),
    .b (net7),
    .out (net29)
  );
  and_cell and37 (
    .a (net14),
    .b (net202),
    .out (net13)
  );
  mux_cell mux1 (
    .a (net2),
    .b (net4),
    .sel (net204),
    .out (net20)
  );
  or_cell or1 (
    .a (net26),
    .b (net12),
    .out (net204)
  );
  and_cell and2 (
    .a (net205),
    .b (net23),
    .out (net206)
  );
  and_cell and42 (
    .a (net24),
    .b (net31),
    .out (net207)
  );
  and_cell and43 (
    .a (net206),
    .b (net207),
    .out (net208)
  );
  and_cell and44 (
    .a (net22),
    .b (net209),
    .out (net210)
  );
  and_cell and45 (
    .a (net24),
    .b (net31),
    .out (net211)
  );
  and_cell and46 (
    .a (net210),
    .b (net211),
    .out (net212)
  );
  and_cell and47 (
    .a (net22),
    .b (net23),
    .out (net213)
  );
  and_cell and48 (
    .a (net214),
    .b (net31),
    .out (net215)
  );
  and_cell and49 (
    .a (net213),
    .b (net215),
    .out (net216)
  );
  and_cell and50 (
    .a (net22),
    .b (net23),
    .out (net217)
  );
  and_cell and51 (
    .a (net24),
    .b (net218),
    .out (net219)
  );
  and_cell and52 (
    .a (net217),
    .b (net219),
    .out (net220)
  );
  not_cell not2 (
    .in (net22),
    .out (net205)
  );
  not_cell not36 (
    .in (net23),
    .out (net209)
  );
  not_cell not37 (
    .in (net24),
    .out (net214)
  );
  not_cell not38 (
    .in (net31),
    .out (net218)
  );
  or_cell or11 (
    .a (net208),
    .b (net212),
    .out (net221)
  );
  or_cell or12 (
    .a (net216),
    .b (net220),
    .out (net222)
  );
  or_cell or13 (
    .a (net221),
    .b (net222),
    .out (net15)
  );
  dff_cell flop1 (
    .d (net28),
    .clk (net223),
    .notq (net30)
  );
  dffsr_cell flop72 (
    .d (net196),
    .clk (net1),
    .s (net4),
    .r (net3),
    .q (net36)
  );
  dffsr_cell flop73 (
    .d (net197),
    .clk (net1),
    .s (net4),
    .r (net3),
    .q (net53)
  );
  not_cell not1 (
    .in (net1),
    .out (net223)
  );
endmodule
