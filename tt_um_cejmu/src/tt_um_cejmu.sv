/*
 * Copyright (c) 2024 CEJMU
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

(* keep_hierarchy *)
(* keep *)
module tt_um_cejmu (
    input  logic [7:0] ui_in,    // Dedicated inputs
    output logic [7:0] uo_out,   // Dedicated outputs
    input  logic [7:0] uio_in,   // IOs: Input path
    output logic [7:0] uio_out,  // IOs: Output path
    output logic [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  logic       ena,      // always 1 when the design is powered, so you can ignore it
    input  logic       clk,      // clock
    input  logic       rst_n     // reset_n - low to reset
);

    parameter int      WIDTH = 24;

    logic [7:0]        project_mux;
    logic              rst;
    logic              bav0_out;
    logic              bav1_out;
    logic [7:0]        serdes_out;

    logic [WIDTH-1:0]  add_a, add_b;
    logic [WIDTH:0]    cla_z, rca_z, add_result;

    logic [5:0]        coin;
    logic              pulse_out;
    

    always_comb begin
        case(uio_in[1:0]) // Multiplexer for submodule outputs
          2'b00: project_mux = {7'b0, bav0_out};
          2'b01: project_mux = {coin, pulse_out, bav1_out};
          2'b10: project_mux = serdes_out;
          2'b11: project_mux = serdes_out;

          default: project_mux = ui_in;
        endcase;
    end

    // All output pins must be assigned. If not used, assign to 0.
    assign uo_out  = project_mux;

    // bit 7 and 6 are overflow for adders.
    // NOTE Can be changed, just inital idea
    assign uio_oe  = 8'b11000000;
    assign uio_out[7] = cla_z[WIDTH];
    assign uio_out[6] = rca_z[WIDTH];
    assign uio_out[5:0] = 0;

    assign rst = !rst_n;

    // List all unused inputs to prevent warnings
    logic _unused = &{ena, clk, rst_n, 1'b0};

    baverage bav0 (
        .x(ui_in[1:0]),
        .clk(clk),
        .rst(rst),
        .y(bav0_out)
    );

    baverage bav1 (
        .x(coin[1:0]),
        .clk(clk),
        .rst(rst),
        .y(bav1_out)
    );

    coin_acceptor ca (
        .clk(clk),
        .rst(rst),
        .pulse_in(ui_in[0]),
        .coin_out(coin),
        .pulse_out(pulse_out)
    );

    // comment out for real hardware!
    // defparam ca.COMMIT_COUNTER_MAX = 15;

    io_serdes #(WIDTH) io_sd (
        .clk(clk),
        .reset(rst_n),
        .inputs(ui_in),
        .outputs(serdes_out),
        .a(add_a),
        .b(add_b),
        .z(add_result[WIDTH-1:0]),
        .start_calc(uio_in[2]),
        .output_result(uio_in[3])
    );

    assign add_result = (uio_in[1:0] == 2'b10) ? rca_z : cla_z;

    cla #(WIDTH) cla (
        .a(add_a),
        .b(add_b),
        .z(cla_z)
    );

    rca #(WIDTH) rca (
        .a(add_a),
        .b(add_b),
        .s(rca_z)
    );

endmodule
