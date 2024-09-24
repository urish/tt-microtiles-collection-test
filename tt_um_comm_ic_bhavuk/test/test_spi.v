`timescale 1ns / 1ps

module test_spi();
	// Local parameters
	localparam DATA_BITS = 16;
	localparam CLK_RATIO = 8;
	
	// DUT's port declaration
	// Internal ports
	reg			clk;
	reg			reset_n;
	reg			start;
	reg			bits16;
	reg [1:0]		mode;
	reg [DATA_BITS-1:0]	data_in;
	reg [CLK_RATIO-1:0]	clk_cnt;	// clk_cnt of SCLK wrt IPCLK (>=2)
	wire [DATA_BITS-1:0]	data_out;
	wire			busy;
	
	// External ports
	wire			SEN;		// Serial Interface Enable; Active low
	wire			SCLK;		// Serial Interface Clock
	wire			MOSI;		// Serial Interface Data Out
	wire			MISO;		// Serial Interface Data In
	
	// DUT declaration
	spi #(.DATA_BITS(DATA_BITS), .CLK_RATIO(CLK_RATIO))
	spi0 (.clk(clk), .reset_n(reset_n), .start(start), .bits16(bits16),
		 .mode(mode), .data_in(data_in), .clk_cnt(clk_cnt),
		 .data_out(data_out), .busy(busy),
		 .SEN(SEN), .SCLK(SCLK), .MOSI(MOSI), .MISO(MISO));
	
	// VCD file creation
	initial begin
		$dumpfile ("spi.vcd");
		$dumpvars (0, clk, reset_n, start, bits16, mode, data_in, clk_cnt,
				   data_out, busy, SEN, SCLK, MOSI, MISO);
		#1;
	end
	
	// Initial values
	initial begin
		reset_n	= 1'b0;
		start	= 1'b0;
		bits16	= 1'b0;
		mode	= 2'd0;
		data_in	= {DATA_BITS{1'b0}};
		clk_cnt	= {CLK_RATIO{1'b0}};
		#1;
	end
	
	// Clock
	initial begin
		clk = 1'b0;
		forever #2 clk = ~clk;
	end
	
	// MISO
	assign MISO = MOSI; // loopback
	
	
	// Test
	initial begin
		$display("Test begins...\n");
		#4;	reset_n	= 1'b1;
		#4;	bits16	= 1'b0;
			data_in	= {8'd0, 8'b01001001};
			clk_cnt	= 8'd50;
	 	
			mode		= 2'b00;
		#2;	start		= 1'b1;
		#4;	start		= 1'b0;
		wait (~busy);
		if (data_out[7:0] != data_in) begin
			$display("Test failed at 8-bit Mode 0!!\n");
			$finish;
		end
		else
			$display("Test passed at 8-bit Mode 0!!\n");
		
			mode		= 2'b01;
		#2;	start		= 1'b1;
		#4;	start		= 1'b0;
		wait (~busy);
		if (data_out[7:0] != data_in) begin
			$display("Test failed at 8-bit Mode 1!!\n");
			$finish;
		end
		else
			$display("Test passed at 8-bit Mode 1!!\n");
		
			mode		= 2'b10;
		#2;	start		= 1'b1;
		#4;	start		= 1'b0;
		wait (~busy);
		if (data_out[7:0] != data_in) begin
			$display("Test failed at 8-bit Mode 2!!\n");
			$finish;
		end
		else
			$display("Test passed at 8-bit Mode 2!!\n");
			
			mode		= 2'b11;
		#2;	start		= 1'b1;
		#4;	start		= 1'b0;
		wait (~busy);
		if (data_out[7:0] != data_in) begin
			$display("Test failed at 8-bit Mode 3!!\n");
			$finish;
		end
		else
			$display("Test passed at 8-bit Mode 3!!\n");
		
		#4;	bits16	= 1'b1;
			data_in	= {16'b1000001110100101};
			clk_cnt	= 8'd255;
	 	
			 mode		= 2'b00;
		#20; start		= 1'b1;
		#40; start		= 1'b0;
		wait (~busy);
		if (data_out != data_in) begin
			$display("Test failed at 16-bit Mode 0!!\n");
			$finish;
		end
		else
			$display("Test passed at 16-bit Mode 0!!\n");
		
			 mode		= 2'b01;
		#20; start		= 1'b1;
		#40; start		= 1'b0;
		wait (~busy);
		if (data_out != data_in) begin
			$display("Test failed at 16-bit Mode 1!!\n");
			$finish;
		end
		else
			$display("Test passed at 16-bit Mode 1!!\n");
		
			 mode		= 2'b10;
		#20; start		= 1'b1;
		#40; start		= 1'b0;
		wait (~busy);
		if (data_out != data_in) begin
			$display("Test failed at 16-bit Mode 2!!\n");
			$finish;
		end
		else
			$display("Test passed at 16-bit Mode 2!!\n");
		
			 mode		= 2'b11;
		#20; start		= 1'b1;
		#40; start		= 1'b0;
		wait (~busy);
		if (data_out != data_in) begin
			$display("Test failed at 16-bit Mode 3!!\n");
			$finish;
		end
		else
			$display("Test passed at 16-bit Mode 3!!\n");
		
		$display("Test ended successfully!!");
		$finish;
	end

endmodule

