/* Automatically generated from https://wokwi.com/projects/395054508867644417 */

`default_nettype none

module tt_um_wokwi_395054508867644417(
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
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13 = uio_in[0];
  wire net14;
  wire net15 = uio_in[1];
  wire net16;
  wire net17 = uio_in[2];
  wire net18;
  wire net19 = uio_in[3];
  wire net20;
  wire net21 = uio_in[4];
  wire net22;
  wire net23 = uio_in[5];
  wire net24;
  wire net25 = 1'b0;
  wire net26 = 1'b1;
  wire net27 = 1'b1;
  wire net28 = 1'b0;
  wire net29 = 1'b1;
  wire net30;
  wire net31;
  wire net32 = 1'b0;
  wire net33;
  wire net34;
  wire net35;
  wire net36;
  wire net37;
  wire net38;
  wire net39;

  assign uo_out[0] = net9;
  assign uo_out[1] = net10;
  assign uo_out[2] = net11;
  assign uo_out[3] = net12;
  assign uo_out[4] = 0;
  assign uo_out[5] = 0;
  assign uo_out[6] = 0;
  assign uo_out[7] = 0;
  assign uio_out[0] = net14;
  assign uio_oe[0] = net8;
  assign uio_out[1] = net16;
  assign uio_oe[1] = net8;
  assign uio_out[2] = net18;
  assign uio_oe[2] = net8;
  assign uio_out[3] = net20;
  assign uio_oe[3] = net8;
  assign uio_out[4] = net22;
  assign uio_oe[4] = net8;
  assign uio_out[5] = net24;
  assign uio_oe[5] = net8;
  assign uio_out[6] = 0;
  assign uio_oe[6] = 0;
  assign uio_out[7] = 0;
  assign uio_oe[7] = 0;

  mux_cell mux1 (
    .a (net3),
    .b (net5),
    .sel (net7),
    .out (net30)
  );
  mux_cell mux2 (
    .a (net4),
    .b (net6),
    .sel (net7),
    .out (net31)
  );
  dffsr_cell flop1 (
    .d (net30),
    .clk (net1),
    .s (net32),
    .r (net33),
    .q (net14),
    .notq (net20)
  );
  dffsr_cell flop2 (
    .d (net31),
    .clk (net1),
    .s (net32),
    .r (net33),
    .q (net16),
    .notq (net22)
  );
  not_cell not1 (
    .in (net2),
    .out (net33)
  );
  xor_cell xor1 (
    .a (net14),
    .b (net16),
    .out (net18)
  );
  xor_cell xor3 (
    .a (net20),
    .b (net22),
    .out (net24)
  );
  xor_cell xor2 (
    .a (net13),
    .b (net17),
    .out (net34)
  );
  xor_cell xor4 (
    .a (net34),
    .b (net15),
    .out (net9)
  );
  and_cell and3 (
    .a (net34),
    .b (net15),
    .out (net35)
  );
  and_cell and4 (
    .a (net13),
    .b (net17),
    .out (net36)
  );
  or_cell or1 (
    .a (net36),
    .b (net35),
    .out (net10)
  );
  xor_cell xor5 (
    .a (net19),
    .b (net23),
    .out (net37)
  );
  xor_cell xor6 (
    .a (net37),
    .b (net21),
    .out (net11)
  );
  and_cell and1 (
    .a (net37),
    .b (net21),
    .out (net38)
  );
  and_cell and2 (
    .a (net19),
    .b (net23),
    .out (net39)
  );
  or_cell or2 (
    .a (net39),
    .b (net38),
    .out (net12)
  );
endmodule
