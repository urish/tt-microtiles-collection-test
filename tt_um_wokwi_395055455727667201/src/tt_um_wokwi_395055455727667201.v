/* Automatically generated from https://wokwi.com/projects/395055455727667201 */

`default_nettype none

module tt_um_wokwi_395055455727667201(
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
  wire net12 = uio_in[0];
  wire net13 = 1'b0;
  wire net14 = uio_in[1];
  wire net15 = uio_in[2];
  wire net16 = uio_in[3];
  wire net17 = 1'b0;
  wire net18;
  wire net19 = 1'b1;
  wire net20 = uio_in[5];
  wire net21 = 1'b0;
  wire net22 = uio_in[6];
  wire net23 = 1'b0;
  wire net24;
  wire net25 = 1'b0;
  wire net26 = 1'b1;
  wire net27 = 1'b1;
  wire net28 = 1'b0;
  wire net29 = 1'b1;
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

  assign uo_out[0] = net10;
  assign uo_out[1] = net11;
  assign uo_out[2] = 0;
  assign uo_out[3] = 0;
  assign uo_out[4] = 0;
  assign uo_out[5] = 0;
  assign uo_out[6] = 0;
  assign uo_out[7] = 0;
  assign uio_out[0] = net13;
  assign uio_oe[0] = net13;
  assign uio_out[1] = net13;
  assign uio_oe[1] = net13;
  assign uio_out[2] = net13;
  assign uio_oe[2] = net13;
  assign uio_out[3] = net17;
  assign uio_oe[3] = net17;
  assign uio_out[4] = net18;
  assign uio_oe[4] = net19;
  assign uio_out[5] = net21;
  assign uio_oe[5] = net21;
  assign uio_out[6] = net23;
  assign uio_oe[6] = net23;
  assign uio_out[7] = net24;
  assign uio_oe[7] = net19;

  mux_cell mux2 (
    .a (net10),
    .b (net2),
    .sel (net3),
    .out (net30)
  );
  dff_cell flop2 (
    .d (net30),
    .clk (net1),
    .q (net31)
  );
  xor_cell xor2 (
    .a (net10),
    .b (net31),
    .out (net32)
  );
  mux_cell mux3 (
    .a (net32),
    .b (net4),
    .sel (net3),
    .out (net33)
  );
  dff_cell flop3 (
    .d (net33),
    .clk (net1),
    .q (net34)
  );
  mux_cell mux4 (
    .a (net34),
    .b (net5),
    .sel (net3),
    .out (net35)
  );
  dff_cell flop4 (
    .d (net35),
    .clk (net1),
    .q (net36)
  );
  mux_cell mux5 (
    .a (net36),
    .b (net6),
    .sel (net3),
    .out (net37)
  );
  dff_cell flop5 (
    .d (net37),
    .clk (net1),
    .q (net38)
  );
  xor_cell xor3 (
    .a (net10),
    .b (net38),
    .out (net39)
  );
  mux_cell mux6 (
    .a (net39),
    .b (net7),
    .sel (net3),
    .out (net40)
  );
  dff_cell flop6 (
    .d (net40),
    .clk (net1),
    .q (net41)
  );
  mux_cell mux7 (
    .a (net41),
    .b (net8),
    .sel (net3),
    .out (net42)
  );
  dff_cell flop7 (
    .d (net42),
    .clk (net1),
    .q (net43)
  );
  mux_cell mux8 (
    .a (net43),
    .b (net9),
    .sel (net3),
    .out (net44)
  );
  dff_cell flop8 (
    .d (net44),
    .clk (net1),
    .q (net45)
  );
  xor_cell xor4 (
    .a (net10),
    .b (net45),
    .out (net46)
  );
  mux_cell mux9 (
    .a (net46),
    .b (net12),
    .sel (net3),
    .out (net47)
  );
  dff_cell flop9 (
    .d (net47),
    .clk (net1),
    .q (net48)
  );
  mux_cell mux10 (
    .a (net48),
    .b (net14),
    .sel (net3),
    .out (net49)
  );
  dff_cell flop10 (
    .d (net49),
    .clk (net1),
    .q (net50)
  );
  xor_cell xor5 (
    .a (net10),
    .b (net50),
    .out (net51)
  );
  mux_cell mux11 (
    .a (net51),
    .b (net15),
    .sel (net3),
    .out (net52)
  );
  dff_cell flop11 (
    .d (net52),
    .clk (net1),
    .q (net53)
  );
  xor_cell xor6 (
    .a (net10),
    .b (net53),
    .out (net10)
  );
  mux_cell mux1 (
    .a (net11),
    .b (net2),
    .sel (net3),
    .out (net54)
  );
  dff_cell flop1 (
    .d (net54),
    .clk (net1),
    .q (net55),
    .notq (net56)
  );
  xor_cell xor1 (
    .a (net11),
    .b (net55),
    .out (net57)
  );
  mux_cell mux12 (
    .a (net57),
    .b (net4),
    .sel (net3),
    .out (net58)
  );
  dff_cell flop12 (
    .d (net58),
    .clk (net1),
    .q (net59),
    .notq (net60)
  );
  mux_cell mux13 (
    .a (net59),
    .b (net5),
    .sel (net3),
    .out (net61)
  );
  dff_cell flop13 (
    .d (net61),
    .clk (net1),
    .q (net62),
    .notq (net63)
  );
  mux_cell mux14 (
    .a (net62),
    .b (net6),
    .sel (net3),
    .out (net64)
  );
  dff_cell flop14 (
    .d (net64),
    .clk (net1),
    .q (net65),
    .notq (net66)
  );
  xor_cell xor7 (
    .a (net11),
    .b (net65),
    .out (net67)
  );
  mux_cell mux15 (
    .a (net67),
    .b (net7),
    .sel (net3),
    .out (net68)
  );
  dff_cell flop15 (
    .d (net68),
    .clk (net1),
    .q (net69),
    .notq (net70)
  );
  mux_cell mux16 (
    .a (net69),
    .b (net8),
    .sel (net3),
    .out (net71)
  );
  dff_cell flop16 (
    .d (net71),
    .clk (net1),
    .q (net72),
    .notq (net73)
  );
  mux_cell mux17 (
    .a (net72),
    .b (net9),
    .sel (net3),
    .out (net74)
  );
  dff_cell flop17 (
    .d (net74),
    .clk (net1),
    .q (net75),
    .notq (net76)
  );
  xor_cell xor8 (
    .a (net11),
    .b (net75),
    .out (net77)
  );
  mux_cell mux18 (
    .a (net77),
    .b (net12),
    .sel (net3),
    .out (net78)
  );
  dff_cell flop18 (
    .d (net78),
    .clk (net1),
    .q (net79),
    .notq (net80)
  );
  mux_cell mux19 (
    .a (net79),
    .b (net14),
    .sel (net3),
    .out (net81)
  );
  dff_cell flop19 (
    .d (net81),
    .clk (net1),
    .q (net82)
  );
  xor_cell xor9 (
    .a (net11),
    .b (net82),
    .out (net83)
  );
  mux_cell mux20 (
    .a (net83),
    .b (net15),
    .sel (net84),
    .out (net85)
  );
  dff_cell flop20 (
    .d (net85),
    .clk (net1),
    .q (net86)
  );
  xor_cell xor10 (
    .a (net11),
    .b (net86),
    .out (net11)
  );
  xor_cell xor11 (
    .a (net3),
    .b (net87),
    .out (net84)
  );
  or_cell or1 (
    .a (net60),
    .b (net56),
    .out (net88)
  );
  or_cell or2 (
    .a (net66),
    .b (net89),
    .out (net90)
  );
  or_cell or3 (
    .a (net70),
    .b (net90),
    .out (net91)
  );
  or_cell or4 (
    .a (net73),
    .b (net91),
    .out (net92)
  );
  or_cell or5 (
    .a (net76),
    .b (net92),
    .out (net93)
  );
  or_cell or6 (
    .a (net80),
    .b (net93),
    .out (net94)
  );
  and_cell and1 (
    .a (net94),
    .b (net16),
    .out (net87)
  );
  not_cell not1 (
    .in (net20),
    .out (net18)
  );
  not_cell not2 (
    .in (net22),
    .out (net95)
  );
  not_cell not3 (
    .in (net95),
    .out (net96)
  );
  not_cell not4 (
    .in (net96),
    .out (net97)
  );
  not_cell not5 (
    .in (net97),
    .out (net98)
  );
  not_cell not6 (
    .in (net98),
    .out (net99)
  );
  not_cell not7 (
    .in (net99),
    .out (net100)
  );
  not_cell not8 (
    .in (net100),
    .out (net101)
  );
  not_cell not9 (
    .in (net101),
    .out (net24)
  );
  or_cell or7 (
    .a (net63),
    .b (net88),
    .out (net89)
  );
endmodule
