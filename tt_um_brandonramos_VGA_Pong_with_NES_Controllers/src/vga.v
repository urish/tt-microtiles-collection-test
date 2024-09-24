//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TinyTapeot 8
// Engineer: Brandon S. Ramos
// 
// Create Date: 07/12/2024 03:17:06 PM
// Design Name: 
// Module Name: vga.v
// Project Name: VGA Pong with NES Controllers
// Target Devices: 
// Tool Versions: 
// Description: VGA signal assignemt to display to a screen
//              VGA Video Interface: https://vhdl.us/book/Pedroni_VHDL_3E_AppendixI.pdf
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module vga(
    input wire clk,
    input wire reset_n,
    
    //VGA timing and picture
    output wire h_sync,
    output wire v_sync,
    output wire r,
    output wire g,
    output wire b,
    
    //Inputs to display to screen
    input wire [9:0] leftPaddle,
    input wire [9:0] rightPaddle,
    
    input wire [3:0] scoreLeft,
    input wire [3:0] scoreRight,
    
    input wire [9:0] ball_center_x,
    input wire [9:0] ball_center_y
    );

//End of horizontal line and inc row counter
wire col_roll; 
//Intermediate signals
wire [9:0] column_s, row_s;
wire r_s, g_s, b_s;
//When to display pixels
wire blank;

//VGA horizontal counter
Counter #(.countLimit(799)) Column_Counter(
    .clk(clk),
    .reset_n(reset_n),
    
    .ctrl(2'b01),
    .roll(col_roll),
    .Q(column_s)
    );

//VGA verticle counter
Counter #(.countLimit(524)) Row_Counter(
    .clk(clk),
    .reset_n(reset_n),
    
    .ctrl({1'b0,col_roll}),
    .Q(row_s)
    );

//Location and object display to screen
display display(
    .column(column_s),
    .row(row_s),
    
    .r(r_s),
    .g(g_s),
    .b(b_s),
    
    .leftPaddle(leftPaddle),
    .rightPaddle(rightPaddle),
    
    .scoreLeft(scoreLeft),
    .scoreRight(scoreRight),
    
    .ball_center_x(ball_center_x),
    .ball_center_y(ball_center_y)
    );
    
assign h_sync = ((column_s >= 655) && (column_s < 751)) ? 1'b0 : 1'b1;
assign v_sync = ((row_s >= 489) && (row_s < 491)) ? 1'b0 : 1'b1;
assign blank = ((column_s > 639) ||  (row_s > 479)) ? 1'b1 : 1'b0;

assign r = blank ? 1'b0 : r_s;
assign g = blank ? 1'b0 : g_s;
assign b = blank ? 1'b0 : b_s;

endmodule