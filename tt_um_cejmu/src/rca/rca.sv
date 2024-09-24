module rca #(parameter WIDTH = 6)(
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,
    output logic [WIDTH:0]  s
);

    logic [WIDTH:0] cc_carry;
    genvar i;

    assign cc_carry[0] = 1'b0;

    generate
        for (i=0; i < WIDTH; i++) begin : generate_adder_modules
            rca_fulladder fa (
                .a(a[i]),
                .b(b[i]),
                .c_in(cc_carry[i]),
                .c_out(cc_carry[i+1]),
                .s(s[i])
            );
        end
    endgenerate

    assign s[WIDTH] = cc_carry[WIDTH];

`ifdef FORMAL
    always_comb begin
        addition: assert (s == a + b);
    end
`endif

endmodule
