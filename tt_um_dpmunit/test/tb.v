`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  wire [7:0] ui_in;
  wire [7:0] uio_in;
  reg [7:0] ui_in_reg;
  reg [7:0] uio_in_reg;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Replace tt_um_example with your module name:
  tt_um_dpmunit user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

  // Assign values to the wire type inout signals
  assign ui_in = ui_in_reg;
  assign uio_in = uio_in_reg;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end

  initial begin
    rst_n = 0;  
    ui_in_reg = 8'b11110010;
    #10;
    rst_n = 1;  
    #10;
    ui_in_reg = 8'b00010010; // 
    #20; 
    ui_in_reg = 8'b11110010; // 
    #20; 
    ui_in_reg = 8'b11110011; // 
    #20;
    ui_in_reg = 8'b11110010; // 
    #20;
    ui_in_reg = 8'b11101010; // 
    #20;
    ui_in_reg = 8'b11111010; // 
    #20;
    ui_in_reg = 8'b11111110; // 
    #20;
    ui_in_reg = 8'b11111010; // 

    #20;
    #10;
    $stop;
  end

  initial begin
    $monitor("Time=%0d | ui_in=%b, uio_out=%b | uo_out=%b", $time, ui_in, uio_out, uo_out);
  end

endmodule
