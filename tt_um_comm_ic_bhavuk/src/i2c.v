`default_nettype none

// Module for the I2C
module i2c #(
	parameter DATA_BITS = 16,
	parameter CLK_RATIO = 8
		)(
	// Internal ports
	input	wire			clk,
	input	wire			reset_n,
	input	wire			start,
	input	wire			bits16,
	input	wire			write_n,	// "0" for write
	input	wire [6:0]		address,
	input	wire [DATA_BITS-1:0]	data_in,
	input	wire [CLK_RATIO-1:0]	clk_cnt,	// clk_cnt of SCL wrt IPCLK (>=2)
	output	reg  [DATA_BITS-1:0]	data_out,
	output	reg			busy,
	output	reg			error,
	
	// External ports
	output	reg			SCL,		// Serial Interface Clock
	output	reg			SDA_op,	// Serial Interface Data Out
	input	wire			SDA_in,	// Serial Interface Data In
	output	reg			op_en		// SDA Mode Select
	);
	
	reg			read_mode;
	reg [7:0]		addr_wr;
	reg [DATA_BITS-1:0]	data_wr;
	reg [CLK_RATIO-1:0]	clk_cnt_reg;
	reg [CLK_RATIO-1:0]	scl_cnt;
	
	reg [2:0]		addr_ind;
	reg [$clog2(DATA_BITS)-1: 0] data_ind;
	
	// State machine
	reg [2:0] curr_st;
	localparam [2:0]
		idle		= 3'b000,
		start_seq	= 3'b001,
		wait_st0	= 3'b010,
		addr_tr	= 3'b011,
		ack_tr		= 3'b100,
		data_tr	= 3'b101,
		wait_st1	= 3'b110,
		stop		= 3'b111;
	
	// State register
	always @(posedge clk) begin
		if (~reset_n) begin
			SCL		<= 1'b1;
			SDA_op		<= 1'b1;
			op_en		<= 1'b1;
			
			data_out	<= {DATA_BITS{1'b0}};
			busy		<= 1'b0;
			error		<= 1'b0;
			
			read_mode	<= 1'b0;
			addr_wr	<= 8'd0;
			data_wr	<= {DATA_BITS{1'b0}};
			scl_cnt	<= {CLK_RATIO{1'b0}};
			clk_cnt_reg	<= {CLK_RATIO{1'b0}};
			addr_ind	<= 3'd0;
			data_ind	<= {$clog2(DATA_BITS){1'b0}};
			
			curr_st	<= idle;
		end
		else begin
			case(curr_st)
				idle: begin
					SCL		<= 1'b1;
					SDA_op		<= 1'b1;
					op_en		<= 1'b1;
					
					busy		<= 1'b0;
					
					read_mode	<= 1'b0;
					addr_wr	<= 8'd0;
					data_wr	<= {DATA_BITS{1'b0}};
					scl_cnt	<= {CLK_RATIO{1'b0}};
					clk_cnt_reg	<= {CLK_RATIO{1'b0}};
					addr_ind	<= 3'd0;
					data_ind	<= {$clog2(DATA_BITS){1'b0}};
					
					if (start) begin
						data_out	<= {DATA_BITS{1'b0}};
						busy		<= 1'b1;
						error		<= 1'b0;
						
						read_mode	<= write_n;
						addr_wr	<= {address, write_n};
						data_wr	<= data_in;
						scl_cnt	<= clk_cnt-1;
						clk_cnt_reg	<= clk_cnt;
						addr_ind	<= 3'd7;
						data_ind	<= bits16 ? (DATA_BITS-1) : ((DATA_BITS >> 1)-1);
						
						curr_st	<= start_seq;
					end
				end
				
				start_seq: begin
					scl_cnt	<= scl_cnt - 1;
					
					if (scl_cnt == (clk_cnt_reg >> 1))
						SDA_op		<= 1'b0;
					if (scl_cnt == 0) begin
						SCL		<= 1'b0;
						
						scl_cnt	<= clk_cnt_reg-1;
						curr_st	<= wait_st0;
					end
				end
				
				wait_st0 : begin
					scl_cnt	<= scl_cnt - 1;
					
					if (scl_cnt == (clk_cnt_reg >> 1)) begin
						SDA_op		<= addr_wr[addr_ind];
						
						scl_cnt	<= clk_cnt_reg-1;
						curr_st	<= addr_tr;
					end
				end
				
				addr_tr: begin
					scl_cnt	<= scl_cnt - 1;
					
					if (scl_cnt == (clk_cnt_reg >> 1)) begin
						SCL		<= 1'b1;
						
						if (addr_ind > 0)
							addr_ind	<= addr_ind-1;
						if (addr_ind == 0)
							curr_st	<= ack_tr;
					end
					if (scl_cnt == 0) begin
						SCL		<= 1'b0;
						
						SDA_op		<= addr_wr[addr_ind];
						scl_cnt	<= clk_cnt_reg-1;
					end
				end
				
				ack_tr: begin
					scl_cnt	<= scl_cnt - 1;
					
					if (scl_cnt == 0) begin
						SCL		<= 1'b0;
						SDA_op		<= 1'b0;
						op_en		<= 1'b0;
						
						scl_cnt	<= clk_cnt_reg-1;
					end
					
					if (scl_cnt == (clk_cnt_reg >> 1)) begin
						SCL		<= 1'b1;
						
						if (SDA_in == 0)
							curr_st	<= data_tr;
						else begin
							error		<= 1'b1;
							
							curr_st	<= idle;
						end
					end
				end
				
				data_tr: begin
					scl_cnt	<= scl_cnt - 1;
					
					if (scl_cnt == 0) begin
						SCL		<= 1'b0;
						
						if (~read_mode) begin
							SDA_op		<= data_wr[data_ind];
							op_en		<= 1'b1;
						end
						
						scl_cnt	<= clk_cnt_reg-1;
					end
					
					if (scl_cnt == (clk_cnt_reg >> 1)) begin
						SCL		<= 1'b1;
						
						if (read_mode)
							data_out[data_ind]	<= SDA_in;
						if (data_ind > 0)
							data_ind	<= data_ind-1;
						if (data_ind == 0)
							curr_st	<= wait_st1;
					end
				end
				
				wait_st1: begin
					scl_cnt	<= scl_cnt - 1;
					
					if (scl_cnt == 0) begin
						SCL		<= 1'b0;
						
						scl_cnt	<= clk_cnt_reg-1;
					end
					
					if (scl_cnt == (clk_cnt_reg >> 1)) begin
						SCL		<= 1'b1;
						op_en		<= 1'b1;
						
						curr_st	<= stop;
					end
				end
				
				stop: begin
					scl_cnt	<= scl_cnt - 1;
					
					if (scl_cnt == 0) begin
						SDA_op		<= 1'b1;
						
						busy		<= 1'b0;
						
						curr_st	<= idle;
					end
				end
			endcase
		end
	end
	
endmodule

