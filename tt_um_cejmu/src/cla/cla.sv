(* keep *)
(* keep_hierarchy *)
module cla #(parameter WIDTH = 32)(
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,

    output logic [WIDTH:0]  z
);

    logic [WIDTH:0]   ci;
    logic [WIDTH-1:0] p;
    logic [WIDTH-1:0] g;
    genvar i,j;

    generate
        for (i=0; i < WIDTH; i++) begin : generate_adder_modules
            cla_full_adder fa_i (
                .a(a[i]),
                .b(b[i]),
                .ci(ci[i]),
                .s(z[i]),
                .p(p[i]),
                .g(g[i])
            );
        end
    endgenerate

    generate
        for (i=1; i < WIDTH; i++) begin : generate_carry_lookaheads
            wire [i-1:0] tmp;
            for (j=0; j < i; j++) begin
                assign tmp[j] = g[j] & &p[i:j+1];
            end

            assign ci[i+1] = g[i] | (ci[0] & &p[i:0]) | |tmp;
        end
    endgenerate

    assign ci[0] = 1'b0; // no carry in for first bit
    assign ci[1] = g[0] | (p[0] & ci[0]);

    assign z[WIDTH] = ci[WIDTH]; // overflow bit

`ifdef FORMAL
    always_comb begin
        addition: assert (z == a + b);
    end
`endif

endmodule // cla
