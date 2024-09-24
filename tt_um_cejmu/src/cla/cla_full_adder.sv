module cla_full_adder (
    input logic a,
    input logic b,
    input logic ci,

    output logic s,
    output logic p,
    output logic g
);

    assign g = a & b;
    assign p = a ^ b;
    assign s = a ^ b ^ ci;

endmodule // cla_full_adder
