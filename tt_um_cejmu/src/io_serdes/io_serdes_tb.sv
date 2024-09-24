module io_serdes_tb ();

    // Must be multiple of 8
    parameter int WIDTH = 32;

    logic clk = 0;
    logic reset = 0;

    logic [7:0] inputs, outputs;
    logic [WIDTH-1:0] a, b, z;
    logic [WIDTH-1:0] a_rand, b_rand, z_rand;

    logic        start_calc = 0;
    logic        output_result = 0;

    io_serdes #(WIDTH) dut (
        .clk(clk),
        .reset(reset),
        .inputs(inputs),
        .outputs(outputs),
        .a(a),
        .b(b),
        .z(z_rand),
        .start_calc(start_calc),
        .output_result(output_result)
    );

    always begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        $dumpfile("io_serdes.vcd");
        $dumpvars(0, dut);

        for (int i=0; i < 1000; i++) begin
            $display("Test %d", i);

            a_rand = $urandom();
            b_rand = $urandom();

            reset = 0;
            output_result = 0;
            start_calc = 0;
            #3;
            reset = 1;

            // A
            for (int j=WIDTH-1; j >= 7; j -= 8) begin
                inputs = a_rand[j-:8];
                #2;
            end

            // B
            for (int j=WIDTH-1; j >= 7; j -= 8) begin
                inputs = b_rand[j-:8];
                #2;
            end

            #10; // Nothing should happen (state == IDLE)
            start_calc = 1'b1;
            #1;
            assert (a == a_rand) else $error("a not equal a_rand");
            assert (b == b_rand) else $error("b not equal b_rand");

            #20; // Nothing
            z_rand = $urandom();

            #6;
            output_result = 1'b1;
            #2;

            for (int j=WIDTH-1; j >= 7; j -= 8) begin
                z[j-:8] = outputs;
                #2;
            end

            assert (z == z_rand) else $error("z not equal z_rand");

            #20; // Should output and do nothing afterwards
        end

        $finish;
    end

endmodule // io_serdes_tb
