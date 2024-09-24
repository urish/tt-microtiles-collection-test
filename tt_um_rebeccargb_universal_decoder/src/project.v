/*
 * Copyright (c) 2024 Rebecca G. Bettencourt
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_rebeccargb_universal_decoder (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire b_a, b_b, b_c, b_d, b_e, b_f, b_g, b_rbo;
  universal_bcd_decoder ubcd(
    .A(ui_in[0]), .B(ui_in[1]), .C(ui_in[2]), .D(ui_in[3]),
    .V0(ui_in[4]), .V1(ui_in[5]), .V2(ui_in[6]), .RBI(ui_in[7]),
    .Qa(b_a), .Qb(b_b), .Qc(b_c), .Qd(b_d), .Qe(b_e), .Qf(b_f), .Qg(b_g),
    .RBO(b_rbo), .X6(uio_in[0]), .X7(uio_in[1]), .X9(uio_in[2]),
    .LT(uio_in[3]), .BI(uio_in[4]), .AL(uio_in[5])
  );

  wire a_a, a_b, a_c, a_d, a_e, a_f, a_g, a_ltr;
  ascii_decoder ad(
    .D0(ui_in[0]), .D1(ui_in[1]), .D2(ui_in[2]), .D3(ui_in[3]),
    .D4(ui_in[4]), .D5(ui_in[5]), .D6(ui_in[6]), .LC(ui_in[7]),
    .Qa(a_a), .Qb(a_b), .Qc(a_c), .Qd(a_d), .Qe(a_e), .Qf(a_f), .Qg(a_g),
    .LTR(a_ltr), .X6(uio_in[0]), .X7(uio_in[1]), .X9(uio_in[2]),
    .FS(uio_in[3]), .ABI(uio_in[4]), .AL(uio_in[5])
  );

  wire c_u1, c_v1, c_w1, c_x1, c_y1, c_u2, c_v2, c_w2, c_x2, c_y2;
  dual_cistercian_decoder dcd(
    .A1(ui_in[0]), .B1(ui_in[1]), .C1(ui_in[2]), .D1(ui_in[3]),
    .A2(ui_in[4]), .B2(ui_in[5]), .C2(ui_in[6]), .D2(ui_in[7]),
    .U1(c_u1), .V1(c_v1), .W1(c_w1), .X1(c_x1), .Y1(c_y1),
    .U2(c_u2), .V2(c_v2), .W2(c_w2), .X2(c_x2), .Y2(c_y2),
    .LT1(uio_in[2]), .LT2(uio_in[3]), .BI(uio_in[4]), .AL(uio_in[5])
  );

  wire k_a, k_b, k_c, k_d, k_e, k_f, k_g, k_h, k_rbo, k_v;
  kaktovik_decoder kd(
    .A(ui_in[0]), .B(ui_in[1]), .C(ui_in[2]), .D(ui_in[3]),
    .E(ui_in[4]), .VBI(ui_in[6]), .RBI(ui_in[7]),
    .Qa(k_a), .Qb(k_b), .Qc(k_c), .Qd(k_d), .Qe(k_e),
    .Qf(k_f), .Qg(k_g), .Qh(k_h), .RBO(k_rbo), .V(k_v),
    .LT(uio_in[3]), .BI(uio_in[4]), .AL(uio_in[5])
  );

  assign uio_oe[7:2] = 0;
  assign uio_oe[1] = uio_in[7];
  assign uio_oe[0] = uio_in[7];

  assign uio_out[7:2] = 0;
  assign uio_out[1] = uio_in[7] ? (uio_in[6] ? k_v : c_y2) : 0;
  assign uio_out[0] = uio_in[7] ? (uio_in[6] ? k_h : c_y1) : 0;

  assign uo_out[0] = uio_in[7] ? (uio_in[6] ? k_a   : c_u1) : (uio_in[6] ? a_a   : b_a  );
  assign uo_out[1] = uio_in[7] ? (uio_in[6] ? k_b   : c_u2) : (uio_in[6] ? a_b   : b_b  );
  assign uo_out[2] = uio_in[7] ? (uio_in[6] ? k_c   : c_v1) : (uio_in[6] ? a_c   : b_c  );
  assign uo_out[3] = uio_in[7] ? (uio_in[6] ? k_d   : c_v2) : (uio_in[6] ? a_d   : b_d  );
  assign uo_out[4] = uio_in[7] ? (uio_in[6] ? k_e   : c_w1) : (uio_in[6] ? a_e   : b_e  );
  assign uo_out[5] = uio_in[7] ? (uio_in[6] ? k_f   : c_w2) : (uio_in[6] ? a_f   : b_f  );
  assign uo_out[6] = uio_in[7] ? (uio_in[6] ? k_g   : c_x1) : (uio_in[6] ? a_g   : b_g  );
  assign uo_out[7] = uio_in[7] ? (uio_in[6] ? k_rbo : c_x2) : (uio_in[6] ? a_ltr : b_rbo);

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
