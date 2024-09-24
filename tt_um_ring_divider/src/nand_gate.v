`default_nettype none
module nand_gate (
    input A,
    input B,
    output Y
);

    assign Y = ~(A & B);

endmodule
