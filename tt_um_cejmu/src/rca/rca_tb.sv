module rca_tb ();

    logic [31:0] a;
    logic [31:0] b;
    logic [32:0] z;

    rca dut (
        .a(a),
        .b(b),
        .s(z)
    );

    initial begin
        $dumpfile("rca_tb.vcd");
        $dumpvars(0, dut);

        #1;
        for(int i=0; i < 20000; i++) begin
            a = $urandom();
            b = $urandom();
            #1;
            assert (z == a + b) else $error("Wrong with a = %d, b = %d. Was: %d, expected: %d", a, b, z, a+b);
            $display("%d", i);
        end

        $finish;
    end

endmodule // cla_tb