//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TinyTapeout 8
// Engineer: Brandon S. Ramos
// 
// Create Date: 07/15/2024 08:20:09 PM
// Design Name: 
// Module Name: control_unit.v
// Project Name: VGA Pong with NES Controllers
// Target Devices: 
// Tool Versions: 
// Description: Control Unit for the Finite State Machines used
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module control_unit(
    input wire clk,
    input wire reset_n,
    
    //NES left controller FSM I/O from datapath to control unit
    input wire [1:0] sw_NESController_Left,
    output wire [9:0]cw_NESController_Left,
    
    //NES right controller FSM I/O from datapath to control unit
    input wire [1:0] sw_NESController_Right,
    output wire [9:0]cw_NESController_Right,
    
    //Ball Movement FSM I/O from datapath to control unit
    input wire [3:0] sw_ballMovement,
    output wire [3:0] cw_ballMovement
    );

//FSM states for the ball movement
localparam [2:0]Reset = 3'd0,
                UpRight = 3'd1,
                UpLeft = 3'd2,
                DownRight = 3'd3,
                DownLeft = 3'd4;
reg [2:0]state_ballMovement;


//Left controller FSM
NES_Controller_FSM NES_Controller_Left(
    .clk(clk),
    .reset_n(reset_n),
    .sw_NESController(sw_NESController_Left),
    .cw_NESController(cw_NESController_Left)
    
);

//Right controller FSM
NES_Controller_FSM NES_Controller_Right(
    .clk(clk),
    .reset_n(reset_n),
    .sw_NESController(sw_NESController_Right),
    .cw_NESController(cw_NESController_Right)
    
);

/**********************************************************************
Set Word Table

sw: 0001 - hit right paddle
    0010 - hit left paddle
    0100 - hit top border
    1000 - hit bottom border
    
The process below will determine the direction of travel for the ball
**********************************************************************/
always @(posedge clk) begin
    if(reset_n == 1'b0)
        state_ballMovement <= UpLeft;
    else begin
        case(state_ballMovement)
            Reset: begin
                state_ballMovement <= UpLeft;
            end
            UpRight: begin
                if(sw_ballMovement == 4'b0001) 
                    state_ballMovement <= UpLeft;
                else if(sw_ballMovement == 4'b0011)
                    state_ballMovement <= DownRight;
                else if(sw_ballMovement == 4'b0101)
                    state_ballMovement <= Reset;
                else
                    state_ballMovement <= UpRight;            
            end
            UpLeft: begin
                if(sw_ballMovement == 4'b0010)
                    state_ballMovement <= UpRight;
                else if(sw_ballMovement == 4'b0011)
                    state_ballMovement <= DownLeft;
                else if(sw_ballMovement == 4'b0101)
                    state_ballMovement <= Reset;
                else
                    state_ballMovement <= UpLeft;
            end
            DownLeft: begin
                if(sw_ballMovement == 4'b0010)
                    state_ballMovement <= DownRight;
                else if(sw_ballMovement == 4'b0100)
                    state_ballMovement <= UpLeft;
                else if(sw_ballMovement == 4'b0101)
                    state_ballMovement <= Reset;
                else
                    state_ballMovement <= DownLeft;
            end
            DownRight: begin
                if(sw_ballMovement == 4'b0001)
                    state_ballMovement <= DownLeft;
                else if(sw_ballMovement == 4'b0100)
                    state_ballMovement <= UpRight;
                else if(sw_ballMovement == 4'b0101)
                    state_ballMovement <= Reset;
                else
                    state_ballMovement <= DownRight;
            end
            default: begin
                //Do nothing
            end
        endcase
    end
end

/*************************************************************************************
Control Word Table

Data_read        
0001 - +x, +y        
0010 - -x, -y       
0100 - +x, -y       
0011 - -x, +y   
//*************************************************************************************/
assign cw_ballMovement = (state_ballMovement == UpRight) ? 4'b0100 :
                         (state_ballMovement == UpLeft) ? 4'b0010 :
                         (state_ballMovement == DownLeft) ? 4'b0011 :
                         (state_ballMovement == Reset) ? 4'b0101 :
                         4'b0001; //downright
                         
endmodule