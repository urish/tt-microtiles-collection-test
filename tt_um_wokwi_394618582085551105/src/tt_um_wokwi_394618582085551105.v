/* Automatically generated from https://wokwi.com/projects/394618582085551105 */

`default_nettype none

module tt_um_wokwi_394618582085551105(
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
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = uio_in[0];
  wire net12 = 1'b0;
  wire net13 = uio_in[1];
  wire net14 = uio_in[2];
  wire net15 = uio_in[3];
  wire net16;
  wire net17 = 1'b1;
  wire net18;
  wire net19;
  wire net20;
  wire net21 = 1'b0;
  wire net22 = 1'b0;
  wire net23 = 1'b1;
  wire net24;
  wire net25 = 1'b0;
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
  wire net57 = 1'b0;
  wire net58 = 1'b0;
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

  assign uo_out[0] = net3;
  assign uo_out[1] = net4;
  assign uo_out[2] = net5;
  assign uo_out[3] = net6;
  assign uo_out[4] = net7;
  assign uo_out[5] = net8;
  assign uo_out[6] = net9;
  assign uo_out[7] = net10;
  assign uio_out[0] = 0;
  assign uio_oe[0] = net12;
  assign uio_out[1] = 0;
  assign uio_oe[1] = net12;
  assign uio_out[2] = 0;
  assign uio_oe[2] = net12;
  assign uio_out[3] = 0;
  assign uio_oe[3] = net12;
  assign uio_out[4] = net16;
  assign uio_oe[4] = net17;
  assign uio_out[5] = net18;
  assign uio_oe[5] = net17;
  assign uio_out[6] = net19;
  assign uio_oe[6] = net17;
  assign uio_out[7] = net20;
  assign uio_oe[7] = net17;

  dffsr_cell flop1 (
    .d (net24),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net27)
  );
  mux_cell mux1 (
    .a (net27),
    .b (net14),
    .sel (net16),
    .out (net24)
  );
  dffsr_cell flop2 (
    .d (net28),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net29)
  );
  mux_cell mux2 (
    .a (net29),
    .b (net15),
    .sel (net20),
    .out (net28)
  );
  dffsr_cell flop3 (
    .d (net30),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net31)
  );
  mux_cell mux3 (
    .a (net31),
    .b (net14),
    .sel (net20),
    .out (net30)
  );
  dffsr_cell flop4 (
    .d (net32),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net33)
  );
  mux_cell mux4 (
    .a (net33),
    .b (net13),
    .sel (net20),
    .out (net32)
  );
  dffsr_cell flop5 (
    .d (net34),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net35)
  );
  mux_cell mux5 (
    .a (net35),
    .b (net15),
    .sel (net19),
    .out (net34)
  );
  dffsr_cell flop6 (
    .d (net36),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net37)
  );
  mux_cell mux6 (
    .a (net37),
    .b (net14),
    .sel (net19),
    .out (net36)
  );
  dffsr_cell flop7 (
    .d (net38),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net39)
  );
  mux_cell mux7 (
    .a (net39),
    .b (net13),
    .sel (net19),
    .out (net38)
  );
  dffsr_cell flop8 (
    .d (net40),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net41)
  );
  mux_cell mux8 (
    .a (net41),
    .b (net15),
    .sel (net18),
    .out (net40)
  );
  dffsr_cell flop9 (
    .d (net42),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net43)
  );
  mux_cell mux9 (
    .a (net43),
    .b (net14),
    .sel (net18),
    .out (net42)
  );
  dffsr_cell flop10 (
    .d (net44),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net45)
  );
  mux_cell mux10 (
    .a (net45),
    .b (net13),
    .sel (net18),
    .out (net44)
  );
  dffsr_cell flop11 (
    .d (net46),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net47)
  );
  mux_cell mux11 (
    .a (net47),
    .b (net11),
    .sel (net20),
    .out (net46)
  );
  dffsr_cell flop12 (
    .d (net48),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net49)
  );
  mux_cell mux12 (
    .a (net49),
    .b (net11),
    .sel (net19),
    .out (net48)
  );
  dffsr_cell flop13 (
    .d (net50),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net51)
  );
  mux_cell mux13 (
    .a (net51),
    .b (net11),
    .sel (net18),
    .out (net50)
  );
  dffsr_cell flop14 (
    .d (net52),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net53)
  );
  mux_cell mux14 (
    .a (net53),
    .b (net11),
    .sel (net16),
    .out (net52)
  );
  dffsr_cell flop15 (
    .d (net54),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net55)
  );
  mux_cell mux15 (
    .a (net55),
    .b (net13),
    .sel (net16),
    .out (net54)
  );
  dffsr_cell flop16 (
    .d (net56),
    .clk (net1),
    .s (net25),
    .r (net26),
    .q (net10)
  );
  mux_cell mux16 (
    .a (net10),
    .b (net15),
    .sel (net16),
    .out (net56)
  );
  dffsr_cell flop21 (
    .d (net16),
    .clk (net1),
    .s (net26),
    .r (net58),
    .q (net20)
  );
  dffsr_cell flop22 (
    .d (net18),
    .clk (net1),
    .s (net58),
    .r (net26),
    .q (net16)
  );
  dffsr_cell flop23 (
    .d (net19),
    .clk (net1),
    .s (net58),
    .r (net26),
    .q (net18)
  );
  dffsr_cell flop24 (
    .d (net20),
    .clk (net1),
    .s (net58),
    .r (net26),
    .q (net19)
  );
  or_cell or1 (
    .a (net59),
    .b (net60),
    .out (net3)
  );
  or_cell or2 (
    .a (net59),
    .b (net61),
    .out (net4)
  );
  or_cell or3 (
    .a (net59),
    .b (net62),
    .out (net5)
  );
  or_cell or4 (
    .a (net59),
    .b (net63),
    .out (net6)
  );
  or_cell or5 (
    .a (net59),
    .b (net64),
    .out (net7)
  );
  or_cell or6 (
    .a (net59),
    .b (net65),
    .out (net8)
  );
  or_cell or7 (
    .a (net43),
    .b (net66),
    .out (net9)
  );
  or_cell or8 (
    .a (net67),
    .b (net68),
    .out (net60)
  );
  or_cell or9 (
    .a (net67),
    .b (net69),
    .out (net61)
  );
  or_cell or10 (
    .a (net67),
    .b (net70),
    .out (net62)
  );
  or_cell or11 (
    .a (net45),
    .b (net71),
    .out (net63)
  );
  or_cell or12 (
    .a (net47),
    .b (net72),
    .out (net64)
  );
  or_cell or13 (
    .a (net67),
    .b (net73),
    .out (net65)
  );
  or_cell or14 (
    .a (net67),
    .b (net74),
    .out (net66)
  );
  or_cell or15 (
    .a (net39),
    .b (net75),
    .out (net68)
  );
  or_cell or16 (
    .a (net25),
    .b (net76),
    .out (net69)
  );
  or_cell or17 (
    .a (net77),
    .b (net78),
    .out (net70)
  );
  or_cell or18 (
    .a (net77),
    .b (net79),
    .out (net71)
  );
  or_cell or19 (
    .a (net77),
    .b (net80),
    .out (net72)
  );
  or_cell or20 (
    .a (net77),
    .b (net81),
    .out (net73)
  );
  or_cell or21 (
    .a (net77),
    .b (net82),
    .out (net74)
  );
  or_cell or22 (
    .a (net25),
    .b (net83),
    .out (net75)
  );
  or_cell or23 (
    .a (net53),
    .b (net84),
    .out (net76)
  );
  or_cell or24 (
    .a (net85),
    .b (net86),
    .out (net78)
  );
  or_cell or25 (
    .a (net85),
    .b (net87),
    .out (net79)
  );
  or_cell or26 (
    .a (net85),
    .b (net88),
    .out (net80)
  );
  or_cell or27 (
    .a (net25),
    .b (net89),
    .out (net81)
  );
  or_cell or28 (
    .a (net85),
    .b (net90),
    .out (net82)
  );
  or_cell or29 (
    .a (net91),
    .b (net92),
    .out (net83)
  );
  or_cell or30 (
    .a (net31),
    .b (net93),
    .out (net84)
  );
  or_cell or31 (
    .a (net37),
    .b (net94),
    .out (net86)
  );
  or_cell or32 (
    .a (net91),
    .b (net95),
    .out (net87)
  );
  or_cell or33 (
    .a (net31),
    .b (net25),
    .out (net88)
  );
  or_cell or34 (
    .a (net37),
    .b (net96),
    .out (net89)
  );
  or_cell or35 (
    .a (net91),
    .b (net97),
    .out (net90)
  );
  or_cell or36 (
    .a (net98),
    .b (net99),
    .out (net92)
  );
  or_cell or37 (
    .a (net98),
    .b (net100),
    .out (net93)
  );
  or_cell or38 (
    .a (net98),
    .b (net101),
    .out (net94)
  );
  or_cell or39 (
    .a (net98),
    .b (net25),
    .out (net95)
  );
  or_cell or40 (
    .a (net25),
    .b (net102),
    .out (net96)
  );
  or_cell or41 (
    .a (net33),
    .b (net103),
    .out (net97)
  );
  or_cell or42 (
    .a (net41),
    .b (net25),
    .out (net99)
  );
  or_cell or43 (
    .a (net104),
    .b (net35),
    .out (net100)
  );
  or_cell or44 (
    .a (net104),
    .b (net35),
    .out (net101)
  );
  or_cell or45 (
    .a (net25),
    .b (net35),
    .out (net102)
  );
  or_cell or46 (
    .a (net25),
    .b (net35),
    .out (net103)
  );
  or_cell or47 (
    .a (net27),
    .b (net43),
    .out (net59)
  );
  or_cell or48 (
    .a (net45),
    .b (net47),
    .out (net67)
  );
  or_cell or49 (
    .a (net39),
    .b (net49),
    .out (net77)
  );
  or_cell or50 (
    .a (net53),
    .b (net55),
    .out (net85)
  );
  or_cell or51 (
    .a (net31),
    .b (net37),
    .out (net91)
  );
  or_cell or52 (
    .a (net51),
    .b (net33),
    .out (net98)
  );
  or_cell or53 (
    .a (net41),
    .b (net29),
    .out (net104)
  );
  dff_cell flop17 (
    .d (net2),
    .clk (net1),
    .notq (net26)
  );
endmodule
