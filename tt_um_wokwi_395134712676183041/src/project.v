/* Automatically generated from https://wokwi.com/projects/395134712676183041 */

`default_nettype none

module tt_um_wokwi_395134712676183041(
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
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18 = uio_in[0];
  wire net19;
  wire net20 = uio_in[2];
  wire net21;
  wire net22 = uio_in[4];
  wire net23;
  wire net24 = uio_in[6];
  wire net25;
  wire net26 = 1'b0;
  wire net27 = 1'b1;
  wire net28 = 1'b1;
  wire net29 = 1'b0;
  wire net30 = 1'b1;
  wire net31 = 1'b0;

  assign uo_out[0] = net10;
  assign uo_out[1] = net11;
  assign uo_out[2] = net12;
  assign uo_out[3] = net13;
  assign uo_out[4] = net14;
  assign uo_out[5] = net15;
  assign uo_out[6] = net16;
  assign uo_out[7] = net17;
  assign uio_out[0] = 0;
  assign uio_oe[0] = net8;
  assign uio_out[1] = net19;
  assign uio_oe[1] = net9;
  assign uio_out[2] = 0;
  assign uio_oe[2] = net8;
  assign uio_out[3] = net21;
  assign uio_oe[3] = net9;
  assign uio_out[4] = 0;
  assign uio_oe[4] = net8;
  assign uio_out[5] = net23;
  assign uio_oe[5] = net9;
  assign uio_out[6] = 0;
  assign uio_oe[6] = net8;
  assign uio_out[7] = net25;
  assign uio_oe[7] = net9;

  not_cell not2 (
    .in (net3),
    .out (net11)
  );
  not_cell not3 (
    .in (net4),
    .out (net12)
  );
  not_cell not4 (
    .in (net5),
    .out (net13)
  );
  not_cell not5 (
    .in (net6),
    .out (net14)
  );
  not_cell not6 (
    .in (net7),
    .out (net15)
  );
  not_cell not7 (
    .in (net8),
    .out (net16)
  );
  not_cell not1 (
    .in (net9),
    .out (net17)
  );
  dff_cell flop1 (
    .d (net2),
    .clk (net1),
    .q (net10)
  );
  not_cell not8 (
    .in (net18),
    .out (net19)
  );
  not_cell not9 (
    .in (net20),
    .out (net21)
  );
  not_cell not10 (
    .in (net22),
    .out (net23)
  );
  not_cell not11 (
    .in (net24),
    .out (net25)
  );
endmodule
