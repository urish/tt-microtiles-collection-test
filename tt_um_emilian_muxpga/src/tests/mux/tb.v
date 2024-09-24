`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input        clk,
    input        rst,
    input [3:0]  io_in,
    input [1:0]  cmd,
    output [7:0] io_out
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {cmd, io_in, rst, clk};
    wire [7:0] outputs;
    assign io_out = outputs[7:0];

    // instantiate the DUT
    diferential_muxpga diferential_muxpga(
        `ifdef GL_TEST
            .vccd1( 1'b1),
            .vssd1( 1'b0),
        `endif
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
