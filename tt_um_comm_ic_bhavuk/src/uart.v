`default_nettype none

// Module for  UART
module uart #(
	parameter CLK_RATIO = 8
		)(
	// Internal Ports
	input	wire					clk,
	input	wire					reset_n,
	
	input	wire					enable,
	input	wire					setting,
	input	wire					parity_en,
	input	wire					parity_odd,
	input	wire					tx_new,
	input	wire					rx_ack,
	output	reg						tx_busy,
	output	reg						rx_new,
	output	reg						rx_error,
	
	input	wire	[CLK_RATIO-1:0]	clk_cnt,	// clk_cnt of baudrate wrt IPCLK (>=2)
	input 	wire	[7:0]   		tx_data,
	output	reg 	[7:0] 	  		rx_data,
	
	// External Ports
	input	wire					UART_RX,	// Data in pin
	output	reg						UART_TX		// Data out pin
	);
	
	// Uart settings
	reg         par_en;		// Enable the parity bit
	reg         par_odd;	// 1'b0: Even parity; 1'b1: Odd parity
	reg			clk_b;
	
	reg	[10:0]	tx_data_reg;
	reg	[10:0]	rx_data_reg;
	reg	[3:0]	tx_ind;
	reg	[3:0]	rx_ind;
	
	reg	[CLK_RATIO-1:0] clk_cnt_reg;	// Clk_rate/(baud_rate*2)
	reg	[CLK_RATIO-1:0] uclk_cnt;
	
	// State instantiations
	reg [1:0]		curr_st;
	localparam
		idle 	= 2'b00,
		setup	= 2'b01,
		working	= 2'b10;
	
	reg				tx_st;
	localparam
		idle_tx		= 1'b0,
		data_st_tx	= 1'b1;
	
	reg	[1:0]		rx_st;
	localparam
		idle_rx		= 2'b00,
		data_st_rx	= 2'b01,
		valid_rx	= 2'b10;
	
	
	always @(posedge clk) begin
		if(~reset_n) begin
			clk_b		<= 1'b0;
			par_en		<= 1'b0;
			par_odd		<= 1'b0;
			clk_cnt_reg	<= {CLK_RATIO{1'b0}};
			uclk_cnt	<= {CLK_RATIO{1'b0}};
			
			curr_st		<= idle;
		end
		else begin
			case(curr_st)
				idle: begin
					clk_b		<= 1'b0;
					par_en		<= 1'b0;
					par_odd		<= 1'b0;
					clk_cnt_reg	<= {CLK_RATIO{1'b0}};
					uclk_cnt	<= {CLK_RATIO{1'b0}};
					
					if (setting)
						curr_st		<= setup;
				end
				
				setup: begin
					clk_cnt_reg	<= clk_cnt;
					uclk_cnt	<= clk_cnt-1;
					par_en		<= parity_en;
					par_odd		<= parity_odd;
					
					if (enable)
						curr_st		<= working;
				end
				
				working: begin
					// Uart clk generation
					uclk_cnt	<= uclk_cnt-1;
					if (uclk_cnt == 0) begin
						uclk_cnt	<= clk_cnt_reg-1;
						clk_b		<= 1'b1;
					end
					if (uclk_cnt == (clk_cnt_reg >> 1))
						clk_b		<= 1'b0;
					if (~enable)
						curr_st		<= idle;
				end
				
				default:
					curr_st	<= idle;
			endcase
		end
	end
	
	// UART Tx
	always @(posedge(clk_b)) begin
		if (~reset_n) begin
			tx_data_reg	<= 11'd0;
			tx_ind		<= 4'd0;
			tx_busy		<= 1'b0;
			
			UART_TX		<= 1'b1;
			
			tx_st		<= idle_tx;
		end
		else begin
			case(tx_st)
				idle_tx: begin
					tx_data_reg	<= 11'd0;
					tx_ind		<= 4'd0;
					tx_busy		<= 1'b0;
					
					UART_TX		<= 1'b1;
					
					if (enable & tx_new) begin
						tx_ind		<= par_en ? 4'd10 : 4'd9;
						tx_busy		<= 1'b1;
						if (par_en) begin
							if (par_odd)
								tx_data_reg	<= {1'b0, tx_data, ~^(tx_data), 1'b1};
							else
								tx_data_reg	<= {1'b0, tx_data, ^(tx_data), 1'b1};
						end
						else
							tx_data_reg	<= {2'b0, tx_data, 1'b1};
						
						tx_st	<= data_st_tx;
					end
				end
				
				data_st_tx: begin
					UART_TX		<= tx_data_reg[tx_ind];
					tx_ind		<= tx_ind-1;
					
					if (tx_ind == 0) begin
						tx_busy	<= 1'b0;
						
						tx_st	<= idle_tx;
					end
				end
			endcase
		end
	end
	
	// UART Rx
	always @(posedge(clk_b)) begin
		if (~reset_n) begin
			rx_data_reg	<= 11'd0;
			rx_ind		<= 4'd0;
			rx_new		<= 1'b0;
			rx_error	<= 1'b0;
			
			rx_st		<= idle_rx;
		end
		else begin
			case(rx_st)
				idle_rx: begin
					rx_data_reg	<= 11'd0;
					rx_ind		<= par_en ? 4'd10 : 4'd9;
					
					if (rx_ack)
						rx_new	<= 1'b0;
					
					if (enable & ~UART_RX) begin
						rx_data_reg[rx_ind]	<= UART_RX;
						rx_ind				<= rx_ind-1;
						
						rx_new				<= 1'b0;
						rx_error			<= 1'b0;
						
						rx_st				<= data_st_rx;
					end
				end
				
				data_st_rx: begin
					rx_data_reg[rx_ind]	<= UART_RX;
					rx_ind				<= rx_ind-1;
					
					if (rx_ind == 0)
						rx_st	<= valid_rx;
				end
				
				valid_rx: begin
					rx_st	<= idle;
					
					if (par_en) begin
						if (par_odd) begin
							if ((rx_data_reg[0] == 1'b1) & (rx_data_reg[10] == 1'b0) & (rx_data_reg[1] == ~^(rx_data_reg[9:2]))) begin
								rx_data <= rx_data_reg[9:2];
								rx_new	<= 1'b1;
							end
							else
								rx_error	<= 1'b1;
						end
						else begin
							if ((rx_data_reg[0] == 1'b1) & (rx_data_reg[10] == 1'b0) & (rx_data_reg[1] == ^(rx_data_reg[9:2]))) begin
								rx_data <= rx_data_reg[9:2];
								rx_new	<= 1'b1;
							end
							else
								rx_error	<= 1'b1;
						end
					end
					else begin
						if ((rx_data_reg[0] == 1'b1) & (rx_data_reg[9] == 1'b0)) begin
							rx_data <= rx_data_reg[8:1];
							rx_new	<= 1'b1;
						end
						else
							rx_error	<= 1'b1;
					end
				end
			endcase
		end
	end

endmodule

