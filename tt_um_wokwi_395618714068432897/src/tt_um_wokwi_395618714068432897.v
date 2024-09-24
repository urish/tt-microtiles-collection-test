/* Automatically generated from https://wokwi.com/projects/395618714068432897 */

`default_nettype none

module tt_um_wokwi_395618714068432897(
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
  dff_cell flipflop1 (
    .d (net18),
    .clk (net1),
    .q (net19),
    .notq (net20)
  );
  dff_cell flipflop2 (
    .d (net19),
    .clk (net1),
    .q (net21),
    .notq (net22)
  );
  dff_cell flipflop3 (
    .d (net21),
    .clk (net1),
    .q (net23),
    .notq (net24)
  );
  dff_cell flipflop4 (
    .d (net23),
    .clk (net1),
    .q (net25),
    .notq (net26)
  );
  dff_cell flipflop5 (
    .d (net27),
    .clk (net1),
    .q (net28),
    .notq (net29)
  );
  dff_cell flipflop6 (
    .d (net25),
    .clk (net1),
    .q (net27),
    .notq (net30)
  );
  dff_cell flipflop7 (
    .d (net28),
    .clk (net1),
    .q (net31),
    .notq (net32)
  );
  dff_cell flipflop8 (
    .d (net31),
    .clk (net1),
    .q (net33),
    .notq (net34)
  );
  dff_cell flipflop9 (
    .d (net33),
    .clk (net1),
    .q (net35),
    .notq (net36)
  );
  dff_cell flipflop10 (
    .d (net35),
    .clk (net1),
    .q (net37),
    .notq (net38)
  );
  dff_cell flipflop11 (
    .d (net37),
    .clk (net1),
    .q (net39),
    .notq (net40)
  );
  dff_cell flipflop12 (
    .d (net39),
    .clk (net1),
    .q (net41),
    .notq (net42)
  );
  dff_cell flipflop13 (
    .d (net41),
    .clk (net1),
    .q (net43),
    .notq (net44)
  );
  dff_cell flipflop14 (
    .d (net43),
    .clk (net1),
    .q (net45),
    .notq (net46)
  );
  dff_cell flipflop15 (
    .d (net45),
    .clk (net1),
    .q (net47),
    .notq (net48)
  );
  dff_cell flipflop16 (
    .d (net47),
    .clk (net1),
    .q (net49),
    .notq (net50)
  );
  or_cell gate1 (
    .a (net51),
    .b (net52),
    .out (net17)
  );
  and_cell gate2 (
    .a (net53),
    .b (net54),
    .out (net55)
  );
  and_cell gate3 (
    .a (net22),
    .b (net20),
    .out (net54)
  );
  and_cell gate4 (
    .a (net26),
    .b (net24),
    .out (net53)
  );
  and_cell gate5 (
    .a (net29),
    .b (net30),
    .out (net56)
  );
  and_cell gate6 (
    .a (net34),
    .b (net32),
    .out (net57)
  );
  and_cell gate7 (
    .a (net38),
    .b (net36),
    .out (net58)
  );
  and_cell gate8 (
    .a (net42),
    .b (net40),
    .out (net59)
  );
  and_cell gate9 (
    .a (net46),
    .b (net44),
    .out (net60)
  );
  and_cell gate10 (
    .a (net50),
    .b (net48),
    .out (net61)
  );
  and_cell gate11 (
    .a (net57),
    .b (net56),
    .out (net62)
  );
  and_cell gate12 (
    .a (net59),
    .b (net58),
    .out (net63)
  );
  and_cell gate13 (
    .a (net61),
    .b (net60),
    .out (net64)
  );
  and_cell gate14 (
    .a (net62),
    .b (net55),
    .out (net65)
  );
  and_cell gate15 (
    .a (net64),
    .b (net63),
    .out (net66)
  );
  and_cell gate16 (
    .a (net66),
    .b (net65),
    .out (net67)
  );
  dff_cell flipflop17 (
    .d (net49),
    .clk (net1),
    .q (net68),
    .notq (net69)
  );
  dff_cell flipflop18 (
    .d (net68),
    .clk (net1),
    .q (net70),
    .notq (net71)
  );
  dff_cell flipflop19 (
    .d (net70),
    .clk (net1),
    .q (net72),
    .notq (net73)
  );
  dff_cell flipflop20 (
    .d (net72),
    .clk (net1),
    .q (net74),
    .notq (net75)
  );
  dff_cell flipflop21 (
    .d (net76),
    .clk (net1),
    .q (net77),
    .notq (net78)
  );
  dff_cell flipflop22 (
    .d (net74),
    .clk (net1),
    .q (net76),
    .notq (net79)
  );
  dff_cell flipflop23 (
    .d (net77),
    .clk (net1),
    .q (net80),
    .notq (net81)
  );
  dff_cell flipflop24 (
    .d (net80),
    .clk (net1),
    .q (net82),
    .notq (net83)
  );
  dff_cell flipflop25 (
    .d (net82),
    .clk (net1),
    .q (net4),
    .notq (net84)
  );
  dff_cell flipflop26 (
    .d (net4),
    .clk (net1),
    .q (net5),
    .notq (net85)
  );
  dff_cell flipflop27 (
    .d (net5),
    .clk (net1),
    .q (net6),
    .notq (net86)
  );
  dff_cell flipflop28 (
    .d (net6),
    .clk (net1),
    .q (net7),
    .notq (net87)
  );
  dff_cell flipflop29 (
    .d (net7),
    .clk (net1),
    .q (net8),
    .notq (net88)
  );
  dff_cell flipflop30 (
    .d (net8),
    .clk (net1),
    .q (net9),
    .notq (net89)
  );
  dff_cell flipflop31 (
    .d (net9),
    .clk (net1),
    .q (net10),
    .notq (net90)
  );
  dff_cell flipflop32 (
    .d (net10),
    .clk (net1),
    .q (net11),
    .notq (net91)
  );
  and_cell gate17 (
    .a (net92),
    .b (net93),
    .out (net94)
  );
  and_cell gate18 (
    .a (net71),
    .b (net69),
    .out (net93)
  );
  and_cell gate19 (
    .a (net75),
    .b (net73),
    .out (net92)
  );
  and_cell gate20 (
    .a (net78),
    .b (net79),
    .out (net95)
  );
  and_cell gate21 (
    .a (net83),
    .b (net81),
    .out (net96)
  );
  and_cell gate22 (
    .a (net85),
    .b (net84),
    .out (net97)
  );
  and_cell gate23 (
    .a (net87),
    .b (net86),
    .out (net98)
  );
  and_cell gate24 (
    .a (net89),
    .b (net88),
    .out (net99)
  );
  and_cell gate25 (
    .a (net91),
    .b (net90),
    .out (net100)
  );
  and_cell gate26 (
    .a (net96),
    .b (net95),
    .out (net101)
  );
  and_cell gate27 (
    .a (net98),
    .b (net97),
    .out (net102)
  );
  and_cell gate28 (
    .a (net100),
    .b (net99),
    .out (net103)
  );
  and_cell gate29 (
    .a (net101),
    .b (net94),
    .out (net104)
  );
  and_cell gate30 (
    .a (net103),
    .b (net102),
    .out (net105)
  );
  and_cell gate31 (
    .a (net105),
    .b (net104),
    .out (net106)
  );
  and_cell and1 (
    .a (net106),
    .b (net67),
    .out (net51)
  );
  xor_cell xor1 (
    .a (net11),
    .b (net9),
    .out (net107)
  );
  xor_cell xor2 (
    .a (net107),
    .b (net5),
    .out (net108)
  );
  xor_cell xor3 (
    .a (net108),
    .b (net4),
    .out (net52)
  );
endmodule
