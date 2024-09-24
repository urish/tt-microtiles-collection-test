/* Automatically generated from https://wokwi.com/projects/395055722430895105 */

`default_nettype none

module tt_um_wokwi_395055722430895105(
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
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17 = 1'b0;

  assign uo_out[0] = net3;
  assign uo_out[1] = net4;
  assign uo_out[2] = net5;
  assign uo_out[3] = net6;
  assign uo_out[4] = net7;
  assign uo_out[5] = net8;
  assign uo_out[6] = net9;
  assign uo_out[7] = net10;
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

  dffsr_cell flop10 (
    .d (net2),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net13)
  );
  dffsr_cell flop11 (
    .d (net13),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net14)
  );
  dffsr_cell flop12 (
    .d (net14),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net3)
  );
  not_cell not1 (
    .in (net2),
    .out (net15)
  );
  and_cell and4 (
    .a (net15),
    .b (net16),
    .out (net12)
  );
  dff_cell flop13 (
    .d (net2),
    .clk (net1),
    .q (net16)
  );
  dffsr_cell flop14 (
    .d (net3),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net4)
  );
  dffsr_cell flop15 (
    .d (net4),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net5)
  );
  dffsr_cell flop16 (
    .d (net5),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net6)
  );
  dffsr_cell flop17 (
    .d (net6),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net7)
  );
  dffsr_cell flop18 (
    .d (net7),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net8)
  );
  dffsr_cell flop19 (
    .d (net8),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net9)
  );
  dffsr_cell flop20 (
    .d (net9),
    .clk (net1),
    .s (net11),
    .r (net12),
    .q (net10)
  );
endmodule
