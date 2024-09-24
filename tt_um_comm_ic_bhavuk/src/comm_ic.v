////////////////////////////////////////////////////////////////////////////////
// Top module for the Comm_IC project. Submitted for the TinyTapeout8 (TT8).  //
// Designed by:      Bhavuk                                                   //
// Github ID:        Bhavuk-HDL                                               //
// Date of creation: 04-Sept-2024                                             //
// Code version:     V01                                                      //
/******************************************************************************/
// This project combines three different communication protocols, namely:     //
// 1. UART: Universal Aynchronous Receiver Transmitter                        //
// 2. SPI:  Serial Peripheral Interface                                       //
// 3. I2C:  Inter Integrated Circuit                                          //
/******************************************************************************/
// To communicate with this project, there is 'data_en' signal.               //
// data_en should be low by default. When it gets high e receive 4 bit data   //
// from data_in (MSB first) based on the clk rising edge.                     //
/******************************************************************************/
// First 4-bits of data bits will decide the comm. protocol and read/write.   //
// data_in = 4'bab_cd:                                                        //
// ab: 00-> Read                                                              //
// ab: 11-> Write                                                             //
// cd: 00-> UART                                                              //
// cd: 01-> SPI                                                               //
// cd: 10-> I2C                                                               //
// ab: 10-> Use previous settings: valid only in 'write mode'.                //
/******************************************************************************/
// Second 4-bits will have two directions: 'read mode' or 'write mode'.       //
// Read mode: data will be read from the comm protocol and interrupt will be  //
// set to '0'.                                                                //
// Write mode: if cd was set to '11' in the last cycle, we use previous       //
// settings for the comunication. Otherwise we use fresh settings.            //
// Next few 4-bit sequences will be used to send the data to resp. module.    //
////////////////////////////////////////////////////////////////////////////////

`default_nettype none

// Main module
module comm_ic (
	// Clk and Reset
	input	wire			clk,		// Clock input
	input	wire			reset_n,	// Reset input; low enabled
	
	// IOs
	// Comm. signals
	// UART
	input	wire			UART_RX,	// Data in pin
	output	wire			UART_TX,	// Data out pin
	
	// SPI
	output	wire			SEN,		// Serial Interface Enable; Active low
	output	wire			SCLK,		// Serial Interface Clock
	output	wire			MOSI,		// Serial Interface Data Out
	input	wire			MISO,		// Serial Interface Data In
	
	// I2C
	output	wire			SCL,		// Serial Clock
	output	wire			SDA_op,		// Serial Data Out;			inout[0]
	input	wire			SDA_in,		// Serial Data In;			inout[0]
	output	wire			SDA_op_en,	// SDA Mode Select
	
	// Interrupts out
	output	wire			new_uart,	// New data from UART Rx
	output	wire			busy_uart,	// Busy from UART Tx
	output	wire			busy_spi,	// Busy from SPI
	output	wire			busy_i2c,	// Busy from I2C
	output	wire			error_i2c,	// Error I2C
	
	// Data load in comm_ic
	input	wire	[3:0]	data_in,	// Data in for IC;			inout[4:1]
	output	reg		[3:0]	data_out,	// Data out from IC;		inout[4:1]
	output	reg		[3:0]	data_op_en,	// Data out mode select
	input	wire			data_en		// Enable the data transmission
	);
	
	// Local parameters
	localparam DATA_BITS = 16;
	localparam CLK_RATIO = 8;
	
	// Internal registers and wires
	reg		[1:0]			comm_sel;
	reg		[1:0]			send_cnt;
	
	wire	[7:0]			rx_data;
	reg						rx_ack;
	wire					rx_new;
	wire					rx_error;
	reg						parity_en;
	reg						parity_odd;
	reg						tx_new;
	reg		[7:0]			tx_data;
	reg		[7:0]			uart_clk_cnt;
	reg						uart_enable;
	reg						uart_setting;
	
	wire	[15:0]			spi_data_out;
	reg						spi_bits16;
	reg		[15:0]			spi_data_in;
	reg						spi_start;
	reg		[1:0]			spi_mode;
	reg		[7:0]			spi_clk_cnt;
	
	wire	[15:0]			i2c_data_out;
	reg						i2c_bits16;
	reg						i2c_start;
	reg		[15:0]			i2c_data_in;
	reg						i2c_write_n;
	reg		[6:0]			i2c_address;
	reg		[7:0]			i2c_clk_cnt;
	reg						i2c_addr_en;
	
	// Module declarations
	spi #(.DATA_BITS(DATA_BITS), .CLK_RATIO(CLK_RATIO))
	spi0 (.clk(clk), .reset_n(reset_n), .start(spi_start), .bits16(spi_bits16),
		 .mode(spi_mode), .data_in(spi_data_in), .clk_cnt(spi_clk_cnt),
		 .data_out(spi_data_out), .busy(busy_spi),
		 .SEN(SEN), .SCLK(SCLK), .MOSI(MOSI), .MISO(MISO));
	
	i2c  #(.DATA_BITS(DATA_BITS), .CLK_RATIO(CLK_RATIO))
	i2c0 (.clk(clk), .reset_n(reset_n), .start(i2c_start), .bits16(i2c_bits16),
		 .write_n(i2c_write_n), .address(i2c_address), .data_in(i2c_data_in),
		 .clk_cnt(i2c_clk_cnt), .data_out(i2c_data_out), .busy(busy_i2c), .error(error_i2c),
		 .SCL(SCL), .SDA_op(SDA_op), .SDA_in(SDA_in), .op_en(SDA_op_en));
	
	uart #(.CLK_RATIO(CLK_RATIO))
	uart0 (.clk(clk), .reset_n(reset_n), .enable(uart_enable), .setting(uart_setting),
		  .parity_en(parity_en), .parity_odd(parity_odd), .tx_new(tx_new),
		  .rx_ack(rx_ack), .tx_busy(busy_uart), .rx_new(rx_new), .rx_error(rx_error),
		  .clk_cnt(uart_clk_cnt), .tx_data(tx_data), .rx_data(rx_data),
		  .UART_RX(UART_RX), .UART_TX(UART_TX));
	
	//	State machine
	reg	[1:0]	curr_st;
	localparam	[1:0]
		idle		= 2'b00,
		read_mode	= 2'b01,
		write_mode0	= 2'b10,
		write_mode1	= 2'b11;
	
	// Combinational logic
	assign new_uart = rx_new & (~rx_error);
	
	// Sequential logic
	always @(posedge clk) begin
		if (~reset_n) begin
			comm_sel			<= 2'b00;
			data_op_en			<= 4'b0000;		// Input enabled
			send_cnt			<= 2'd0;
			
			rx_ack				<= 1'b0;
			parity_en			<= 1'b0;
			parity_odd			<= 1'b0;
			tx_new				<= 1'b0;
			tx_data				<= 8'd0;
			uart_clk_cnt		<= 8'd0;
			uart_enable			<= 1'b0;
			uart_setting		<= 1'b0;
			
			spi_bits16			<= 1'b0;
			spi_data_in			<= 16'd0;
			spi_start			<= 1'b1;
			spi_mode			<= 2'd0;
			spi_clk_cnt			<= 8'd0;
			
			i2c_start			<= 1'b0;
			i2c_data_in			<= 16'd0;
			i2c_write_n			<= 1'b0;
			i2c_address			<= 7'd0;
			i2c_clk_cnt			<= 8'd0;
			i2c_bits16			<= 1'b0;
			i2c_addr_en			<= 1'b0;
			
			curr_st				<= idle;
		end
		else begin
			case(curr_st)
				// Idle
				idle: begin
					comm_sel			<= 2'b00;
					data_op_en			<= 4'b0000;		// Input enabled
					send_cnt			<= 2'd1;
					send_cnt			<= 2'd0;
					if (busy_uart) begin
						tx_new			<= 1'b0;
						uart_setting	<= 1'b0;
					end
					if (busy_spi) begin
						spi_start		<= 1'b0;
					end
					if (busy_i2c) begin
						i2c_start		<= 1'b0;
					end
					
					if (data_en) begin
						comm_sel		<= data_in[1:0];
						
						if (data_in[3:2] == 2'b00) begin	// Data out state
							data_op_en	<= 4'b1111;		// Output enabled
							send_cnt	<= 2'd1;
							if (data_in[1:0] == 2'b01) begin	// SPI
								if (spi_bits16)
									send_cnt	<= 2'd3;
							end
							if (data_in[1:0] == 2'b10) begin	// I2C
								if (i2c_bits16)
									send_cnt	<= 2'd3;
							end
							
							curr_st		<= read_mode;
						end
						if (data_in[3:2] == 2'b11) begin	// Data in state; new settings
							data_op_en	<= 4'b0000;		// Input enabled
							send_cnt	<= 2'd2;
							curr_st		<= write_mode1;
						end
						if (data_in[3:2] == 2'b10) begin	// Data in state; old settings
							data_op_en	<= 4'b0000;		// Input enabled
							send_cnt	<= 2'd1;
							if (data_in[1:0] == 2'b01) begin	// SPI
								if (spi_bits16)
									send_cnt	<= 2'd3;
							end
							if (data_in[1:0] == 2'b10) begin	// I2C
								i2c_addr_en		<= 1'b1;
								//if (i2c_bits16)
								//	send_cnt	<= 2'd3;
							end
							curr_st		<= write_mode0;
						end
					end
				end
				
				// Read mode
				read_mode: begin
					if (comm_sel == 2'b00) begin	// UART
						case(send_cnt)
							2'd1: begin
								data_out	<= rx_data[7:4];
								send_cnt	<= 2'd0;
							end
							2'd0: begin
								data_out	<= rx_data[3:0];
								rx_ack		<= 1'b1;
								
								curr_st		<= idle;
							end
							default: curr_st		<= idle;
						endcase
					end
					if (comm_sel == 2'b01) begin	// SPI
						case(send_cnt)
							2'd3: begin
								data_out	<= spi_data_out[15:12];
								send_cnt	<= 2'd2;
							end
							2'd2: begin
								data_out	<= spi_data_out[11:8];
								send_cnt	<= 2'd1;
							end
							2'd1: begin
								data_out	<= spi_data_out[7:4];
								send_cnt	<= 2'd0;
							end
							2'd0: begin
								data_out	<= spi_data_out[3:0];
								curr_st		<= idle;
							end
						endcase
					end
					if (comm_sel == 2'b10) begin	// I2C
						case(send_cnt)
							2'd3: begin
								data_out	<= i2c_data_out[15:12];
								send_cnt	<= 2'd2;
							end
							2'd2: begin
								data_out	<= i2c_data_out[11:8];
								send_cnt	<= 2'd1;
							end
							2'd1: begin
								data_out	<= i2c_data_out[7:4];
								send_cnt	<= 2'd0;
							end
							2'd0: begin
								data_out	<= i2c_data_out[3:0];
								curr_st		<= idle;
							end
						endcase
					end
				end
				
				// Write mode: previous settings
				write_mode0: begin		// Use previous settings
					if (comm_sel == 2'b00) begin	// UART
						uart_enable					<= 1'b1;
						case(send_cnt)
							2'd1: begin
								tx_data[7:4]		<= data_in;
								send_cnt			<= 2'd0;
							end
							2'd0: begin
								tx_data[3:0]		<= data_in;
								tx_new				<= 1'b1;
								curr_st				<= idle;
							end
							default: curr_st		<= idle;
						endcase
					end
					if (comm_sel == 2'b01) begin	// SPI
						case(send_cnt)
							2'd3: begin
								spi_data_in[15:12]	<= data_in;
								send_cnt			<= 2'd2;
							end
							2'd2: begin
								spi_data_in[11:8]	<= data_in;
								send_cnt			<= 2'd1;
							end
							2'd1: begin
								spi_data_in[7:4]	<= data_in;
								send_cnt			<= 2'd0;
							end
							2'd0: begin
								spi_data_in[3:0]	<= data_in;
								spi_start			<= 1'b1;
								curr_st				<= idle;
							end
						endcase
					end
					if (comm_sel == 2'b10) begin	// I2C
						if (i2c_addr_en) begin
							case(send_cnt)
								2'd1: begin
									i2c_address[6:3]	<= data_in;
									send_cnt			<= 2'd0;
								end
								2'd0: begin
									i2c_address[2:0]	<= data_in[3:1];
									i2c_addr_en			<= 1'b0;
									if (i2c_bits16)
										send_cnt	<= 2'd3;
									else
										send_cnt	<= 2'd1;
									send_cnt			<= 2'd0;
								end
								default: curr_st		<= idle;
							endcase
						end
						else begin
							case(send_cnt)
								2'd3: begin
									i2c_data_in[15:12]	<= data_in;
									send_cnt			<= 2'd2;
								end
								2'd2: begin
									i2c_data_in[11:8]	<= data_in;
									send_cnt			<= 2'd1;
								end
								2'd1: begin
									i2c_data_in[7:4]	<= data_in;
									send_cnt			<= 2'd0;
								end
								2'd0: begin
									i2c_data_in[3:0]	<= data_in;
									i2c_start			<= 1'b1;
									curr_st				<= idle;
								end
							endcase
						end
					end
				end
				
				// Write mode: new settings
				write_mode1: begin		// Use new settings
					if (comm_sel == 2'b00) begin	// UART
						case(send_cnt)
							2'd2: begin
								uart_clk_cnt[7:4]	<= data_in;
								send_cnt			<= 2'd1;
							end
							2'd1: begin
								uart_clk_cnt[3:0]	<= data_in;
								send_cnt			<= 2'd0;
							end
							2'd0: begin
								uart_enable			<= data_in[3];
								uart_setting		<= data_in[2];
								parity_en			<= data_in[1];
								parity_odd			<= data_in[0];
								
								if (data_in[3] & data_in[2]) begin
									curr_st		<= write_mode0;
									send_cnt	<= 2'd1;
								end
								else
									curr_st		<= idle;
							end
							default: curr_st	<= idle;
						endcase
					end
					if (comm_sel == 2'b01) begin	// SPI
						case(send_cnt)
							2'd2: begin
								spi_clk_cnt[7:4]	<= data_in;
								send_cnt			<= 2'd1;
							end
							2'd1: begin
								spi_clk_cnt[3:0]	<= data_in;
								send_cnt			<= 2'd0;
							end
							2'd0: begin
								spi_mode			<= data_in[3:2];
								spi_bits16			<= data_in[1];
								//spi_start			<= data_in[0];	// start bit
								
								if (data_in[0]) begin
									curr_st		<= write_mode0;
									if (data_in[1])
										send_cnt	<= 2'd3;
									else
										send_cnt	<= 2'd1;
								end
								else
									curr_st		<= idle;
							end
							default: curr_st	<= idle;
						endcase
					end
					if (comm_sel == 2'b10) begin	// I2C
						case(send_cnt)
							2'd2: begin
								i2c_clk_cnt[7:4]	<= data_in;
								send_cnt			<= 2'd1;
							end
							2'd1: begin
								i2c_clk_cnt[3:0]	<= data_in;
								send_cnt			<= 2'd0;
							end
							2'd0: begin
								i2c_write_n			<= data_in[3];
								i2c_bits16			<= data_in[2];
								//i2c_start			<= data_in[1];	// start bit
								
								if (data_in[1]) begin
									curr_st		<= write_mode0;
									i2c_addr_en	<= 1'b1;
									send_cnt	<= 2'd1;
								end
								else
									curr_st		<= idle;
							end
							default: curr_st	<= idle;
						endcase
					end
				end
			endcase
		end
	end
	
endmodule
