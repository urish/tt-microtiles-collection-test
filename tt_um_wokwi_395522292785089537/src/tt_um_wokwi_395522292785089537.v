/* Automatically generated from https://wokwi.com/projects/395522292785089537 */

`default_nettype none

module tt_um_wokwi_395522292785089537(
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
  wire net5 = ui_in[2];
  wire net6 = ui_in[3];
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
  wire net14 = 1'b0;
  wire net15 = 1'b1;
  wire net16;
  wire net17;
  wire net18;
  wire net19;

  assign uo_out[0] = net7;
  assign uo_out[1] = net8;
  assign uo_out[2] = net8;
  assign uo_out[3] = net9;
  assign uo_out[4] = net9;
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

  and_cell and1 (
    .a (net2),
    .b (net3),
    .out (net16)
  );
  mux_cell mux1 (
    .a (net4),
    .b (net10),
    .sel (net16),
    .out (net17)
  );
  mux_cell mux2 (
    .a (net5),
    .b (net7),
    .sel (net16),
    .out (net18)
  );
  mux_cell mux3 (
    .a (net6),
    .b (net8),
    .sel (net16),
    .out (net19)
  );
  dff_cell flop1 (
    .d (net17),
    .clk (net1),
    .q (net7)
  );
  dff_cell flop3 (
    .d (net18),
    .clk (net1),
    .q (net8)
  );
  dff_cell flop4 (
    .d (net19),
    .clk (net1),
    .q (net10)
  );
  or_cell or1 (
    .a (net7),
    .b (net10),
    .out (net9)
  );
endmodule
