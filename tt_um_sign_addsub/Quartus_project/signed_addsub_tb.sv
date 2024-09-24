module signed_addsub_tb;

    // Testbench signals
    logic [7:0] ui_in;
	logic [1:0] uio_in;
    logic [3:0] uo_out;

    // Instantiate the DUT (Device Under Test)
    tt_um_sign_addsub uut (
        .ui_in(ui_in),
		.uio_in(uio_in),
        .uo_out(uo_out)
    );

    // Apply test cases
    initial begin
        // Display header for the results
        $display("ui_in    uio_in   uo_out");
        $display("------------------");

        // Test case 1
        ui_in = 8'b01000100; uio_in = 2'b00; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);

        // Test case 2
        ui_in = 8'b00000001; uio_in = 2'b01; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);

        // Test case 3
        ui_in = 8'b11110111; uio_in = 2'b01; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);

        // Test case 4
        ui_in = 8'b01110111; uio_in = 2'b10; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);

        // Test case 5
        ui_in = 8'b10000101; uio_in = 2'b11; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);
		
		ui_in = 8'b00100001; uio_in = 2'b01; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);
		
		ui_in = 8'b00010010; uio_in = 2'b01; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);
		
		ui_in = 8'b00110001; uio_in = 2'b10; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);
		
		ui_in = 8'b00010011; uio_in = 2'b10; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);
		
		ui_in = 8'b01000010; uio_in = 2'b11; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);
		
		ui_in = 8'b01000010; uio_in = 2'b11; #10;
        $display("%b %b %b", ui_in, uio_in, uo_out);

    end

    // Monitor changes (optional)
    always @(ui_in or uio_in or uo_out) begin
        $monitor("ui_in = %b, uio_in = %b, uo_out = %b", ui_in, uio_in, uo_out);
    end

endmodule
