/* Automatically generated from https://wokwi.com/projects/394707429798790145 */

`default_nettype none

module tt_um_wokwi_394707429798790145(
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
  wire net2 = ui_in[1];
  wire net3 = ui_in[2];
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12 = 1'b0;
  wire net13 = 1'b1;
  wire net14 = 1'b1;
  wire net15 = 1'b0;
  wire net16 = 1'b1;
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

  assign uo_out[0] = net4;
  assign uo_out[1] = net5;
  assign uo_out[2] = net6;
  assign uo_out[3] = net7;
  assign uo_out[4] = net8;
  assign uo_out[5] = net9;
  assign uo_out[6] = net10;
  assign uo_out[7] = net11;
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

  mux_cell mux1 (
    .a (net17),
    .b (net2),
    .sel (net3),
    .out (net18)
  );
  dff_cell flipflop2 (
    .d (net18),
    .clk (net1),
    .q (net19),
    .notq (net20)
  );
  dff_cell flipflop3 (
    .d (net19),
    .clk (net1),
    .q (net21),
    .notq (net22)
  );
  dff_cell flipflop4 (
    .d (net23),
    .clk (net1),
    .q (net24),
    .notq (net25)
  );
  dff_cell flipflop5 (
    .d (net24),
    .clk (net1),
    .q (net26),
    .notq (net27)
  );
  dff_cell flipflop6 (
    .d (net28),
    .clk (net1),
    .q (net29),
    .notq (net30)
  );
  dff_cell flipflop7 (
    .d (net26),
    .clk (net1),
    .q (net28),
    .notq (net31)
  );
  dff_cell flipflop8 (
    .d (net32),
    .clk (net1),
    .q (net33),
    .notq (net34)
  );
  dff_cell flipflop9 (
    .d (net35),
    .clk (net1),
    .q (net36),
    .notq (net37)
  );
  dff_cell flipflop10 (
    .d (net36),
    .clk (net1),
    .q (net38),
    .notq (net39)
  );
  dff_cell flipflop11 (
    .d (net38),
    .clk (net1),
    .q (net40),
    .notq (net41)
  );
  dff_cell flipflop12 (
    .d (net40),
    .clk (net1),
    .q (net42),
    .notq (net43)
  );
  dff_cell flipflop13 (
    .d (net42),
    .clk (net1),
    .q (net44),
    .notq (net45)
  );
  dff_cell flipflop14 (
    .d (net44),
    .clk (net1),
    .q (net46),
    .notq (net47)
  );
  dff_cell flipflop15 (
    .d (net46),
    .clk (net1),
    .q (net48),
    .notq (net49)
  );
  dff_cell flipflop16 (
    .d (net48),
    .clk (net1),
    .q (net50),
    .notq (net51)
  );
  dff_cell flipflop1 (
    .d (net50),
    .clk (net1),
    .q (net52),
    .notq (net53)
  );
  or_cell gate1 (
    .a (net54),
    .b (net11),
    .out (net17)
  );
  and_cell gate2 (
    .a (net55),
    .b (net56),
    .out (net57)
  );
  and_cell gate4 (
    .a (net22),
    .b (net20),
    .out (net56)
  );
  and_cell gate5 (
    .a (net27),
    .b (net25),
    .out (net55)
  );
  and_cell gate6 (
    .a (net30),
    .b (net31),
    .out (net58)
  );
  and_cell gate9 (
    .a (net37),
    .b (net34),
    .out (net59)
  );
  and_cell gate10 (
    .a (net41),
    .b (net39),
    .out (net60)
  );
  and_cell gate11 (
    .a (net45),
    .b (net43),
    .out (net61)
  );
  and_cell gate12 (
    .a (net49),
    .b (net47),
    .out (net62)
  );
  and_cell gate13 (
    .a (net53),
    .b (net51),
    .out (net63)
  );
  and_cell gate14 (
    .a (net59),
    .b (net58),
    .out (net64)
  );
  and_cell gate15 (
    .a (net61),
    .b (net60),
    .out (net65)
  );
  and_cell gate16 (
    .a (net63),
    .b (net62),
    .out (net66)
  );
  and_cell gate17 (
    .a (net64),
    .b (net57),
    .out (net67)
  );
  and_cell gate19 (
    .a (net66),
    .b (net65),
    .out (net68)
  );
  and_cell gate20 (
    .a (net68),
    .b (net67),
    .out (net69)
  );
  dff_cell flipflop17 (
    .d (net52),
    .clk (net1),
    .q (net70),
    .notq (net71)
  );
  dff_cell flipflop18 (
    .d (net70),
    .clk (net1),
    .q (net72),
    .notq (net73)
  );
  dff_cell flipflop19 (
    .d (net72),
    .clk (net1),
    .q (net74),
    .notq (net75)
  );
  dff_cell flipflop20 (
    .d (net74),
    .clk (net1),
    .q (net76),
    .notq (net77)
  );
  dff_cell flipflop21 (
    .d (net78),
    .clk (net1),
    .q (net79),
    .notq (net80)
  );
  dff_cell flipflop22 (
    .d (net76),
    .clk (net1),
    .q (net78),
    .notq (net81)
  );
  dff_cell flipflop23 (
    .d (net79),
    .clk (net1),
    .q (net82),
    .notq (net83)
  );
  dff_cell flipflop24 (
    .d (net82),
    .clk (net1),
    .q (net84),
    .notq (net85)
  );
  dff_cell flipflop25 (
    .d (net84),
    .clk (net1),
    .q (net4),
    .notq (net86)
  );
  dff_cell flipflop26 (
    .d (net4),
    .clk (net1),
    .q (net5),
    .notq (net87)
  );
  dff_cell flipflop27 (
    .d (net5),
    .clk (net1),
    .q (net6),
    .notq (net88)
  );
  dff_cell flipflop28 (
    .d (net6),
    .clk (net1),
    .q (net7),
    .notq (net89)
  );
  dff_cell flipflop29 (
    .d (net7),
    .clk (net1),
    .q (net8),
    .notq (net90)
  );
  dff_cell flipflop30 (
    .d (net8),
    .clk (net1),
    .q (net9),
    .notq (net91)
  );
  dff_cell flipflop31 (
    .d (net9),
    .clk (net1),
    .q (net10),
    .notq (net92)
  );
  dff_cell flipflop32 (
    .d (net10),
    .clk (net1),
    .q (net11),
    .notq (net93)
  );
  and_cell gate23 (
    .a (net94),
    .b (net95),
    .out (net96)
  );
  and_cell gate24 (
    .a (net73),
    .b (net71),
    .out (net95)
  );
  and_cell gate25 (
    .a (net77),
    .b (net75),
    .out (net94)
  );
  and_cell gate26 (
    .a (net80),
    .b (net81),
    .out (net97)
  );
  and_cell gate27 (
    .a (net85),
    .b (net83),
    .out (net98)
  );
  and_cell gate28 (
    .a (net87),
    .b (net86),
    .out (net99)
  );
  and_cell gate29 (
    .a (net89),
    .b (net88),
    .out (net100)
  );
  and_cell gate30 (
    .a (net91),
    .b (net90),
    .out (net101)
  );
  and_cell gate31 (
    .a (net93),
    .b (net92),
    .out (net102)
  );
  and_cell gate32 (
    .a (net98),
    .b (net97),
    .out (net103)
  );
  and_cell gate33 (
    .a (net100),
    .b (net99),
    .out (net104)
  );
  and_cell gate34 (
    .a (net102),
    .b (net101),
    .out (net105)
  );
  and_cell gate35 (
    .a (net103),
    .b (net96),
    .out (net106)
  );
  and_cell gate36 (
    .a (net105),
    .b (net104),
    .out (net107)
  );
  and_cell gate37 (
    .a (net107),
    .b (net106),
    .out (net108)
  );
  and_cell and1 (
    .a (net108),
    .b (net69),
    .out (net54)
  );
  xor_cell xor1 (
    .a (net11),
    .b (net21),
    .out (net109)
  );
  xor_cell xor3 (
    .a (net11),
    .b (net29),
    .out (net110)
  );
  xor_cell xor4 (
    .a (net11),
    .b (net33),
    .out (net111)
  );
  mux_cell mux2 (
    .a (net109),
    .b (net21),
    .sel (net3),
    .out (net23)
  );
  mux_cell mux3 (
    .a (net110),
    .b (net29),
    .sel (net3),
    .out (net32)
  );
  mux_cell mux4 (
    .a (net111),
    .b (net33),
    .sel (net3),
    .out (net35)
  );
endmodule
