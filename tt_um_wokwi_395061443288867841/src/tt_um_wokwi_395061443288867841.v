/* Automatically generated from https://wokwi.com/projects/395061443288867841 */

`default_nettype none

module tt_um_wokwi_395061443288867841(
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,    // Dedicated outputs
  input  wire [7:0] uio_in,    // IOs: Input path
  output wire [7:0] uio_out,    // IOs: Output path
  output wire [7:0] uio_oe,    // IOs: Enable path (active high: 0=input, 1=output)
  input ena,
  input clk,
  input rst_n
);
  wire net1 = ui_in[0];
  wire net2 = ui_in[1];
  wire net3 = ui_in[2];
  wire net4 = ui_in[3];
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12 = 1'b1;
  wire net13 = 1'b0;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
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

  assign uo_out[0] = net5;
  assign uo_out[1] = net6;
  assign uo_out[2] = net7;
  assign uo_out[3] = net8;
  assign uo_out[4] = net9;
  assign uo_out[5] = net10;
  assign uo_out[6] = net11;
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

  or_cell or1 (
    .a (net1),
    .b (net14),
    .out (net5)
  );
  or_cell or2 (
    .a (net3),
    .b (net15),
    .out (net14)
  );
  or_cell or3 (
    .a (net16),
    .b (net17),
    .out (net15)
  );
  not_cell not2 (
    .in (net2),
    .out (net18)
  );
  not_cell not3 (
    .in (net3),
    .out (net19)
  );
  not_cell not4 (
    .in (net4),
    .out (net20)
  );
  and_cell and1 (
    .a (net2),
    .b (net4),
    .out (net16)
  );
  and_cell and2 (
    .a (net18),
    .b (net20),
    .out (net17)
  );
  or_cell or4 (
    .a (net21),
    .b (net18),
    .out (net6)
  );
  and_cell and3 (
    .a (net3),
    .b (net4),
    .out (net22)
  );
  and_cell and4 (
    .a (net19),
    .b (net20),
    .out (net23)
  );
  or_cell or5 (
    .a (net23),
    .b (net22),
    .out (net21)
  );
  or_cell or6 (
    .a (net2),
    .b (net24),
    .out (net7)
  );
  or_cell or7 (
    .a (net19),
    .b (net4),
    .out (net24)
  );
  or_cell or8 (
    .a (net1),
    .b (net25),
    .out (net8)
  );
  or_cell or9 (
    .a (net17),
    .b (net26),
    .out (net25)
  );
  and_cell and5 (
    .a (net18),
    .b (net3),
    .out (net27)
  );
  or_cell or10 (
    .a (net27),
    .b (net28),
    .out (net26)
  );
  and_cell and6 (
    .a (net3),
    .b (net20),
    .out (net29)
  );
  or_cell or11 (
    .a (net29),
    .b (net30),
    .out (net28)
  );
  and_cell and7 (
    .a (net2),
    .b (net4),
    .out (net31)
  );
  and_cell and8 (
    .a (net19),
    .b (net31),
    .out (net30)
  );
  or_cell or12 (
    .a (net17),
    .b (net29),
    .out (net9)
  );
  or_cell or13 (
    .a (net1),
    .b (net32),
    .out (net10)
  );
  and_cell and9 (
    .a (net19),
    .b (net2),
    .out (net33)
  );
  or_cell or14 (
    .a (net33),
    .b (net34),
    .out (net32)
  );
  and_cell and10 (
    .a (net2),
    .b (net20),
    .out (net35)
  );
  and_cell and11 (
    .a (net19),
    .b (net20),
    .out (net36)
  );
  or_cell or15 (
    .a (net35),
    .b (net36),
    .out (net34)
  );
  or_cell or16 (
    .a (net1),
    .b (net37),
    .out (net11)
  );
  or_cell or17 (
    .a (net33),
    .b (net38),
    .out (net37)
  );
  or_cell or18 (
    .a (net27),
    .b (net29),
    .out (net38)
  );
endmodule
