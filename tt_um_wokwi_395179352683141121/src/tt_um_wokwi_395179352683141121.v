/* Automatically generated from https://wokwi.com/projects/395179352683141121 */

`default_nettype none

module tt_um_wokwi_395179352683141121(
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
  wire net13;
  wire net14;
  wire net15 = 1'b1;
  wire net16 = 1'b1;
  wire net17 = 1'b0;
  wire net18 = 1'b1;
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
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42;
  wire net43 = 1'b0;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48;
  wire net49 = 1'b0;
  wire net50 = 1'b0;

  assign uo_out[0] = net9;
  assign uo_out[1] = net10;
  assign uo_out[2] = net11;
  assign uo_out[3] = net12;
  assign uo_out[4] = net13;
  assign uo_out[5] = net14;
  assign uo_out[6] = 0;
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

  dff_cell flop1 (
    .d (net19),
    .clk (net1),
    .q (net10),
    .notq (net20)
  );
  dff_cell flop2 (
    .d (net21),
    .clk (net1),
    .q (net12),
    .notq (net22)
  );
  dff_cell flop3 (
    .d (net23),
    .clk (net1),
    .q (net9),
    .notq (net24)
  );
  dff_cell flop4 (
    .d (net25),
    .clk (net1),
    .q (net11),
    .notq (net26)
  );
  nand_cell nand3 (
    .a (net27),
    .b (net27),
    .out (net28)
  );
  xor_cell xor1 (
    .a (net4),
    .b (net24),
    .out (net29)
  );
  xor_cell xor2 (
    .a (net5),
    .b (net20),
    .out (net30)
  );
  xor_cell xor3 (
    .a (net6),
    .b (net26),
    .out (net31)
  );
  xor_cell xor4 (
    .a (net7),
    .b (net22),
    .out (net32)
  );
  and_cell and2 (
    .a (net33),
    .b (net34),
    .out (net35)
  );
  and_cell and4 (
    .a (net31),
    .b (net32),
    .out (net34)
  );
  and_cell and5 (
    .a (net29),
    .b (net30),
    .out (net33)
  );
  and_cell and6 (
    .a (net35),
    .b (net27),
    .out (net13)
  );
  and_cell and1 (
    .a (net3),
    .b (net28),
    .out (net36)
  );
  nand_cell nand6 (
    .a (net37),
    .b (net37),
    .out (net38)
  );
  nand_cell nand8 (
    .a (net13),
    .b (net13),
    .out (net39)
  );
  nand_cell nand9 (
    .a (net40),
    .b (net41),
    .out (net14)
  );
  dffsr_cell flop6 (
    .d (net42),
    .clk (net1),
    .s (net43),
    .r (net44),
    .q (net37),
    .notq (net45)
  );
  dffsr_cell flop5 (
    .d (net46),
    .clk (net45),
    .s (net43),
    .r (net44),
    .q (net47),
    .notq (net46)
  );
  dffsr_cell flop7 (
    .d (net48),
    .clk (net46),
    .s (net43),
    .r (net44),
    .q (net41),
    .notq (net48)
  );
  and_cell and8 (
    .a (net8),
    .b (net14),
    .out (net27)
  );
  nand_cell nand10 (
    .a (net2),
    .b (net2),
    .out (net44)
  );
  mux_cell mux1 (
    .a (net9),
    .b (net4),
    .sel (net36),
    .out (net23)
  );
  mux_cell mux2 (
    .a (net10),
    .b (net5),
    .sel (net36),
    .out (net19)
  );
  mux_cell mux3 (
    .a (net11),
    .b (net6),
    .sel (net36),
    .out (net25)
  );
  mux_cell mux4 (
    .a (net12),
    .b (net7),
    .sel (net36),
    .out (net21)
  );
  and_cell and3 (
    .a (net39),
    .b (net27),
    .out (net42)
  );
  and_cell and7 (
    .a (net38),
    .b (net47),
    .out (net40)
  );
endmodule
