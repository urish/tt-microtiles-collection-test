/* Automatically generated from https://wokwi.com/projects/395355133883896833 */

`default_nettype none

module tt_um_wokwi_395355133883896833(
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
  wire net7 = ui_in[4];
  wire net8 = ui_in[5];
  wire net9 = ui_in[6];
  wire net10 = ui_in[7];
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19 = 1'b0;
  wire net20 = 1'b1;
  wire net21 = 1'b1;
  wire net22 = 1'b0;
  wire net23 = 1'b1;
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

  assign uo_out[0] = net11;
  assign uo_out[1] = net12;
  assign uo_out[2] = net13;
  assign uo_out[3] = net14;
  assign uo_out[4] = net15;
  assign uo_out[5] = net16;
  assign uo_out[6] = net17;
  assign uo_out[7] = net18;
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

  and_cell and5 (
    .a (net3),
    .b (net4),
    .out (net11)
  );
  dff_cell flop2 (
    .d (net8),
    .clk (net1),
    .q (net24),
    .notq (net25)
  );
  mux_cell mux1 (
    .a (net26),
    .b (net24),
    .sel (net10),
    .out (net27)
  );
  dffsr_cell flop3 (
    .d (net8),
    .clk (net1),
    .s (net7),
    .r (net2),
    .q (net26),
    .notq (net28)
  );
  nand_cell nand1 (
    .a (net3),
    .b (net4),
    .out (net12)
  );
  xor_cell xor1 (
    .a (net3),
    .b (net4),
    .out (net16)
  );
  not_cell not1 (
    .in (net3),
    .out (net15)
  );
  or_cell or1 (
    .a (net3),
    .b (net4),
    .out (net13)
  );
  or_cell or2 (
    .a (net3),
    .b (net4),
    .out (net29)
  );
  not_cell not2 (
    .in (net29),
    .out (net14)
  );
  mux_cell mux2 (
    .a (net28),
    .b (net25),
    .sel (net10),
    .out (net30)
  );
  dff_cell flop4 (
    .d (net31),
    .clk (net1),
    .q (net32),
    .notq (net33)
  );
  and_cell and1 (
    .a (net34),
    .b (net32),
    .out (net35)
  );
  and_cell and2 (
    .a (net33),
    .b (net5),
    .out (net36)
  );
  or_cell or3 (
    .a (net36),
    .b (net35),
    .out (net31)
  );
  not_cell not3 (
    .in (net6),
    .out (net34)
  );
  mux_cell mux3 (
    .a (net30),
    .b (net33),
    .sel (net9),
    .out (net18)
  );
  mux_cell mux4 (
    .a (net27),
    .b (net32),
    .sel (net9),
    .out (net17)
  );
endmodule
