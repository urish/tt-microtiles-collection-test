`default_nettype none

// Module for the SPI
module spi #(
	parameter DATA_BITS = 16,
	parameter CLK_RATIO = 8
		)(
	// Internal ports
	input	wire			clk,
	input	wire			reset_n,
	input	wire			start,
	input	wire			bits16,
	input	wire [1:0]		mode,
	input	wire [DATA_BITS-1:0]	data_in,
	input	wire [CLK_RATIO-1:0]	clk_cnt,	// clk_cnt of SCLK wrt IPCLK (>=2)
	output	reg  [DATA_BITS-1:0]	data_out,
	output	reg			busy,
	
	// External ports
	output	reg			SEN,	// Serial Interface Enable; Active low
	output	reg			SCLK,	// Serial Interface Clock
	output	reg			MOSI,	// Serial Interface Data Out
	input	wire			MISO	// Serial Interface Data In
	);
	
	reg CPOL, CPHA;
	
	reg [DATA_BITS-1:0]	data_wr;
	reg [CLK_RATIO-1: 0]	clk_cnt_reg;
	reg [CLK_RATIO-1: 0]	sclk_cnt;
	
	reg [$clog2(DATA_BITS)-1: 0] data_ind;

	// State machine
	reg [1:0] curr_st;
	localparam [1:0]
		idle		= 2'b00,
		data_tr	= 2'b01,
		setting	= 2'b10,
		stop		= 2'b11;
	
	
	// State register
	always @(posedge clk) begin
		if (~reset_n) begin
			SEN		<= 1'b1;
			SCLK		<= 1'b0;
			MOSI		<= 1'b0;
			
			CPOL		<= 1'b0;
			CPHA		<= 1'b0;

			data_ind	<= {$clog2(DATA_BITS){1'b0}};
			sclk_cnt	<= {CLK_RATIO{1'b0}};
			clk_cnt_reg	<= {CLK_RATIO{1'b0}};
			data_wr	<= {DATA_BITS{1'b0}};
			data_out <= {DATA_BITS{1'b0}};
			
			busy		<= 1'b0;
			
			curr_st	<= idle;
		end
		else begin
			case(curr_st)
				idle: begin
					SEN		<= 1'b1;
					SCLK		<= 1'b0;
					MOSI		<= 1'b0;
					
					CPOL		<= 1'b0;
					CPHA		<= 1'b0;
					
					data_ind	<= {$clog2(DATA_BITS){1'b0}};
					sclk_cnt	<= {CLK_RATIO{1'b0}};
					clk_cnt_reg	<= {CLK_RATIO{1'b0}};
					data_wr	<= {DATA_BITS{1'b0}};
					
					busy 		<= 1'b0;
					
					if (start) begin						
						data_ind	<= bits16 ? (DATA_BITS-1) : ((DATA_BITS >> 1)-1);
						sclk_cnt	<= clk_cnt-1;
						clk_cnt_reg	<= clk_cnt;
						data_wr	<= data_in;
						data_out <= {DATA_BITS{1'b0}};
						
						
						CPOL		<= mode[1];
						CPHA		<= mode[0];
						
						busy		<= 1'b1;
						
						curr_st	<= setting;
					end
				end
				
				setting: begin
					SCLK		<= CPOL;
					
					sclk_cnt	<= sclk_cnt - 1;
					if (sclk_cnt == (clk_cnt_reg >> 1)) begin
						SEN		<= 1'b0;
						MOSI		<= data_wr[data_ind];
						
						sclk_cnt	<= clk_cnt_reg-1;
						
						curr_st	<= data_tr;
					end
				end
				
				data_tr: begin
					sclk_cnt <= sclk_cnt - 1;
					if (sclk_cnt == (clk_cnt_reg >> 1)) begin
						SCLK <= ~SCLK;
						
						case({CPOL, CPHA})
							2'b00: begin	// Mode 0; rising edge
								data_out[data_ind]	<= MISO;
							
								if (data_ind > 0)
									data_ind	<= data_ind-1;
								if (data_ind == 0)
									curr_st	<= stop;
							end
							2'b01: begin	// Mode 1; rising edge
								MOSI		<= data_wr[data_ind];
							end
							2'b10: begin	// Mode 2; falling edge
								data_out[data_ind]	<= MISO;
							
								if (data_ind > 0)
									data_ind	<= data_ind-1;
								if (data_ind == 0)
									curr_st	<= stop;
							end
							2'b11: begin	// Mode 3; falling edge
								MOSI		<= data_wr[data_ind];
							end
						endcase
					end
					if (sclk_cnt == 0) begin
						SCLK <= ~SCLK;
						
						sclk_cnt <= clk_cnt_reg - 1;
						
						case({CPOL, CPHA})
							2'b00: begin	// Mode 0; falling edge
								MOSI		<= data_wr[data_ind];
							end
							2'b01: begin	// Mode 1; falling edge
								data_out[data_ind]	<= MISO;
							
								if (data_ind > 0)
									data_ind	<= data_ind-1;
								if (data_ind == 0)
									curr_st	<= stop;
							end
							2'b10: begin	// Mode 2; rising edge
								MOSI		<= data_wr[data_ind];
							end
							2'b11: begin	// Mode 3; rising edge
								data_out[data_ind]	<= MISO;
							
								if (data_ind > 0)
									data_ind	<= data_ind-1;
								if (data_ind == 0)
									curr_st	<= stop;
							end
						endcase
					end
				end
				
				stop: begin
					sclk_cnt <= sclk_cnt - 1;
					if ((sclk_cnt == 0) | (sclk_cnt == (clk_cnt_reg >> 1))) begin
						SEN <= 1'b1;
						
						busy	<= 1'b0;
						
						curr_st <= idle;
					end
				end
			endcase
		end
	end
	
endmodule

