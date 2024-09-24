/* Automatically generated from https://wokwi.com/projects/384437973887503361 */

`default_nettype none

module tt_um_wokwi_384437973887503361(
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
  wire net2;
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9 = 1'b0;
  wire net10 = 1'b1;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
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
  wire net38 = 1'b0;
  wire net39 = 1'b0;
  wire net40 = 1'b1;

  assign uo_out[0] = net2;
  assign uo_out[1] = net3;
  assign uo_out[2] = net4;
  assign uo_out[3] = net5;
  assign uo_out[4] = net6;
  assign uo_out[5] = net7;
  assign uo_out[6] = net8;
  assign uo_out[7] = net9;
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
    .d (net11),
    .clk (net1),
    .q (net12),
    .notq (net11)
  );
  dff_cell flop2 (
    .d (net13),
    .clk (net12),
    .q (net14),
    .notq (net13)
  );
  dff_cell flop3 (
    .d (net15),
    .clk (net14),
    .q (net16),
    .notq (net15)
  );
  and_cell and1 (
    .a (net17),
    .b (net18),
    .out (net19)
  );
  and_cell and2 (
    .a (net12),
    .b (net16),
    .out (net20)
  );
  and_cell and3 (
    .a (net14),
    .b (net18),
    .out (net21)
  );
  and_cell and4 (
    .a (net12),
    .b (net18),
    .out (net22)
  );
  and_cell and5 (
    .a (net14),
    .b (net16),
    .out (net23)
  );
  and_cell and6 (
    .a (net24),
    .b (net18),
    .out (net25)
  );
  and_cell and7 (
    .a (net12),
    .b (net24),
    .out (net26)
  );
  and_cell and8 (
    .a (net17),
    .b (net14),
    .out (net27)
  );
  and_cell and9 (
    .a (net12),
    .b (net24),
    .out (net28)
  );
  and_cell and10 (
    .a (net14),
    .b (net18),
    .out (net29)
  );
  not_cell not1 (
    .in (net16),
    .out (net18)
  );
  not_cell not2 (
    .in (net12),
    .out (net17)
  );
  not_cell not3 (
    .in (net14),
    .out (net24)
  );
  and_cell and11 (
    .a (net26),
    .b (net16),
    .out (net30)
  );
  or_cell or1 (
    .a (net14),
    .b (net19),
    .out (net31)
  );
  or_cell or2 (
    .a (net17),
    .b (net23),
    .out (net32)
  );
  or_cell or3 (
    .a (net24),
    .b (net12),
    .out (net33)
  );
  or_cell or4 (
    .a (net19),
    .b (net30),
    .out (net34)
  );
  or_cell or5 (
    .a (net19),
    .b (net29),
    .out (net6)
  );
  or_cell or6 (
    .a (net25),
    .b (net28),
    .out (net35)
  );
  or_cell or7 (
    .a (net27),
    .b (net21),
    .out (net36)
  );
  or_cell or8 (
    .a (net31),
    .b (net20),
    .out (net2)
  );
  or_cell or9 (
    .a (net32),
    .b (net25),
    .out (net3)
  );
  or_cell or10 (
    .a (net33),
    .b (net16),
    .out (net4)
  );
  or_cell or11 (
    .a (net34),
    .b (net37),
    .out (net5)
  );
  or_cell or12 (
    .a (net27),
    .b (net29),
    .out (net37)
  );
  or_cell or13 (
    .a (net35),
    .b (net22),
    .out (net7)
  );
  or_cell or14 (
    .a (net36),
    .b (net28),
    .out (net8)
  );
endmodule
