/* Automatically generated from https://wokwi.com/projects/395054823837887489 */

`default_nettype none

module tt_um_wokwi_395054823837887489(
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
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b0;
  wire net14 = 1'b1;
  wire net15;
  wire net16;
  wire net17 = 1'b0;
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
  wire net34 = 1'b1;

  assign uo_out[0] = net4;
  assign uo_out[1] = net5;
  assign uo_out[2] = net6;
  assign uo_out[3] = net7;
  assign uo_out[4] = net8;
  assign uo_out[5] = net9;
  assign uo_out[6] = net10;
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

  dffsr_cell flop1 (
    .d (net15),
    .clk (net1),
    .s (net16),
    .r (net17),
    .q (net18)
  );
  dffsr_cell flop2 (
    .d (net19),
    .clk (net1),
    .s (net17),
    .r (net16),
    .q (net20)
  );
  dffsr_cell flop3 (
    .d (net21),
    .clk (net1),
    .s (net17),
    .r (net16),
    .q (net22)
  );
  dffsr_cell flop5 (
    .d (net23),
    .clk (net1),
    .s (net17),
    .r (net16),
    .q (net24)
  );
  dffsr_cell flop6 (
    .d (net25),
    .clk (net1),
    .s (net17),
    .r (net16),
    .q (net26)
  );
  dffsr_cell flop7 (
    .d (net27),
    .clk (net1),
    .s (net17),
    .r (net16),
    .q (net28)
  );
  not_cell not1 (
    .in (net2),
    .out (net16)
  );
  or_cell or1 (
    .a (net20),
    .b (net22),
    .out (net29)
  );
  or_cell or2 (
    .a (net26),
    .b (net28),
    .out (net30)
  );
  or_cell or3 (
    .a (net29),
    .b (net30),
    .out (net4)
  );
  or_cell or4 (
    .a (net18),
    .b (net24),
    .out (net31)
  );
  or_cell or5 (
    .a (net29),
    .b (net31),
    .out (net5)
  );
  or_cell or6 (
    .a (net30),
    .b (net22),
    .out (net32)
  );
  or_cell or7 (
    .a (net31),
    .b (net32),
    .out (net6)
  );
  or_cell or8 (
    .a (net29),
    .b (net30),
    .out (net7)
  );
  or_cell or9 (
    .a (net20),
    .b (net28),
    .out (net8)
  );
  or_cell or11 (
    .a (net30),
    .b (net24),
    .out (net9)
  );
  or_cell or10 (
    .a (net29),
    .b (net30),
    .out (net33)
  );
  or_cell or12 (
    .a (net33),
    .b (net24),
    .out (net10)
  );
  mux_cell mux1 (
    .a (net18),
    .b (net20),
    .sel (net3),
    .out (net19)
  );
  mux_cell mux2 (
    .a (net20),
    .b (net22),
    .sel (net3),
    .out (net21)
  );
  mux_cell mux3 (
    .a (net22),
    .b (net24),
    .sel (net3),
    .out (net23)
  );
  mux_cell mux4 (
    .a (net24),
    .b (net26),
    .sel (net3),
    .out (net25)
  );
  mux_cell mux5 (
    .a (net26),
    .b (net28),
    .sel (net3),
    .out (net27)
  );
  mux_cell mux6 (
    .a (net28),
    .b (net18),
    .sel (net3),
    .out (net15)
  );
endmodule
