`timescale 1ns / 1ps

module test_i2c();
	// Local parameters
	localparam DATA_BITS = 16;
	localparam CLK_RATIO = 8;
	
	// DUT's port declaration
	// Internal ports
	reg						clk;
	reg						reset_n;
	reg						start;
	reg						bits16;
	reg 					write_n;
	reg		[6:0]			address;
	reg 	[DATA_BITS-1:0]	data_in;
	reg		[CLK_RATIO-1:0]	clk_cnt;	// clk_cnt of SCLK wrt IPCLK (>=2)
	wire	[DATA_BITS-1:0]	data_out;
	wire					busy;
	wire					error;
	
	// External ports
	wire			SCL;		// Serial Interface Clock
	wire			SDA_op;		// Serial Interface Data Out
	reg				SDA_in;		// Serial Interface Data In
	wire			op_en;		// SDA Mode Select

	// DUT declaration
	i2c  #(.DATA_BITS(DATA_BITS), .CLK_RATIO(CLK_RATIO))
	i2c0 (.clk(clk), .reset_n(reset_n), .start(start), .bits16(bits16),
		 .write_n(write_n), .address(address), .data_in(data_in),
		 .clk_cnt(clk_cnt), .data_out(data_out), .busy(busy), .error(error),
		 .SCL(SCL), .SDA_op(SDA_op), .SDA_in(SDA_in), .op_en(op_en));
	
	
	// VCD file creation
	initial begin
		$dumpfile ("i2c.vcd");
		$dumpvars (0, clk, reset_n, start, bits16, write_n, address, data_in,
				   clk_cnt, data_out, busy, error, SCL, SDA_op, SDA_in, op_en);
		#1;
	end
	
	// Internal registers and wires
	reg		[DATA_BITS-1:0]				data_reg;
	reg		[7:0]						address_reg;
	reg		[2:0]						addr_bit;
	reg		[$clog2(DATA_BITS-1): 0]	data_bit;
	reg									SCL_reg;
	
	reg		[1:0]						data_st;
	
	// Initial values
	initial begin
		reset_n		= 1'b0;
		start		= 1'b0;
		bits16		= 1'b0;
		write_n		= 1'b0;
		address		= 7'd0;
		data_in		= {DATA_BITS{1'b0}};
		clk_cnt		= {CLK_RATIO{1'b0}};
		
		data_reg	= {DATA_BITS{1'b0}};
		address_reg	= 8'd0;
		addr_bit	= 3'd7;
		data_bit	= {$clog2(DATA_BITS){1'b0}};
		SCL_reg		= 1'b0;
		data_st		= 2'd0;
		#1;
	end
	
	// Clock
	initial begin
		clk = 1'b0;
		forever #2 clk = ~clk;
	end
	
	// SDA_in
	initial
		SDA_in	= 1'bz;
	always @(posedge clk) begin
		SCL_reg	<= SCL;
		case(data_st)
			2'b00: begin	// Address state
				if (busy) begin
					if (~SCL_reg & SCL) begin		// Rising edge detect
						address_reg[addr_bit]	<= SDA_op;
						addr_bit				<= addr_bit-1;
						
						if (addr_bit == 0)
							data_st		<= 2'b01;
					end
				end
			end
			2'b01: begin	// Ack state
				if (busy) begin
					if (SCL_reg & ~SCL) begin		// Falling edge
						if (address_reg == ({address, write_n}))
							SDA_in		<= 1'b0;
						else
							SDA_in		<= 1'b1;
					end
					if (~SCL_reg & SCL)	begin		// Rising edge detect
						data_bit	<= bits16 ? (DATA_BITS-1) : ((DATA_BITS >> 1)-1);
						data_st		<= 2'b10;
						
						if (error) begin
							$display("Address write unsuccessful!!\n");
							$finish;
						end
						else begin
							$display("Address write successful!!\n");
							SDA_in		<= 1'bz;
						end
					end
				end
			end
			2'b10: begin	// Data state
				if (busy) begin
					if (~write_n) begin		// Write mode
						if (~SCL_reg & SCL) begin		// Rising edge detect
							data_reg[data_bit]	<= SDA_op;
							data_bit			<= data_bit-1;
							
							if (data_bit == 0)
								data_st		<= 2'b11;
						end
					end
					else begin				// Read mode
						if (SCL_reg & ~SCL) begin		// Falling edge
							SDA_in		<= data_in[data_bit];
							data_bit	<= data_bit-1;
							
							if (data_bit == 0)
								data_st		<= 2'b11;
						end
					end
				end
			end
			2'b11: begin	// Validate state
				if (~busy) begin
					if (~write_n) begin
						if (data_reg == data_in) begin
							$display("Data write successful!!\n");
							data_st		<= 2'b00;
						end
						else begin
							$display("Data write unsuccessful!!\n");
							$finish;
						end
					end
					else begin
						if (data_out == data_in) begin
							$display("Data read successful!!\n");
							data_st		<= 2'b00;
						end
						else begin
							$display("Data read unsuccessful!!\n");
							$finish;
						end
					end
				end
			end
		endcase
	end
	
	// Test
	initial begin
		$display("Test begins...\n");
		
		$display("8-bit write\n");
		#4;		reset_n		= 1'b1;
		#4;		bits16		= 1'b0;
				write_n		= 1'b0;
				address		= 7'b1001101;
				data_in		= {8'd0, 8'b01001001};
				clk_cnt		= 8'd50;
		#4;		start		= 1'b1;
		#4;		start		= 1'b0;
		wait (~busy);
		
		#10;
		$display("8-bit read\n");
				write_n		= 1'b1;
				address		= 7'b1101101;
				data_in		= {8'd0, 8'b10101010};
				clk_cnt		= 8'd50;
		#4;		start		= 1'b1;
		#4;		start		= 1'b0;
		wait (~busy);
		
		#10;
		$display("16-bit read\n");
				bits16		= 1'b1;
				write_n		= 1'b1;
				address		= 7'b0001101;
				data_in		= {16'b0110100110101010};
				clk_cnt		= 8'd10;
		#4;		start		= 1'b1;
		#4;		start		= 1'b0;
		wait (~busy);
		
		#10;
		$display("16-bit write\n");
				bits16		= 1'b1;
				write_n		= 1'b0;
				address		= 7'b0001101;
				data_in		= {16'b0110110110101010};
				clk_cnt		= 8'd255;
		#4;		start		= 1'b1;
		#4;		start		= 1'b0;
		wait (~busy);
		
		$display("Test ended sucessfully!!!\n");
		$finish;
	end

endmodule
