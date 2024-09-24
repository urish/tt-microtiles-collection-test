/* Automatically generated from https://wokwi.com/projects/392873974467527681 */

`default_nettype none

module tt_um_wokwi_392873974467527681(
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
  wire net6 = ui_in[7];
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12 = 1'b1;
  wire net13;
  wire net14;
  wire net15 = 1'b0;
  wire net16 = 1'b1;
  wire net17 = 1'b0;
  wire net18 = 1'b1;
  wire net19 = 1'b0;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24;
  wire net25;
  wire net26;
  wire net27 = 1'b1;
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

  assign uo_out[0] = net7;
  assign uo_out[1] = net8;
  assign uo_out[2] = net9;
  assign uo_out[3] = net10;
  assign uo_out[4] = net11;
  assign uo_out[5] = net12;
  assign uo_out[6] = net13;
  assign uo_out[7] = net14;
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

  dff_cell flipflop1 (
    .d (net20),
    .clk (net1),
    .q (net14),
    .notq (net20)
  );
  dff_cell flipflop2 (
    .d (net21),
    .clk (net20),
    .q (net22),
    .notq (net21)
  );
  dff_cell flipflop3 (
    .d (net23),
    .clk (net21),
    .q (net24),
    .notq (net23)
  );
  dff_cell flipflop4 (
    .d (net25),
    .clk (net23),
    .q (net26),
    .notq (net25)
  );
  mux_cell mux1 (
    .a (net22),
    .b (net4),
    .sel (net6),
    .out (net28)
  );
  mux_cell mux2 (
    .a (net26),
    .b (net2),
    .sel (net6),
    .out (net29)
  );
  mux_cell mux3 (
    .a (net24),
    .b (net3),
    .sel (net6),
    .out (net30)
  );
  mux_cell mux4 (
    .a (net14),
    .b (net5),
    .sel (net6),
    .out (net31)
  );
  not_cell not1 (
    .in (net29),
    .out (net32)
  );
  not_cell not2 (
    .in (net30),
    .out (net33)
  );
  not_cell not3 (
    .in (net28),
    .out (net34)
  );
  not_cell not4 (
    .in (net31),
    .out (net35)
  );
  and_cell and2 (
    .a (net32),
    .b (net30),
    .out (net36)
  );
  and_cell and3 (
    .a (net36),
    .b (net28),
    .out (net37)
  );
  and_cell and5 (
    .a (net34),
    .b (net35),
    .out (net38)
  );
  or_cell or1 (
    .a (net38),
    .b (net37),
    .out (net39)
  );
  and_cell and1 (
    .a (net29),
    .b (net33),
    .out (net40)
  );
  and_cell and4 (
    .a (net40),
    .b (net28),
    .out (net41)
  );
  and_cell and6 (
    .a (net29),
    .b (net28),
    .out (net42)
  );
  and_cell and7 (
    .a (net42),
    .b (net31),
    .out (net43)
  );
  or_cell or2 (
    .a (net41),
    .b (net43),
    .out (net44)
  );
  or_cell or3 (
    .a (net39),
    .b (net44),
    .out (net7)
  );
  and_cell and8 (
    .a (net32),
    .b (net34),
    .out (net45)
  );
  and_cell and9 (
    .a (net45),
    .b (net35),
    .out (net46)
  );
  and_cell and10 (
    .a (net30),
    .b (net34),
    .out (net47)
  );
  and_cell and11 (
    .a (net47),
    .b (net35),
    .out (net48)
  );
  or_cell or4 (
    .a (net46),
    .b (net48),
    .out (net49)
  );
  and_cell and12 (
    .a (net32),
    .b (net30),
    .out (net50)
  );
  and_cell and13 (
    .a (net50),
    .b (net28),
    .out (net51)
  );
  and_cell and14 (
    .a (net29),
    .b (net33),
    .out (net52)
  );
  and_cell and15 (
    .a (net52),
    .b (net53),
    .out (net54)
  );
  and_cell and16 (
    .a (net28),
    .b (net35),
    .out (net53)
  );
  or_cell or5 (
    .a (net51),
    .b (net54),
    .out (net55)
  );
  or_cell or6 (
    .a (net49),
    .b (net55),
    .out (net8)
  );
  and_cell and17 (
    .a (net32),
    .b (net30),
    .out (net56)
  );
  and_cell and18 (
    .a (net56),
    .b (net28),
    .out (net57)
  );
  and_cell and19 (
    .a (net29),
    .b (net34),
    .out (net58)
  );
  and_cell and20 (
    .a (net58),
    .b (net35),
    .out (net59)
  );
  or_cell or7 (
    .a (net57),
    .b (net59),
    .out (net60)
  );
  and_cell and21 (
    .a (net29),
    .b (net33),
    .out (net61)
  );
  and_cell and22 (
    .a (net61),
    .b (net28),
    .out (net62)
  );
  or_cell or8 (
    .a (net60),
    .b (net62),
    .out (net9)
  );
  and_cell and23 (
    .a (net32),
    .b (net33),
    .out (net63)
  );
  and_cell and24 (
    .a (net28),
    .b (net35),
    .out (net64)
  );
  and_cell and25 (
    .a (net63),
    .b (net64),
    .out (net65)
  );
  and_cell and26 (
    .a (net29),
    .b (net33),
    .out (net66)
  );
  and_cell and27 (
    .a (net66),
    .b (net34),
    .out (net67)
  );
  and_cell and28 (
    .a (net29),
    .b (net31),
    .out (net68)
  );
  and_cell and29 (
    .a (net69),
    .b (net28),
    .out (net70)
  );
  and_cell and30 (
    .a (net29),
    .b (net30),
    .out (net69)
  );
  or_cell or9 (
    .a (net65),
    .b (net67),
    .out (net71)
  );
  or_cell or10 (
    .a (net68),
    .b (net70),
    .out (net72)
  );
  or_cell or11 (
    .a (net71),
    .b (net72),
    .out (net10)
  );
  and_cell and31 (
    .a (net28),
    .b (net35),
    .out (net73)
  );
  and_cell and32 (
    .a (net34),
    .b (net31),
    .out (net74)
  );
  or_cell or12 (
    .a (net32),
    .b (net74),
    .out (net75)
  );
  or_cell or13 (
    .a (net73),
    .b (net30),
    .out (net76)
  );
  or_cell or14 (
    .a (net75),
    .b (net76),
    .out (net11)
  );
  and_cell and33 (
    .a (net34),
    .b (net35),
    .out (net77)
  );
  and_cell and34 (
    .a (net78),
    .b (net31),
    .out (net79)
  );
  and_cell and35 (
    .a (net30),
    .b (net28),
    .out (net78)
  );
  and_cell and36 (
    .a (net80),
    .b (net28),
    .out (net81)
  );
  or_cell or15 (
    .a (net77),
    .b (net79),
    .out (net82)
  );
  and_cell and37 (
    .a (net29),
    .b (net33),
    .out (net80)
  );
  or_cell or16 (
    .a (net82),
    .b (net81),
    .out (net13)
  );
endmodule
