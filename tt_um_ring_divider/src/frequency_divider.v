`default_nettype none
module frequency_divider (
    input wire clk_in,
    output wire clk_out2,
    output wire clk_out4,
    output wire clk_out8,
    output wire clk_out16,
    output wire clk_out32,
    output wire clk_out64,
    output wire clk_out128
);

    wire d1, q1, q1_bar;
    wire d2, q2, q2_bar;
    wire d3, q3, q3_bar;
    wire d4, q4, q4_bar;
    wire d5, q5, q5_bar;
    wire d6, q6, q6_bar;
    wire d7, q7, q7_bar;

    // First D Flip-Flop for clk_out2 (frequency / 2)
    dff dff1 (
        .clk(clk_in),
        .d(d1),
        .q(q1),
        .q_bar(q1_bar)
    );

    // Feedback connection for first D flip-flop
    assign d1 = q1_bar;
    assign clk_out2 = q1;

    // Second D Flip-Flop for clk_out4 (frequency / 4)
    dff dff2 (
        .clk(clk_out2),  // clk_out2 is used as clock input for the second DFF
        .d(d2),
        .q(q2),
        .q_bar(q2_bar)
    );

    // Feedback connection for second D flip-flop
    assign d2 = q2_bar;
    assign clk_out4 = q2;
    
    // Third D Flip-Flop for clk_out8 (frequency / 8)
    dff dff3 (
        .clk(clk_out4),  // clk_out4 is used as clock input for the third DFF
        .d(d3),
        .q(q3),
        .q_bar(q3_bar)
    );

    // Feedback connection for third D flip-flop
    assign d3 = q3_bar;
    assign clk_out8 = q3;
    
     // Fourth D Flip-Flop for clk_out16 (frequency / 16)
    dff dff4 (
        .clk(clk_out8),  // clk_out8 is used as clock input for the fourth DFF
        .d(d4),
        .q(q4),
        .q_bar(q4_bar)
    );

    // Feedback connection for fourth D flip-flop
    assign d4 = q4_bar;
    assign clk_out16 = q4;
    
    // Fifth D Flip-Flop for clk_out32 (frequency / 32)
    dff dff5 (
        .clk(clk_out16),  // clk_out16 is used as clock input for the fifth DFF
        .d(d5),
        .q(q5),
        .q_bar(q5_bar)
    );

    // Feedback connection for fifth D flip-flop
    assign d5 = q5_bar;
    assign clk_out32 = q5;
    
    // Sixth D Flip-Flop for clk_out64 (frequency / 64)
    dff dff6 (
        .clk(clk_out32),  // clk_out32 is used as clock input for the sixth DFF
        .d(d6),
        .q(q6),
        .q_bar(q6_bar)
    );

    // Feedback connection for sixth D flip-flop
    assign d6 = q6_bar;
    assign clk_out64 = q6;
    
    // Seventh D Flip-Flop for clk_out128 (frequency / 128)
    dff dff7 (
        .clk(clk_out64),  // clk_out64 is used as clock input for the seventh DFF
        .d(d7),
        .q(q7),
        .q_bar(q7_bar)
    );

    // Feedback connection for seventh D flip-flop
    assign d7 = q7_bar;
    assign clk_out128 = q7;

endmodule

