//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TinyTapeout 8
// Engineer: Brandon S. Ramos
// 
// Create Date: 07/22/2024 01:39:22 PM
// Design Name: 
// Module Name: NES_Controller_FSM.v
// Project Name: VGA Pong with NES Controllers
// Target Devices: 
// Tool Versions: 
// Description: Finite State Machine to read in the NES Controller button presses
//              The NES Controller Handler: https://tresi.github.io/nes/
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module NES_Controller_FSM(
    input clk,
    input reset_n,
    
    input wire [1:0] sw_NESController,
    output wire [9:0]cw_NESController
    );
    
//FSM states for grabbing the NES Controller input
localparam [4:0]Reset = 5'd0,
                Latch1 = 5'd1,
                Latch2 = 5'd2,
                A_low = 5'd3,
                B_hi = 5'd4,
                B_low = 5'd5,
                Select_hi = 5'd6,
                Select_low = 5'd7,
                Start_hi = 5'd8,
                Start_low = 5'd9,
                Up_hi = 5'd10,
                Up_low = 5'd11,
                Down_hi = 5'd12,
                Down_low = 5'd13,
                Left_hi = 5'd14,
                Left_low = 5'd15,
                Right_hi = 5'd16,
                Right_low = 5'd17,
                Pulse_hi = 5'd18;
reg [4:0]state_NESController;

always @(posedge clk) begin
    if(reset_n == 1'b0)
        state_NESController <= Reset;
    else begin
        case(state_NESController)
            Reset: begin
                if(sw_NESController[1] == 1'b1)
                    state_NESController <= Latch1;
            end
            Latch1: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Latch2;
            end
            Latch2: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= A_low;
            end
            A_low: begin
                if(sw_NESController[0] == 1'b1)
                        state_NESController <= B_hi;
            end
            B_hi: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= B_low;
            end
            B_low: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Select_hi;
            end
            Select_hi: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Select_low;
            end
            Select_low: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Start_hi;
            end
            Start_hi: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Start_low;
            end
            Start_low: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Up_hi;
            end
            Up_hi: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Up_low;
            end
            Up_low: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Down_hi;
            end
            Down_hi: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Down_low;
            end
            Down_low: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Left_hi;
            end
            Left_hi: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Left_low;
            end
            Left_low: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Right_hi;
            end
            Right_hi: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Right_low;
            end
            Right_low: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Pulse_hi;
            end
            Pulse_hi: begin
                if(sw_NESController[0] == 1'b1)
                    state_NESController <= Reset;
            end
            default: begin
                //Do nothing
            end
        endcase
    end
end

/****************************************************************************************************************************
Control Word Table for NES Controller (cw_NESController[9:0] 00_0000_0_0_00)

[9:8]   <= ctrl bits for NES delay counter
[7:4]   <= Encoded bits for NES button control
[3}     <= NES Latch signal
[2]     <= NES clock(pulse) signal
[1:0]   <= ctrl bits for the NES counter

     
State           Count_ctrl(NES_delay_counter)       Data_read           Latch_enb       Clock_enb       Count_ctrl (NES_counter)
                00 - hold                           0000 - none         0 - disable     0 - disable     00 - hold
                01 - increment                      0001 - A            1 - enable      1 - enable      01 - increment
                11 - synch reset                    0010 - B                                            11 - asynch reset
                                                    0011 - Select
                                                    0100 - Start
                                                    0101 - Up
                                                    0110 - Down
                                                    0111 - Left
                                                    1000 - Right                            


Reset           01                                  0000                0               0               11           
Latch1          00                                  0000                1               0               01
Latch2          00                                  0000                1               0               01
A_low           00                                  0001                0               0               01
B_low           00                                  0010                0               0               01
B_hi            00                                  0000                0               1               01
Select_low      00                                  0011                0               0               01
Select_hi       00                                  0000                0               1               01
Start_low       00                                  0100                0               0               01
Start_hi        00                                  0000                0               1               01
Up_low          00                                  0101                0               0               01
Up_hi           00                                  0000                0               1               01
Down_low        00                                  0110                0               0               01
Down_hi         00                                  0000                0               1               01
Left_low        00                                  0111                0               0               01
Left_hi         00                                  0000                0               1               01
Right_low       00                                  1000                0               0               01
Right_h         00                                  0000                0               0               01
****************************************************************************************************************************/
assign cw_NESController = 
    (state_NESController == Reset)      ? 10'b01_0000_0_0_11 :
    (state_NESController == Latch1)     ? 10'b00_0000_1_0_01 :
    (state_NESController == Latch2)     ? 10'b00_0000_1_0_01 :
    (state_NESController == A_low)      ? 10'b00_0001_0_0_01 :
    (state_NESController == B_hi)       ? 10'b00_0000_0_1_01 :
    (state_NESController == B_low)      ? 10'b00_0010_0_0_01 :
    (state_NESController == Select_hi)  ? 10'b00_0000_0_1_01 :
    (state_NESController == Select_low) ? 10'b00_0011_0_0_01 :
    (state_NESController == Start_hi)   ? 10'b00_0000_0_1_01 :
    (state_NESController == Start_low)  ? 10'b00_0100_0_0_01 :
    (state_NESController == Up_hi)      ? 10'b00_0000_0_1_01 :
    (state_NESController == Up_low)     ? 10'b00_0101_0_0_01 :
    (state_NESController == Down_hi)    ? 10'b00_0000_0_1_01 :
    (state_NESController == Down_low)   ? 10'b00_0110_0_0_01 :
    (state_NESController == Left_hi)    ? 10'b00_0000_0_1_01 :
    (state_NESController == Left_low)   ? 10'b00_0111_0_0_01 :
    (state_NESController == Right_hi)   ? 10'b00_0000_0_1_01 :
    (state_NESController == Right_low)  ? 10'b00_1000_0_0_01 :
    (state_NESController == Pulse_hi)   ? 10'b00_0000_0_1_01 :
                                          10'b00_0000_0_0_01;
                                          
endmodule
