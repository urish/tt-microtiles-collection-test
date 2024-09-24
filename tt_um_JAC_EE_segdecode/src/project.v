/*
 * Copyright (c) 2024 Jack Clayton
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_JAC_EE_segdecode(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
	
	//DEBUG
	//,output reg  [7:0] dIN, dOUT			//8 bit SPI buffer
);

  //Net type
  wire SCK, MOSI, EN, /*RESET,*/ MISO;
  wire [3:0] KeyPlxr, ScreenSel;
  wire [6:0] Out7S;
  //wire 		 HIGH_Z;			//Output used as high impedance input for external tri-state buffer
  reg  [7:0] dIN, dOUT;		//8 bit SPI buffer
  //reg		 RESET_int;			//Reset buffer to hold CPLD in reset when ISP

  // All output pins must be assigned. If not used, assign to 0.
  //assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out[7:5] = 0;
  assign uio_oe  = 8'hFF; //IOs used only as outputs
  
  //SPIs
  assign SCK   = clk;      //& rst_n; rst_n make waveforms a bit easier to read. do not use in final; causes timing violations
  //assign SCK   = ui_in[0]; //!! Check: should be clk?
  assign MOSI  = ui_in[1];
  assign EN    = ui_in[2];
  //assign RESET = rst_n; //!! Check what this pin is allowed to be used for
  //assign RESET = ui_in[3]; //!! Check: should be rst_n?
  assign uo_out[7] = MISO;
  
  assign KeyPlxr      = ui_in[7:4]; //Keypad collumns
  assign uo_out[6:0]  = Out7S;
  assign uio_out[3:0] = ScreenSel;
  assign uio_out[4]	  = ~EN; //Used to set MISO to High Z to prevent collisions during ATMega32a ISP

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, /*clk,*/ rst_n, uio_in, ui_in[3], ui_in[0], 1'b0};
  
  
  //////////////////////////////////////
  integer i; 							    //Used for generating shift register
 	// Multiplexer logic
	assign MISO = ~((~dOUT[7]  & ~dOUT[6]  &  KeyPlxr[0]) 
				  | (~dOUT[7]  &  dOUT[6]  &  KeyPlxr[1]) 
				  | ( dOUT[7]  &  dOUT[6]  &  KeyPlxr[3]) 
				  | ( dOUT[7]  & ~dOUT[6]  &  KeyPlxr[2]));
	//assign HIGH_Z = RESET_int; //Used to set MISO to High Z to prevent collisions during ATMega32a ISP
	//assign MISO = RESET_int ? 1'bZ : MUX; //Used to set MISO to High Z to prevent collisions during ATMega32a ISP WARNING WILL LIKELY CAUSE ISSUES IN ASIC!!!!!!!!!!

	// Screen selection logic - Walking 0
	assign ScreenSel[0] =  dOUT[5]  |  dOUT[4];	//00
	assign ScreenSel[1] =  dOUT[5]  | ~dOUT[4];	//01
	assign ScreenSel[2] = ~dOUT[5]  |  dOUT[4];	//10
	assign ScreenSel[3] = ~dOUT[5]  | ~dOUT[4];	//11

	// 7 Segment display logic
	/*A*/assign Out7S[6] = ~EN | (~((~dOUT[3] | (~dOUT[1] & ~dOUT[2])) & (~dOUT[2] | dOUT[1] | dOUT[0]) & (dOUT[3] | dOUT[2] | dOUT[1] | ~dOUT[0])));
	/*B*/assign Out7S[5] = ~EN | (~((dOUT[3] | ~dOUT[2]) | ((dOUT[1] | ~dOUT[0]) & (~dOUT[1] | dOUT[0]))));
	/*C*/assign Out7S[4] = ~EN | (~((dOUT[3] | dOUT[2] | ~dOUT[1] | dOUT[0])));
	/*D*/assign Out7S[3] = ~EN | (~(((~dOUT[3] & ~dOUT[2]) & (dOUT[1] | ~dOUT[0])) | (dOUT[3] & ~dOUT[2] & ~dOUT[1]) | (~dOUT[3] & ((dOUT[1] & ~dOUT[0]) | (dOUT[2] & ~dOUT[1] & dOUT[0])))));
	/*E*/assign Out7S[2] = ~EN | (~((dOUT[1] & (~dOUT[0] | dOUT[3])) | (dOUT[3] & dOUT[2]) | ((~dOUT[1] & ~dOUT[0]) & (dOUT[3] | ~dOUT[2]))));
	/*F*/assign Out7S[1] = ~EN | (~(((dOUT[3] | dOUT[2]) | (~dOUT[1] & ~dOUT[0])) & (dOUT[3] | ~dOUT[1] | ~dOUT[0])));
	/*G*/assign Out7S[0] = ~EN | (~((dOUT[3] | dOUT[2] | dOUT[1]) & (dOUT[3] | ~dOUT[2] | ~dOUT[1] | ~dOUT[0])));

	always @(posedge SCK) begin//SPI clock in
		if (EN) begin
			//Generate D shift register - Telling synthesiser to copy this Verilog over and over.
				dIN[0] <= MOSI;
			for (i = 0; i < 7; i = i + 1) begin
				dIN[i+1] <= dIN[i];
			end
		end
	end

	always @(negedge EN)begin //Move input buffer into output
			dOUT <= dIN;
	end

endmodule
