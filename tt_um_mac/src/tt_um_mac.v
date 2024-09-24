/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`timescale 1ns / 1ps
module tt_um_mac(
     input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire [3:0] A, B;
    wire [7:0] Prod;        // 8-bit product from Dadda multiplier
    reg [7:0] Acc;          // 8-bit accumulator register
    wire [7:0] Sum;         // 8-bit sum from Kogge-Stone adder
    assign uio_oe = 8'b0;  // Assuming uio is always input in this context
    assign A = ui_in[3:0];
    assign B = uio_in[3:0];
    assign uio_out = 8'b0;

    wire _unused = &{ena};

    // Pipeline registers for stages
    reg [7:0] Prod_stage;   // Register to hold product in pipeline
    reg [7:0] Sum_stage;    // Register to hold sum in pipeline

    // Instantiate Dadda Multiplier
    DaddaMultiplier4x4 U1 (.A(A), .B(B), .Prod(Prod));

    // Pipeline stage 1: Store multiplication result
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Prod_stage <= 8'b0;
        else
            Prod_stage <= Prod; // Store the product in pipeline stage 1
    end

    // Instantiate Kogge-Stone Adder for accumulation
    KoggeStoneAdder8bit U2 (.A(Prod_stage), .B(Acc), .Sum(Sum));

    // Pipeline stage 2: Store sum result
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Sum_stage <= 8'b0;
        else
            Sum_stage <= Sum; // Store the sum in pipeline stage 2
    end

    // Accumulator register with optimized feedback
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Acc <= 8'b0;        // Reset accumulator to 0
        else
            Acc <= Sum_stage;   // Update accumulator with the sum
    end

    // Output the accumulated result
    assign uo_out = Acc;
endmodule  
   
module DaddaMultiplier4x4(
    input [3:0] A, B,
    output [7:0] Prod
);
    wire [15:0] partial_products;
    wire [7:0] sum1, carry1, sum2, carry2;
    assign partial_products[0] = A[0] & B[0];
    assign partial_products[1] = A[0] & B[1];
    assign partial_products[2] = A[0] & B[2];
    assign partial_products[3] = A[0] & B[3];
    assign partial_products[4] = A[1] & B[0];
    assign partial_products[5] = A[1] & B[1];
    assign partial_products[6] = A[1] & B[2];
    assign partial_products[7] = A[1] & B[3];
    assign partial_products[8] = A[2] & B[0];
    assign partial_products[9] = A[2] & B[1];
    assign partial_products[10] = A[2] & B[2];
    assign partial_products[11] = A[2] & B[3];
    assign partial_products[12] = A[3] & B[0];
    assign partial_products[13] = A[3] & B[1];
    assign partial_products[14] = A[3] & B[2];
    assign partial_products[15] = A[3] & B[3];
    assign sum1[0] = partial_products[0];
    half_adder ha1(partial_products[1], partial_products[4], sum1[1], carry1[0]);
    full_adder fa1(partial_products[2], partial_products[5], partial_products[8], sum1[2], carry1[1]);
    full_adder fa2(partial_products[3], partial_products[6], partial_products[9], sum1[3], carry1[2]);
    half_adder ha2(partial_products[7], partial_products[10], sum1[4], carry1[3]);
    half_adder ha3(partial_products[11], partial_products[14], sum1[5], carry1[4]);
    assign sum1[6] = partial_products[12];
    assign sum1[7] = partial_products[15];
    assign Prod[0] = sum1[0]; 
    half_adder ha4(sum1[1], carry1[0], Prod[1], carry2[0]);
    full_adder fa3(sum1[2], carry1[1], carry2[0], sum2[0], carry2[1]);
    full_adder fa4(sum1[3], carry1[2], carry2[1], sum2[1], carry2[2]);
    full_adder fa5(sum1[4], carry1[3], carry2[2], sum2[2], carry2[3]);
    full_adder fa6(sum1[5], carry1[4], carry2[3], sum2[3], carry2[4]);
    assign Prod[2] = sum2[0];
    assign Prod[3] = sum2[1];
    assign Prod[4] = sum2[2];
    assign Prod[5] = sum2[3];
    assign Prod[6] = sum1[6] ^ carry2[4];
    assign Prod[7] = sum1[7] & carry2[4]; 
endmodule
module half_adder(
    input A, B,
    output Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
module full_adder(
    input A, B, Cin,
    output Sum, Carry
);
    assign Sum = A ^ B ^ Cin;
    assign Carry = (A & B) | (A & Cin) | (B & Cin);
endmodule
module KoggeStoneAdder8bit(
    input [7:0] A, B,
    output [7:0] Sum
);
    wire [7:0] P; 
    wire [7:0] G; 
    wire [7:0] C; 
    assign P = A ^ B; 
    assign G = A & B; 
    assign C[0] = 1'b0; 
    genvar i;
    generate
        for (i = 0; i < 7; i = i + 1) begin : carry_gen
            assign C[i + 1] = G[i] | (P[i] & C[i]);
        end
    endgenerate
    assign Sum = P ^ C; 
endmodule
