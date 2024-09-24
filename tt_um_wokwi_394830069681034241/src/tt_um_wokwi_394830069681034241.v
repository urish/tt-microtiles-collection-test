/* Automatically generated from https://wokwi.com/projects/394830069681034241 */

`default_nettype none

module tt_um_wokwi_394830069681034241(
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
  wire net4 = ui_in[7];
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13 = 1'b1;
  wire net14 = 1'b1;
  wire net15 = 1'b0;
  wire net16 = 1'b1;
  wire net17;
  wire net18;
  wire net19;
  wire net20 = 1'b0;
  wire net21;

  assign uo_out[0] = net5;
  assign uo_out[1] = net6;
  assign uo_out[2] = net7;
  assign uo_out[3] = net8;
  assign uo_out[4] = net9;
  assign uo_out[5] = net10;
  assign uo_out[6] = net11;
  assign uo_out[7] = net12;
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

  xor_cell xor1 (
    .a (net17),
    .b (net8),
    .out (net18)
  );
  xor_cell xor2 (
    .a (net17),
    .b (net9),
    .out (net19)
  );
  dffsr_cell flop9 (
    .d (net17),
    .clk (net1),
    .s (net4),
    .r (net21),
    .q (net5)
  );
  dffsr_cell flop10 (
    .d (net5),
    .clk (net1),
    .s (net4),
    .r (net21),
    .q (net6)
  );
  dffsr_cell flop11 (
    .d (net6),
    .clk (net1),
    .s (net4),
    .r (net21),
    .q (net7)
  );
  dffsr_cell flop12 (
    .d (net7),
    .clk (net1),
    .s (net4),
    .r (net21),
    .q (net8)
  );
  dffsr_cell flop13 (
    .d (net18),
    .clk (net1),
    .s (net4),
    .r (net21),
    .q (net9)
  );
  dffsr_cell flop14 (
    .d (net19),
    .clk (net1),
    .s (net4),
    .r (net21),
    .q (net10)
  );
  dffsr_cell flop15 (
    .d (net10),
    .clk (net1),
    .s (net4),
    .r (net21),
    .q (net11)
  );
  dffsr_cell flop16 (
    .d (net11),
    .clk (net1),
    .s (net4),
    .r (net21),
    .q (net12)
  );
  not_cell not1 (
    .in (net2),
    .out (net21)
  );
  xor_cell xor3 (
    .a (net12),
    .b (net3),
    .out (net17)
  );
endmodule
