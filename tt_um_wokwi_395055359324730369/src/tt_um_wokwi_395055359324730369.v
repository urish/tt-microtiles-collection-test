/* Automatically generated from https://wokwi.com/projects/395055359324730369 */

`default_nettype none

module tt_um_wokwi_395055359324730369(
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
  wire net3 = ui_in[0];
  wire net4 = ui_in[1];
  wire net5 = ui_in[5];
  wire net6 = ui_in[6];
  wire net7 = ui_in[7];
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16 = 1'b0;
  wire net17 = 1'b1;
  wire net18 = 1'b1;
  wire net19 = 1'b0;
  wire net20 = 1'b1;
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

  assign uo_out[0] = net8;
  assign uo_out[1] = net9;
  assign uo_out[2] = net10;
  assign uo_out[3] = net11;
  assign uo_out[4] = net12;
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

  dff_cell flop1 (
    .d (net21),
    .clk (net1),
    .q (net22),
    .notq (net21)
  );
  dff_cell flop2 (
    .d (net23),
    .clk (net22),
    .q (net24),
    .notq (net23)
  );
  dff_cell flop3 (
    .d (net25),
    .clk (net24),
    .q (net26),
    .notq (net25)
  );
  dff_cell flop4 (
    .d (net27),
    .clk (net26),
    .q (net28),
    .notq (net27)
  );
  dff_cell flop5 (
    .d (net29),
    .clk (net28),
    .q (net30),
    .notq (net29)
  );
  dff_cell flop6 (
    .d (net31),
    .clk (net30),
    .q (net32),
    .notq (net31)
  );
  dff_cell flop7 (
    .d (net33),
    .clk (net32),
    .q (net34),
    .notq (net33)
  );
  dff_cell flop8 (
    .d (net35),
    .clk (net34),
    .q (net36),
    .notq (net35)
  );
  dff_cell flop9 (
    .d (net37),
    .clk (net36),
    .q (net38),
    .notq (net37)
  );
  dff_cell flop10 (
    .d (net39),
    .clk (net38),
    .q (net40),
    .notq (net39)
  );
  dff_cell flop11 (
    .d (net41),
    .clk (net40),
    .q (net42),
    .notq (net41)
  );
  dff_cell flop12 (
    .d (net43),
    .clk (net42),
    .q (net44),
    .notq (net43)
  );
  dff_cell flop13 (
    .d (net45),
    .clk (net44),
    .q (net46),
    .notq (net45)
  );
  and_cell and1 (
    .a (net47),
    .b (net44),
    .out (net48)
  );
  and_cell and2 (
    .a (net7),
    .b (net46),
    .out (net49)
  );
  or_cell or1 (
    .a (net48),
    .b (net49),
    .out (net50)
  );
  or_cell or2 (
    .a (net51),
    .b (net50),
    .out (net52)
  );
  or_cell or3 (
    .a (net47),
    .b (net7),
    .out (net53)
  );
  not_cell not1 (
    .in (net53),
    .out (net51)
  );
  not_cell not2 (
    .in (net5),
    .out (net54)
  );
  dffsr_cell flop15 (
    .d (net55),
    .clk (net56),
    .r (net57),
    .q (net58)
  );
  dffsr_cell flop16 (
    .d (net58),
    .clk (net56),
    .r (net57),
    .q (net59)
  );
  dffsr_cell flop17 (
    .d (net59),
    .clk (net56),
    .r (net57),
    .q (net60)
  );
  dffsr_cell flop18 (
    .d (net60),
    .clk (net56),
    .r (net57),
    .q (net11)
  );
  dffsr_cell flop19 (
    .d (net11),
    .clk (net56),
    .r (net57),
    .q (net61)
  );
  dffsr_cell flop20 (
    .d (net61),
    .clk (net56),
    .r (net57),
    .q (net62),
    .notq (net55)
  );
  not_cell not3 (
    .in (net63),
    .out (net57)
  );
  or_cell or4 (
    .a (net14),
    .b (net62),
    .out (net13)
  );
  or_cell or5 (
    .a (net14),
    .b (net61),
    .out (net12)
  );
  or_cell or7 (
    .a (net64),
    .b (net60),
    .out (net10)
  );
  or_cell or8 (
    .a (net64),
    .b (net59),
    .out (net9)
  );
  or_cell or9 (
    .a (net65),
    .b (net58),
    .out (net8)
  );
  dffsr_cell flop22 (
    .d (net66),
    .clk (net56),
    .r (net3),
    .q (net64),
    .notq (net66)
  );
  not_cell not5 (
    .in (net64),
    .out (net67)
  );
  or_cell or10 (
    .a (net64),
    .b (net67),
    .out (net68)
  );
  and_cell and4 (
    .a (net2),
    .b (net3),
    .out (net63)
  );
  and_cell and5 (
    .a (net69),
    .b (net68),
    .out (net14)
  );
  and_cell and6 (
    .a (net69),
    .b (net67),
    .out (net65)
  );
  not_cell not4 (
    .in (net3),
    .out (net69)
  );
  not_cell not6 (
    .in (net6),
    .out (net47)
  );
  and_cell and7 (
    .a (net54),
    .b (net52),
    .out (net56)
  );
  and_cell and8 (
    .a (net70),
    .b (net56),
    .out (net15)
  );
  not_cell not7 (
    .in (net4),
    .out (net70)
  );
endmodule
