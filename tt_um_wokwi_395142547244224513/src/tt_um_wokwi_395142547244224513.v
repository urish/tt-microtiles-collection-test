/* Automatically generated from https://wokwi.com/projects/395142547244224513 */

`default_nettype none

module tt_um_wokwi_395142547244224513(
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
  wire net4 = ui_in[2];
  wire net5 = ui_in[3];
  wire net6 = ui_in[4];
  wire net7 = ui_in[5];
  wire net8 = ui_in[7];
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14 = 1'b0;
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

  assign uo_out[0] = net9;
  assign uo_out[1] = net10;
  assign uo_out[2] = net11;
  assign uo_out[3] = net12;
  assign uo_out[4] = net13;
  assign uo_out[5] = net13;
  assign uo_out[6] = net13;
  assign uo_out[7] = net1;
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

  or_cell or1 (
    .a (net19),
    .b (net20),
    .out (net21)
  );
  or_cell or2 (
    .a (net22),
    .b (net20),
    .out (net23)
  );
  not_cell not1 (
    .in (net20),
    .out (net24)
  );
  dff_cell flop1 (
    .d (net25),
    .clk (net1),
    .q (net22)
  );
  dff_cell flop2 (
    .d (net26),
    .clk (net1),
    .q (net27)
  );
  dff_cell flop3 (
    .d (net28),
    .clk (net1),
    .q (net19)
  );
  dff_cell flop4 (
    .d (net29),
    .clk (net1),
    .q (net20)
  );
  and_cell and4 (
    .a (net2),
    .b (net3),
    .out (net30)
  );
  and_cell and5 (
    .a (net13),
    .b (net24),
    .out (net9)
  );
  and_cell and6 (
    .a (net13),
    .b (net19),
    .out (net10)
  );
  and_cell and7 (
    .a (net13),
    .b (net21),
    .out (net11)
  );
  and_cell and8 (
    .a (net13),
    .b (net23),
    .out (net12)
  );
  or_cell or4 (
    .a (net31),
    .b (net8),
    .out (net13)
  );
  not_cell not3 (
    .in (net1),
    .out (net31)
  );
  mux_cell mux1 (
    .a (net4),
    .b (net20),
    .sel (net30),
    .out (net25)
  );
  mux_cell mux2 (
    .a (net5),
    .b (net22),
    .sel (net30),
    .out (net26)
  );
  mux_cell mux3 (
    .a (net6),
    .b (net27),
    .sel (net30),
    .out (net28)
  );
  mux_cell mux4 (
    .a (net7),
    .b (net19),
    .sel (net30),
    .out (net29)
  );
endmodule
