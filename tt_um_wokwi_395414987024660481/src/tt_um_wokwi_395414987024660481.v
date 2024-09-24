/* Automatically generated from https://wokwi.com/projects/395414987024660481 */

`default_nettype none

module tt_um_wokwi_395414987024660481(
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
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9 = 1'b0;
  wire net10 = 1'b0;
  wire net11 = 1'b1;
  wire net12 = 1'b0;
  wire net13 = 1'b1;
  wire net14 = 1'b0;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21;
  wire net22 = 1'b1;
  wire net23 = 1'b0;
  wire net24;
  wire net25 = 1'b0;
  wire net26 = 1'b0;
  wire net27;
  wire net28 = 1'b1;
  wire net29 = 1'b1;
  wire net30;
  wire net31;
  wire net32 = 1'b0;
  wire net33;

  assign uo_out[0] = net3;
  assign uo_out[1] = net4;
  assign uo_out[2] = net5;
  assign uo_out[3] = net6;
  assign uo_out[4] = net7;
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

  dff_cell flipflop1 (
    .d (net15),
    .clk (net1),
    .q (net5)
  );
  dff_cell flipflop2 (
    .d (net16),
    .clk (net1),
    .q (net17)
  );
  dff_cell flipflop3 (
    .d (net18),
    .clk (net1),
    .q (net19)
  );
  dff_cell flipflop4 (
    .d (net20),
    .clk (net1),
    .q (net21)
  );
  mux_cell mux2 (
    .a (net5),
    .b (net23),
    .sel (net24),
    .out (net16)
  );
  not_cell not1 (
    .in (net2),
    .out (net24)
  );
  mux_cell mux1 (
    .a (net17),
    .b (net25),
    .sel (net24),
    .out (net18)
  );
  mux_cell mux3 (
    .a (net19),
    .b (net26),
    .sel (net24),
    .out (net20)
  );
  mux_cell mux4 (
    .a (net27),
    .b (net28),
    .sel (net24),
    .out (net15)
  );
  or_cell or1 (
    .a (net17),
    .b (net21),
    .out (net3)
  );
  or_cell or2 (
    .a (net5),
    .b (net21),
    .out (net4)
  );
  or_cell or4 (
    .a (net17),
    .b (net19),
    .out (net6)
  );
  dff_cell flipflop5 (
    .d (net30),
    .clk (net1),
    .q (net27),
    .notq (net31)
  );
  mux_cell mux5 (
    .a (net21),
    .b (net32),
    .sel (net24),
    .out (net30)
  );
  and_cell and1 (
    .a (net29),
    .b (net31),
    .out (net7)
  );
  or_cell or3 (
    .a (net33),
    .b (net21),
    .out (net8)
  );
  or_cell or5 (
    .a (net5),
    .b (net17),
    .out (net33)
  );
endmodule
