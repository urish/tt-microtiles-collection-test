//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TinyTapeout 8
// Engineer: Brandon S. Ramos
// 
// Create Date: 07/11/2024 07:59:27 PM
// Design Name: 
// Module Name: counter.v
// Project Name: VGA Pong with NES Controllers
// Target Devices: 
// Tool Versions: 
// Description: Generic counter
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Counter #(
    parameter countLimit = 1024,
    parameter WIDTH = $clog2(countLimit))( 
    
    input wire clk,
    input wire reset_n,
    
    input wire [1:0] ctrl,
    output wire roll,
    output wire [WIDTH-1:0] Q);

//Intermediate signal
reg [WIDTH-1:0] processQ; //width of signal set by VGA timing 640x480 (total: row 800; col 525)

always @(posedge clk) begin
    if (reset_n == 1'b0)
        processQ <= 0;
    else begin
        if(ctrl == 2'b11)
            processQ <= 0;
        else if ((processQ < countLimit) && (ctrl == 2'b01))
            processQ <= processQ + 1;
        else if ((processQ == countLimit) && (ctrl == 2'b01))
            processQ <= 0; 
    end
end
            
assign Q = processQ;
assign roll = (processQ == (countLimit)) ? 1'b1 : 1'b0;

endmodule
