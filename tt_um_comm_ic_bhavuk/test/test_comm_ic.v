`timescale 1ns / 1ps

module test_comm_ic();
	// DUT's port declaration
	// Clk and Reset
	reg						clk;		// Clock input
	reg						reset_n;	// Reset input; low enabled
	
	// IOs
	// Comm. signals
	// UART
	wire					UART_RX;	// Data in pin
	wire					UART_TX;	// Data out pin
	
	// SPI
	wire					SEN;		// Serial Interface Enable; Active low
	wire					SCLK;		// Serial Interface Clock
	wire					MOSI;		// Serial Interface Data Out
	wire					MISO;		// Serial Interface Data In
	
	// I2C
	wire					SCL;		// Serial Clock
	wire					SDA_op;		// Serial Data Out;			inout[0]
	reg						SDA_in;		// Serial Data In;			inout[0]
	wire					SDA_op_en;	// SDA Mode Select
	
	// Interrupts out
	wire					new_uart;	// New data from UART Rx
	wire					busy_uart;	// Busy from UART Tx
	wire					busy_spi;	// Busy from SPI
	wire					busy_i2c;	// Busy from I2C
	
	// Data load in comm_ic
	reg				[3:0]	data_in;	// Data in for IC;			inout[4:1]
	wire			[3:0]	data_out;	// Data out from IC;		inout[4:1]
	wire			[3:0]	data_op_en;	// Data out mode select
	reg						data_en;	// Enable the data transmission
	
	
	// DUT declaration
	comm_ic comm_ic0 (.clk(clk), .reset_n(reset_n),
					  .UART_TX(UART_TX), .UART_RX(UART_RX),
					  .SEN(SEN), .SCLK(SCLK), .MOSI(MOSI), .MISO(MISO),
					  .SCL(SCL), .SDA_op(SDA_op), .SDA_in(SDA_in), .SDA_op_en(SDA_op_en),
					  .new_uart(new_uart), .busy_uart(busy_uart), .busy_spi(busy_spi), .busy_i2c(busy_i2c),
					  .data_in(data_in), .data_out(data_out), .data_op_en(data_op_en), .data_en(data_en));
	
	// VCD file creation
	initial begin
		$dumpfile ("comm_ic.vcd");
		$dumpvars (0, clk, reset_n,
				   UART_TX, UART_RX,
				   SEN, SCLK, MOSI, MISO,
				   SCL, SDA_op, SDA_in, SDA_op_en,
				   new_uart, busy_uart, busy_spi, busy_i2c,
				   data_in, data_out, data_op_en, data_en);
		#1;
	end
	
	// Internal registers and wires
	reg			start;
	reg			check;
	reg			uart_wr;
	reg			spi_wr;
	reg			i2c_wr;
	reg	[7:0]	uart_data;
	reg	[3:0]	read_st;
	
	//	State machine
	reg	[3:0]	curr_st;
	localparam	[3:0]
		idle		= 4'b0000,
		state1		= 4'b0001,
		state2		= 4'b0010,
		state3		= 4'b0011,
		state4		= 4'b0100,
		state5		= 4'b0101,
		state6		= 4'b0110,
		state7		= 4'b0111,
		state8		= 4'b1000,
		state9		= 4'b1001,
		state10		= 4'b1010,
		state11		= 4'b1011,
		state12		= 4'b1100,
		state13		= 4'b1101,
		state14		= 4'b1110,
		state15		= 4'b1111;
	
	// Initial vaules
	initial begin
		reset_n			= 1'b0;
		SDA_in			= 1'b0;
		data_in			= 4'd0;
		data_en			= 1'b0;
		start			= 1'b0;
		check			= 1'b0;
		uart_wr			= 1'b0;
		spi_wr			= 1'b0;
		i2c_wr			= 1'b0;
		uart_data		= 8'd0;
		read_st			= 3'd0;
		#10;
		reset_n			= 1'b1;
		start			= 1'b1;
		#4;
		start			= 1'b0;
	end
	
	// Clock
	initial begin
		clk = 1'b0;
		forever #2 clk = ~clk;
	end
	
	// Loopback
	assign UART_RX	= UART_TX;
	assign MISO		= MOSI;
	
	// Test begins
	always @(posedge clk) begin
		if (~reset_n)
			curr_st	<= idle;
		else begin
			case(curr_st)
				idle: begin
					uart_wr		<= 1'b0;
					if (start) begin
						$display("Test begins...");
						curr_st	<= state1;
					end
				end
				
				state1: begin
					data_en		<= 1'b1;
					data_in		<= 4'b1100;	// Write UART
					uart_wr		<= 1'b1;
					curr_st		<= state2;
				end
				
				state2: begin
					if (uart_wr) begin
						data_in		<= 4'd5;
						curr_st		<= state3;
					end
					if (spi_wr) begin
						data_in		<= 4'd4;
						curr_st		<= state3;
					end
					if (i2c_wr) begin
						data_in		<= 4'd3;
						curr_st		<= state3;
					end
				end
				
				state3: begin
					if (uart_wr) begin
						data_in		<= 4'd0;
						curr_st		<= state4;
					end
					if (spi_wr) begin
						data_in		<= 4'd0;
						curr_st		<= state4;
					end
					if (i2c_wr) begin
						data_in		<= 4'd0;
						curr_st		<= state4;
					end
				end
				
				state4: begin
					if (uart_wr) begin
						data_in		<= 4'b0111;
						uart_wr		<= 1'b0;
						curr_st		<= state5;
					end
					if (spi_wr) begin
						data_in		<= 4'b0010;
						spi_wr		<= 1'b0;
						curr_st		<= state6;
					end
					if (i2c_wr) begin
						data_in		<= 4'b0000;
						i2c_wr		<= 1'b0;
						curr_st		<= state7;
					end
				end
				
				state5: begin
					data_in		<= 4'b1101;	// Write SPI
					spi_wr		<= 1'b1;
					curr_st		<= state2;
				end
				
				state6: begin
					data_in		<= 4'b1110;	// Write I2C
					i2c_wr		<= 1'b1;
					curr_st		<= state2;
				end
				
				state7: begin
					data_in		<= 4'b1000;	// Write UART
					uart_wr		<= 1'b1;
					curr_st		<= state8;
				end
				
				state8: begin
					if (uart_wr) begin
						data_in		<= 4'b1100;
						curr_st		<= state9;
					end
					if (spi_wr) begin
						data_in		<= 4'b1100;
						curr_st		<= state9;
					end
					if (i2c_wr) begin
						data_in		<= 4'b1101;
						curr_st		<= state9;
					end
				end
				
				state9: begin
					if (uart_wr) begin
						data_in		<= 4'b0111;
						uart_wr		<= 1'b0;
						curr_st		<= state10;
					end
					if (spi_wr) begin
						data_in		<= 4'b1111;
						curr_st		<= state11;
					end
					if (i2c_wr) begin
						data_in		<= 4'b1001;
						curr_st		<= state11;
					end
				end
				
				state10: begin
					data_in		<= 4'b1001;	// Write SPI
					spi_wr		<= 1'b1;
					curr_st		<= state8;
				end
				
				state11: begin
					if (spi_wr) begin
						data_in		<= 4'b0000;
						curr_st		<= state12;
					end
					if (i2c_wr) begin
						data_in		<= 4'b1110;
						curr_st		<= state12;
					end
				end
				
				state12: begin
					if (spi_wr) begin
						data_in		<= 4'b1010;
						spi_wr		<= 1'b0;
						curr_st		<= state13;
					end
					if (i2c_wr) begin
						data_in		<= 4'b1011;
						i2c_wr		<= 1'b0;
						data_en		<= 1'b0;
						curr_st		<= state14;
					end
				end
				
				state13: begin
					data_in		<= 4'b1010;	// Write I2C
					i2c_wr		<= 1'b1;
					curr_st		<= state8;
				end
				
				state14: begin
					if ((~busy_uart & ~busy_i2c & ~busy_spi) & new_uart) begin
						data_en		<= 1'b1;
						data_in		<= 4'b0000;		// Read UART
						read_st		<= 3'b111;
						curr_st		<= state15;
					end
				end
				
				state15: begin
					case(read_st)
						3'b111: begin
							read_st			<= 3'b110;
						end
						3'b110: begin
							read_st			<= 3'b101;
						end
						3'b101: begin
							uart_data[7:4]	<= data_out;
							read_st			<= 3'b100;
						end
						3'b100: begin
							uart_data[3:0]	<= data_out;
							read_st			<= 3'b011;
						end
						3'b011: begin
							data_en			<= 1'b0;
							read_st			<= 3'b010;
						end
						3'b010: begin
							$display("UART_in =%b, UART_out =%b\n", 8'b11000111, uart_data);
							$display("Test completed....May refer to waveform for results");
							$finish;
						end
					endcase
				end
			endcase
		end
	end
	
endmodule
