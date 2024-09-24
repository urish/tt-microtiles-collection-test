//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TinyTapeout 8
// Engineer: Brandon S. Ramos
// 
// Create Date: 07/15/2024 08:21:31 PM
// Design Name: 
// Module Name: Pong.v
// Project Name: VGA Pong with NES Controllers
// Target Devices: 
// Tool Versions: 
// Description: Top Module for the project
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This design was converted from a past school VHDL final project 
// worked on by Tate Anderson and myself at the University of Nebraska-Lincoln 
// 
//////////////////////////////////////////////////////////////////////////////////

/*
Input: N/A
Output:
    1. h_sync
    2. v_sync
    3. r
    4. g
    5. b
Bidirectional:
    1. NES_Controller_Left[0] data
    2. NES_Controller_Left[1] clock
    3. NES_Controller_Left[2] latch
    4. NES_Controller_Right[0] data
    5. NES_Controller_Right[1] clock
    6. NES_Controller_Right[2] latch
*/

module Pong(
    input wire clk,
    input wire reset_n, 
    
    output wire [4:0] out,
    inout wire [5:0] bidir
    );
    
//Interconnecting wires between modules
wire [9:0] cw_NESController_Left;
wire [1:0] sw_NESController_Left;

wire [9:0] cw_NESController_Right;
wire [1:0] sw_NESController_Right;

wire [3:0] sw_ballMovement;
wire [3:0] cw_ballMovement;

wire [2:0] NES_Controller_Left, NES_Controller_Right;
wire h_sync, v_sync, r, g, b;
    
datapath datapath(
    .clk(clk),
    .reset_n(reset_n),
    
    //VGA timing and picture
    .h_sync(h_sync),
    .v_sync(v_sync),
    .r(r),
    .g(g),
    .b(b),
    
    //NES left controller FSM I/O from datapath to control unit
    .cw_NESController_Left(cw_NESController_Left),
    .sw_NESController_Left(sw_NESController_Left),
    
    //NES right controller FSM I/O from datapath to control unit
    .cw_NESController_Right(cw_NESController_Right),
    .sw_NESController_Right(sw_NESController_Right),
    
    //NES Controller input for left/right
    .NES_Controller_Left(NES_Controller_Left),
    .NES_Controller_Right(NES_Controller_Right),
    
    //Ball Movement FSM I/O from datapath to control unit
    .sw_ballMovement(sw_ballMovement),
    .cw_ballMovement(cw_ballMovement)
    );

    
control_unit control_unit(
    .clk(clk),
    .reset_n(reset_n), //Artix-7 reset is active low
    
    //NES left controller FSM I/O from datapath to control unit
    .cw_NESController_Left(cw_NESController_Left),
    .sw_NESController_Left(sw_NESController_Left),
    
    //NES right controller FSM I/O from datapath to control unit
    .cw_NESController_Right(cw_NESController_Right),
    .sw_NESController_Right(sw_NESController_Right),
    
    //Ball Movement FSM I/O from datapath to control unit
    .sw_ballMovement(sw_ballMovement),
    .cw_ballMovement(cw_ballMovement)
    ); 


//Convert module signals to TinyTapeout I/O
assign out = ({b, g, r, v_sync, h_sync});

assign NES_Controller_Left[0] = bidir[0];  //Left controller data in
assign bidir[1] = NES_Controller_Left[1];  //Left Pulse out
assign bidir[2] = NES_Controller_Left[2];  //Left Latch out
assign NES_Controller_Right[0] = bidir[3]; //Right controller data in
assign bidir[4] = NES_Controller_Right[1]; //Right Pulse out
assign bidir[5] = NES_Controller_Right[2]; //Right Pulse out

endmodule