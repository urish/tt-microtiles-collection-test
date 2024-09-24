/* Automatically generated from https://wokwi.com/projects/395054466384583681 */

`default_nettype none

module tt_um_wokwi_395054466384583681(
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
  wire net4 = ui_in[4];
  wire net5 = ui_in[5];
  wire net6 = ui_in[6];
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
  wire net14 = 1'b0;
  wire net15 = 1'b1;
  wire net16 = 1'b0;
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

  assign uo_out[0] = net7;
  assign uo_out[1] = net8;
  assign uo_out[2] = net9;
  assign uo_out[3] = 0;
  assign uo_out[4] = net10;
  assign uo_out[5] = 0;
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

  and_cell gate1 (
    .a (net4),
    .b (net5),
    .out (net17)
  );
  and_cell gate2 (
    .a (net2),
    .b (net3),
    .out (net18)
  );
  xor_cell gate3 (
    .a (net6),
    .b (net18),
    .out (net19)
  );
  and_cell gate4 (
    .a (net19),
    .b (net17),
    .out (net20)
  );
  or_cell gate5 (
    .a (net19),
    .b (net17),
    .out (net21)
  );
  not_cell gate6 (
    .in (net17),
    .out (net22)
  );
  and_cell gate7 (
    .a (net20),
    .b (net3),
    .out (net23)
  );
  and_cell gate8 (
    .a (net21),
    .b (net1),
    .out (net24)
  );
  and_cell gate9 (
    .a (net22),
    .b (net6),
    .out (net25)
  );
  or_cell gate10 (
    .a (net23),
    .b (net24),
    .out (net26)
  );
  or_cell gate11 (
    .a (net26),
    .b (net27),
    .out (net28)
  );
  or_cell gate12 (
    .a (net25),
    .b (net2),
    .out (net27)
  );
  not_cell gate31 (
    .in (net28),
    .out (net7)
  );
  not_cell gate32 (
    .in (net28),
    .out (net8)
  );
  not_cell gate33 (
    .in (net28),
    .out (net9)
  );
  not_cell gate34 (
    .in (net28),
    .out (net10)
  );
endmodule
