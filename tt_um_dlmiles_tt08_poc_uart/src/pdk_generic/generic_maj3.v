//
// MAJ3 process implementation cell/module mapping
//   3-input majority voter
//
// SPDX-FileCopyrightText: Copyright 2023 Darryl Miles
// SPDX-License-Identifier: Apache2.0
//
// This file exist to provide a default implementation of 'generic__maj3'
//   for PDKs that do not have a specific cell to use.
//
`default_nettype none
`ifdef TIMESCALE
`timescale 1ns/1ps
`endif

module generic__maj3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    wire   a_or_b_and_c;
    assign a_or_b_and_c = (A | B) & C;

    wire   a_and_b;
    assign a_and_b      = A & B;

    assign X = a_or_b_and_c | a_and_b;

endmodule
