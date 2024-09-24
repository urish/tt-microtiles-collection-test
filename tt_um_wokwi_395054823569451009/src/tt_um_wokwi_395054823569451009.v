/* Automatically generated from https://wokwi.com/projects/395054823569451009 */

`default_nettype none

module tt_um_wokwi_395054823569451009(
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
  wire net3 = ui_in[2];
  wire net4 = ui_in[6];
  wire net5;
  wire net6;
  wire net7;
  wire net8 = 1'b0;
  wire net9 = 1'b1;
  wire net10 = 1'b1;
  wire net11 = 1'b0;
  wire net12 = 1'b1;

  assign uo_out[0] = net5;
  assign uo_out[1] = net6;
  assign uo_out[2] = net6;
  assign uo_out[3] = net5;
  assign uo_out[4] = net5;
  assign uo_out[5] = net5;
  assign uo_out[6] = net5;
  assign uo_out[7] = net7;
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
    .d (net2),
    .clk (net1),
    .q (net6)
  );
  dff_cell flop2 (
    .d (net3),
    .clk (net1),
    .q (net5)
  );
  dff_cell flop3 (
    .d (net4),
    .clk (net1),
    .q (net7)
  );
endmodule
