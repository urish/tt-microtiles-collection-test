/* Automatically generated from https://wokwi.com/projects/395054564978002945 */

`default_nettype none

module tt_um_wokwi_395054564978002945(
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
  wire net11;
  wire net12;
  wire net13;
  wire net14 = 1'b1;
  wire net15 = 1'b1;
  wire net16 = 1'b0;
  wire net17 = 1'b1;
  wire net18;
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

  assign uo_out[0] = 0;
  assign uo_out[1] = 0;
  assign uo_out[2] = 0;
  assign uo_out[3] = 0;
  assign uo_out[4] = 0;
  assign uo_out[5] = 0;
  assign uo_out[6] = 0;
  assign uo_out[7] = 0;
  assign uio_out[0] = net4;
  assign uio_oe[0] = net5;
  assign uio_out[1] = net6;
  assign uio_oe[1] = net7;
  assign uio_out[2] = net8;
  assign uio_oe[2] = net9;
  assign uio_out[3] = net10;
  assign uio_oe[3] = net11;
  assign uio_out[4] = net12;
  assign uio_oe[4] = net13;
  assign uio_out[5] = 0;
  assign uio_oe[5] = 0;
  assign uio_out[6] = 0;
  assign uio_oe[6] = 0;
  assign uio_out[7] = 0;
  assign uio_oe[7] = 0;

  dffsr_cell flop21 (
    .d (net12),
    .clk (net1),
    .s (net18),
    .r (net19),
    .q (net20)
  );
  dffsr_cell flop20 (
    .d (net20),
    .clk (net1),
    .s (net19),
    .r (net18),
    .q (net6)
  );
  dffsr_cell flop22 (
    .d (net6),
    .clk (net1),
    .s (net19),
    .r (net18),
    .q (net8)
  );
  dffsr_cell flop23 (
    .d (net8),
    .clk (net1),
    .s (net19),
    .r (net18),
    .q (net10)
  );
  not_cell not1 (
    .in (net3),
    .out (net18)
  );
  and_cell and1 (
    .a (net6),
    .b (net21),
    .out (net22)
  );
  or_cell or1 (
    .a (net8),
    .b (net23),
    .out (net9)
  );
  dffsr_cell flop24 (
    .d (net10),
    .clk (net1),
    .s (net19),
    .r (net18),
    .q (net12)
  );
  and_cell and3 (
    .a (net3),
    .b (net20),
    .out (net4)
  );
  and_cell and4 (
    .a (net6),
    .b (net24),
    .out (net25)
  );
  and_cell and5 (
    .a (net8),
    .b (net26),
    .out (net27)
  );
  and_cell and6 (
    .a (net10),
    .b (net28),
    .out (net29)
  );
  and_cell and7 (
    .a (net10),
    .b (net30),
    .out (net31)
  );
  and_cell and8 (
    .a (net6),
    .b (net32),
    .out (net33)
  );
  and_cell and9 (
    .a (net4),
    .b (net34),
    .out (net35)
  );
  and_cell and10 (
    .a (net4),
    .b (net36),
    .out (net37)
  );
  and_cell and11 (
    .a (net4),
    .b (net38),
    .out (net39)
  );
  and_cell and12 (
    .a (net8),
    .b (net40),
    .out (net41)
  );
  and_cell and13 (
    .a (net10),
    .b (net42),
    .out (net43)
  );
  and_cell and14 (
    .a (net12),
    .b (net44),
    .out (net45)
  );
  and_cell and15 (
    .a (net6),
    .b (net46),
    .out (net47)
  );
  and_cell and16 (
    .a (net12),
    .b (net48),
    .out (net49)
  );
  and_cell and17 (
    .a (net10),
    .b (net50),
    .out (net51)
  );
  and_cell and18 (
    .a (net8),
    .b (net52),
    .out (net53)
  );
  and_cell and19 (
    .a (net12),
    .b (net54),
    .out (net55)
  );
  and_cell and20 (
    .a (net4),
    .b (net56),
    .out (net57)
  );
  and_cell and21 (
    .a (net12),
    .b (net58),
    .out (net59)
  );
  or_cell or2 (
    .a (net4),
    .b (net60),
    .out (net5)
  );
  or_cell or3 (
    .a (net10),
    .b (net61),
    .out (net11)
  );
  or_cell or4 (
    .a (net6),
    .b (net62),
    .out (net7)
  );
  or_cell or5 (
    .a (net12),
    .b (net63),
    .out (net13)
  );
  or_cell or10 (
    .a (net43),
    .b (net59),
    .out (net64)
  );
  or_cell or11 (
    .a (net22),
    .b (net31),
    .out (net65)
  );
  or_cell or13 (
    .a (net35),
    .b (net45),
    .out (net66)
  );
  or_cell or14 (
    .a (net41),
    .b (net64),
    .out (net67)
  );
  or_cell or15 (
    .a (net39),
    .b (net65),
    .out (net68)
  );
  or_cell or16 (
    .a (net29),
    .b (net49),
    .out (net69)
  );
  or_cell or17 (
    .a (net25),
    .b (net66),
    .out (net70)
  );
  or_cell or18 (
    .a (net33),
    .b (net67),
    .out (net60)
  );
  or_cell or19 (
    .a (net55),
    .b (net68),
    .out (net23)
  );
  or_cell or20 (
    .a (net37),
    .b (net69),
    .out (net62)
  );
  or_cell or21 (
    .a (net27),
    .b (net70),
    .out (net61)
  );
  or_cell or23 (
    .a (net47),
    .b (net57),
    .out (net71)
  );
  or_cell or24 (
    .a (net53),
    .b (net71),
    .out (net72)
  );
  or_cell or25 (
    .a (net51),
    .b (net72),
    .out (net63)
  );
  dff_cell flop32 (
    .d (net73),
    .clk (net1),
    .q (net21)
  );
  mux_cell mux8 (
    .a (net21),
    .b (net48),
    .sel (net18),
    .out (net73)
  );
  dff_cell flop33 (
    .d (net74),
    .clk (net1),
    .q (net24)
  );
  mux_cell mux9 (
    .a (net24),
    .b (net21),
    .sel (net18),
    .out (net74)
  );
  dff_cell flop34 (
    .d (net75),
    .clk (net1),
    .q (net28)
  );
  mux_cell mux10 (
    .a (net28),
    .b (net24),
    .sel (net18),
    .out (net75)
  );
  dff_cell flop35 (
    .d (net76),
    .clk (net1),
    .q (net56)
  );
  mux_cell mux11 (
    .a (net56),
    .b (net28),
    .sel (net18),
    .out (net76)
  );
  dff_cell flop36 (
    .d (net77),
    .clk (net1),
    .q (net58)
  );
  mux_cell mux12 (
    .a (net58),
    .b (net56),
    .sel (net18),
    .out (net77)
  );
  dff_cell flop25 (
    .d (net78),
    .clk (net1),
    .q (net26)
  );
  mux_cell mux1 (
    .a (net26),
    .b (net54),
    .sel (net18),
    .out (net78)
  );
  dff_cell flop26 (
    .d (net79),
    .clk (net1),
    .q (net44)
  );
  mux_cell mux2 (
    .a (net44),
    .b (net26),
    .sel (net18),
    .out (net79)
  );
  dff_cell flop27 (
    .d (net80),
    .clk (net1),
    .q (net46)
  );
  mux_cell mux3 (
    .a (net46),
    .b (net44),
    .sel (net18),
    .out (net80)
  );
  dff_cell flop28 (
    .d (net81),
    .clk (net1),
    .q (net48)
  );
  mux_cell mux4 (
    .a (net48),
    .b (net46),
    .sel (net18),
    .out (net81)
  );
  dff_cell flop29 (
    .d (net82),
    .clk (net1),
    .q (net30)
  );
  mux_cell mux5 (
    .a (net30),
    .b (net58),
    .sel (net18),
    .out (net82)
  );
  dff_cell flop30 (
    .d (net83),
    .clk (net1),
    .q (net32)
  );
  mux_cell mux6 (
    .a (net32),
    .b (net30),
    .sel (net18),
    .out (net83)
  );
  dff_cell flop31 (
    .d (net84),
    .clk (net1),
    .q (net34)
  );
  mux_cell mux7 (
    .a (net34),
    .b (net32),
    .sel (net18),
    .out (net84)
  );
  dff_cell flop37 (
    .d (net85),
    .clk (net1),
    .q (net42)
  );
  mux_cell mux13 (
    .a (net42),
    .b (net34),
    .sel (net18),
    .out (net85)
  );
  dff_cell flop38 (
    .d (net86),
    .clk (net1),
    .q (net50)
  );
  mux_cell mux14 (
    .a (net50),
    .b (net2),
    .sel (net18),
    .out (net86)
  );
  dff_cell flop39 (
    .d (net87),
    .clk (net1),
    .q (net52)
  );
  mux_cell mux15 (
    .a (net52),
    .b (net50),
    .sel (net18),
    .out (net87)
  );
  dff_cell flop40 (
    .d (net88),
    .clk (net1),
    .q (net54)
  );
  mux_cell mux16 (
    .a (net54),
    .b (net52),
    .sel (net18),
    .out (net88)
  );
  dff_cell flop41 (
    .d (net89),
    .clk (net1),
    .q (net36)
  );
  mux_cell mux17 (
    .a (net36),
    .b (net42),
    .sel (net18),
    .out (net89)
  );
  dff_cell flop42 (
    .d (net90),
    .clk (net1),
    .q (net38)
  );
  mux_cell mux18 (
    .a (net38),
    .b (net36),
    .sel (net18),
    .out (net90)
  );
  dff_cell flop43 (
    .d (net91),
    .clk (net1),
    .q (net40)
  );
  mux_cell mux19 (
    .a (net40),
    .b (net38),
    .sel (net18),
    .out (net91)
  );
endmodule
