`timescale 1ns / 1ps

module test_uart();
	// Local parameters
	localparam CLK_RATIO = 8;
	
	// DUT's port declaration
	// Internal ports
	reg					clk;
	reg					reset_n;
	
	reg					enable;
	reg					setting;
	reg					parity_en;
	reg					parity_odd;
	reg					tx_new;
	reg					rx_ack;
	wire				tx_busy;
	wire				rx_new;
	wire				rx_error;
	
	reg	[CLK_RATIO-1:0]	clk_cnt;	// clk_cnt of baudrate wrt IPCLK (>=2)
	reg	[7:0]   		tx_data;
	wire [7:0] 	 	 	rx_data;
	
	// External Ports
	wire				UART_RX;
	wire				UART_TX;
	
	// DUT declaration
	uart #(.CLK_RATIO(CLK_RATIO))
	uart0 (.clk(clk), .reset_n(reset_n), .enable(enable), .setting(setting),
		  .parity_en(parity_en), .parity_odd(parity_odd), .tx_new(tx_new),
		  .rx_ack(rx_ack), .tx_busy(tx_busy), .rx_new(rx_new), .rx_error(rx_error),
		  .clk_cnt(clk_cnt), .tx_data(tx_data), .rx_data(rx_data),
		  .UART_RX(UART_RX), .UART_TX(UART_TX));
	
	// VCD file creation
	initial begin
		$dumpfile ("uart.vcd");
		$dumpvars (0, clk, reset_n, enable, setting, parity_en, parity_odd, tx_new,
				   rx_ack, tx_busy, rx_new, rx_error, clk_cnt, tx_data, rx_data,
				   UART_RX, UART_TX);
		#1;
	end
	
	// Initial values
	initial begin
		reset_n		= 1'b0;
		enable		= 1'b0;
		setting		= 1'b0;
		parity_en	= 1'b0;
		parity_odd	= 1'b0;
		tx_new		= 1'b0;
		rx_ack		= 1'b0;
		clk_cnt		= {CLK_RATIO{1'b0}};
		tx_data		= 8'd0;
	end
	
	// Clock
	initial begin
		clk = 1'b0;
		forever #2 clk = ~clk;
	end
	
	// UART_RX
	assign UART_RX = UART_TX; // loopback
	
	// Test
	initial begin
		$display("Test begins...\n");
		
		$display("No parity test\n");
		#4;	reset_n		= 1'b1;
		#8;	parity_en	= 1'b0;
			parity_odd	= 1'b0;
			clk_cnt		= 8'd50;
		#4;	setting		= 1'b1;
		#8;	setting		= 1'b0;
		#4;	enable		= 1'b1;
			
		#4;	tx_data		= 8'b10110011;
			tx_new		= 1'b1;
		wait (tx_busy);
			tx_new		= 1'b0;
		wait (rx_new | rx_error);
		if (rx_error) begin
			$display("Test error at no parity\n");
			$finish;
		end
		if (rx_new) begin
			if (rx_data == tx_data)
				$display("Test passed at no parity\n");
			else begin
				$display("Test failed at no parity\n");
				$finish;
			end
		end
			rx_ack		= 1'b1;
		wait(~rx_new);
		
		$display("Even parity test\n");
			enable		= 1'b0;
		#8;	enable		= 1'b1;
		#8;	parity_en	= 1'b1;
			parity_odd	= 1'b0;
			clk_cnt		= 8'd100;
		#4;	setting		= 1'b1;
		#8;	setting		= 1'b0;
		#4;	enable		= 1'b1;
			
		#4;	tx_data		= 8'b11000101;
			tx_new		= 1'b1;
		wait (tx_busy);
			tx_new		= 1'b0;
		wait (rx_new | rx_error);
		if (rx_error) begin
			$display("Test error at even parity\n");
			$finish;
		end
		if (rx_new) begin
			if (rx_data == tx_data)
				$display("Test passed at even parity\n");
			else begin
				$display("Test failed at even parity\n");
				$finish;
			end
		end
		
		$display("Odd parity test\n");
			enable		= 1'b0;
		#8;	enable		= 1'b1;
		#8;	parity_en	= 1'b1;
			parity_odd	= 1'b1;
			clk_cnt		= 8'd100;
		#4;	setting		= 1'b1;
		#8;	setting		= 1'b0;
		#4;	enable		= 1'b1;
			
		#4;	tx_data		= 8'b01011001;
			tx_new		= 1'b1;
		wait (tx_busy);
			tx_new		= 1'b0;
		wait (rx_new | rx_error);
		if (rx_error) begin
			$display("Test error at odd parity\n");
			$finish;
		end
		if (rx_new) begin
			if (rx_data == tx_data)
				$display("Test passed at odd parity\n");
			else begin
				$display("Test failed at odd parity\n");
				$finish;
			end
		end
		
		$display("Test ended successfully!!");
		$finish;
	end
endmodule
