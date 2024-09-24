//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TinyTapeout 8
// Engineer: Brandon S. Ramos
// 
// Create Date: 07/15/2024 08:46:47 PM
// Design Name: 
// Module Name: display.v
// Project Name: VGA Pong with NES Controllers
// Target Devices: 
// Tool Versions: 
// Description: Location of the objects and where to display pixels
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module display(
    //Coordinates for display
    input wire [9:0] column,
    input wire [9:0] row,
    
    //Determines what pixels have color and where
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
    
//Display signals
wire inside_border, verticle_lines, horizontal_lines, white, leftPaddle_en, rightPaddle_en, ball;
wire [6:0] leftScore, rightScore;
    
//Make sure all pixels are drawn in the border
assign inside_border = ((column>=20 && column<=620) || (row>=20 && row <=460)) ? 1'b1 : 1'b0;

//verticle border lines
assign verticle_lines = ((row >= 20) && (row <= 420) && (column == 20)) 
                            || ((row >= 20) && (row <= 420) && (column == 620)) ? 1'b1 : 1'b0;  
    
//horizontal border lines
assign horizontal_lines = ((column >= 20) && (column <= 620) && (row == 20)) 
                            || ((column >= 20) && (column <= 620) && (row == 420)) ? 1'b1 : 1'b0;
                            
//Gives the balls location depending on the x and y coordinates given in datapath                 
assign ball =  ((column == ball_center_x) && (row == ball_center_y-4))
            || ((column == ball_center_x+1) && (row == ball_center_y-4))
            || ((column == ball_center_x-1) && (row == ball_center_y-4))
            
            || ((column == ball_center_x-2) && (row == ball_center_y-3))
            || ((column == ball_center_x-1) && (row == ball_center_y-3))
            || ((column == ball_center_x)   && (row == ball_center_y-3))
            || ((column == ball_center_x+1) && (row == ball_center_y-3))
            || ((column == ball_center_x+2) && (row == ball_center_y-3))
            
            || ((column == ball_center_x-3) && (row == ball_center_y-2))
            || ((column == ball_center_x-2) && (row == ball_center_y-2))
            || ((column == ball_center_x-1) && (row == ball_center_y-2))
            || ((column == ball_center_x) && (row == ball_center_y-2))
            || ((column == ball_center_x+1) && (row == ball_center_y-2))
            || ((column == ball_center_x+2) && (row == ball_center_y-2))
            || ((column == ball_center_x+3) && (row == ball_center_y-2))
            
            || ((column == ball_center_x-4) && (row == ball_center_y-1))
            || ((column == ball_center_x-3) && (row == ball_center_y-1))
            || ((column == ball_center_x-2) && (row == ball_center_y-1))
            || ((column == ball_center_x-1) && (row == ball_center_y-1))
            || ((column == ball_center_x) && (row == ball_center_y-1))
            || ((column == ball_center_x+1) && (row == ball_center_y-1))
            || ((column == ball_center_x+2) && (row == ball_center_y-1))
            || ((column == ball_center_x+3) && (row == ball_center_y-1))
            || ((column == ball_center_x+4) && (row == ball_center_y-1))
            
            || ((column == ball_center_x-4) && (row == ball_center_y))
            || ((column == ball_center_x-3) && (row == ball_center_y))
            || ((column == ball_center_x-2) && (row == ball_center_y))
            || ((column == ball_center_x-1) && (row == ball_center_y))
            || ((column == ball_center_x) && (row == ball_center_y))
            || ((column == ball_center_x+1) && (row == ball_center_y))
            || ((column == ball_center_x+2) && (row == ball_center_y))
            || ((column == ball_center_x+3) && (row == ball_center_y))
            || ((column == ball_center_x+4) && (row == ball_center_y))
            
            || ((column == ball_center_x-4) && (row == ball_center_y+1))
            || ((column == ball_center_x-3) && (row == ball_center_y+1))
            || ((column == ball_center_x-2) && (row == ball_center_y+1))
            || ((column == ball_center_x-1) && (row == ball_center_y+1))
            || ((column == ball_center_x) && (row == ball_center_y+1))
            || ((column == ball_center_x+1) && (row == ball_center_y+1))
            || ((column == ball_center_x+2) && (row == ball_center_y+1))
            || ((column == ball_center_x+3) && (row == ball_center_y+1))
            || ((column == ball_center_x+4) && (row == ball_center_y+1))
            
            || ((column == ball_center_x-3) && (row == ball_center_y+2))
            || ((column == ball_center_x-2) && (row == ball_center_y+2))
            || ((column == ball_center_x-1) && (row == ball_center_y+2))
            || ((column == ball_center_x) && (row == ball_center_y+2))
            || ((column == ball_center_x+1) && (row == ball_center_y+2))
            || ((column == ball_center_x+2) && (row == ball_center_y+2))
            || ((column == ball_center_x+3) && (row == ball_center_y+2))
            
            || ((column == ball_center_x-2) && (row == ball_center_y+3))
            || ((column == ball_center_x-1) && (row == ball_center_y+3))
            || ((column == ball_center_x)   && (row == ball_center_y+3))
            || ((column == ball_center_x+1) && (row == ball_center_y+3))
            || ((column == ball_center_x+2) && (row == ball_center_y+3))
            
            || ((column == ball_center_x) && (row == ball_center_y+4))
            || ((column == ball_center_x+1) && (row == ball_center_y+4))
            || ((column == ball_center_x-1) && (row == ball_center_y+4)) ? 1'b1 : 1'b0;
            
/*  _
   |_|     7-segment display
   |_|
*/                          
assign leftScore[0] = (column >= 260 && column <= 280 && row >= 430 && row <= 433 && (scoreLeft == 0 || scoreLeft == 2 || scoreLeft == 3 || scoreLeft == 5 || scoreLeft == 6 || scoreLeft == 7 || scoreLeft == 8 || scoreLeft == 9)) ? 1'b1 :1'b0;
assign leftScore[1] = (column >= 260 && column <= 263 && row >= 430 && row <= 449 && (scoreLeft == 0 || scoreLeft == 4 || scoreLeft == 5 || scoreLeft == 6 || scoreLeft == 8 || scoreLeft == 9)) ? 1'b1 :1'b0;
assign leftScore[2] = (column >= 277 && column <= 280 && row >= 430 && row <= 449 && (scoreLeft == 0 || scoreLeft == 1 || scoreLeft == 2 || scoreLeft == 3 || scoreLeft == 4 || scoreLeft == 7 || scoreLeft == 8 || scoreLeft == 9)) ? 1'b1 :1'b0;
assign leftScore[3] = (column >= 260 && column <= 280 && row >= 448 && row <= 451 && (scoreLeft == 2 || scoreLeft == 3 || scoreLeft == 4 || scoreLeft == 5 || scoreLeft == 6 || scoreLeft == 8 || scoreLeft == 9)) ? 1'b1 :1'b0;
assign leftScore[4] = (column >= 260 && column <= 263 && row >= 450 && row <= 469 && (scoreLeft == 0 || scoreLeft == 2 || scoreLeft == 6 || scoreLeft == 8)) ? 1'b1 :1'b0;
assign leftScore[5] = (column >= 277 && column <= 280 && row >= 450 && row <= 469 && (scoreLeft == 0 || scoreLeft == 1 || scoreLeft == 3 || scoreLeft == 4 || scoreLeft == 5 || scoreLeft == 6 || scoreLeft == 7 || scoreLeft == 8 || scoreLeft == 9)) ? 1'b1 :1'b0;
assign leftScore[6] = (column >= 260 && column <= 280 && row >= 466 && row <= 469 && (scoreLeft == 0 || scoreLeft == 2 || scoreLeft == 3 || scoreLeft == 5 || scoreLeft == 6 || scoreLeft == 8)) ? 1'b1 :1'b0;
    
assign rightScore[0] = (column >= 360 && column <= 380 && row >= 430 && row <= 433 && (scoreRight == 0 || scoreRight == 2 || scoreRight == 3 || scoreRight == 5 || scoreRight == 6 || scoreRight == 7 || scoreRight == 8 || scoreRight == 9)) ? 1'b1 :1'b0;
assign rightScore[1] = (column >= 360 && column <= 363 && row >= 430 && row <= 449 && (scoreRight == 0 || scoreRight == 4 || scoreRight == 5 || scoreRight == 6 || scoreRight == 8 || scoreRight == 9)) ? 1'b1 :1'b0;
assign rightScore[2] = (column >= 377 && column <= 380 && row >= 430 && row <= 449 && (scoreRight == 0 || scoreRight == 1 || scoreRight == 2 || scoreRight == 3 || scoreRight == 4 || scoreRight == 7 || scoreRight == 8 || scoreRight == 9)) ? 1'b1 :1'b0;
assign rightScore[3] = (column >= 360 && column <= 380 && row >= 448 && row <= 451 && (scoreRight == 2 || scoreRight == 3 || scoreRight == 4 || scoreRight == 5 || scoreRight == 6 || scoreRight == 8 || scoreRight == 9)) ? 1'b1 :1'b0;
assign rightScore[4] = (column >= 360 && column <= 363 && row >= 450 && row <= 469 && (scoreRight == 0 || scoreRight == 2 || scoreRight == 6 || scoreRight == 8)) ? 1'b1 :1'b0;
assign rightScore[5] = (column >= 377 && column <= 380 && row >= 450 && row <= 469 && (scoreRight == 0 || scoreRight == 1 || scoreRight == 3 || scoreRight == 4 || scoreRight == 5 || scoreRight == 6 || scoreRight == 7 || scoreRight == 8 || scoreRight == 9)) ? 1'b1 :1'b0;
assign rightScore[6] = (column >= 360 && column <= 380 && row >= 466 && row <= 469 && (scoreRight == 0 || scoreRight == 2 || scoreRight == 3 || scoreRight == 5 || scoreRight == 6 || scoreRight == 8)) ? 1'b1 :1'b0;
                                                       
//This is where on the screen the left pong paddle will be drawn 
//size is 3 x 51(w x l)
assign leftPaddle_en = ((column >=40 && column <= 43) 
    && (row >= (leftPaddle-25) && row <= (leftPaddle+25))) ? 1'b1 : 1'b0;
    
//This is where on the screen the right pong paddle will be drawn
//size is 3 x 51(w x l)
assign rightPaddle_en = (column >=597 && column <= 600) 
    && (row >= (rightPaddle-25) && row <= (rightPaddle+25)) ? 1'b1 : 1'b0;
    
assign white = verticle_lines || horizontal_lines || leftPaddle_en || rightPaddle_en || ball || leftScore[0] || leftScore[1] || leftScore[2] || leftScore[3] || leftScore[4] || leftScore[5] || leftScore[6] || rightScore[0] || rightScore[1] || rightScore[2] || rightScore[3] || rightScore[4] || rightScore[5] || rightScore[6];

assign r = ((inside_border == 1'b1) && (white == 1'b1)) ? 1'b1 : 1'b0;
assign g = ((inside_border == 1'b1) && (white == 1'b1)) ? 1'b1 : 1'b0;
assign b = ((inside_border == 1'b1) && (white == 1'b1)) ? 1'b1 : 1'b0;
    
endmodule