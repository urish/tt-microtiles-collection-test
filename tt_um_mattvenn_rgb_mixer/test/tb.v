`default_nettype none `timescale 1ns / 1ps

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
  reg [7:0] uio_in;
  wire [7:0] uio_out;
  wire [1:0] debug_mode;
  wire [7:0] uo_out;
  wire [7:0] uio_oe;

  reg enc0_a, enc0_b, enc1_a, enc1_b, enc2_a, enc2_b;
  wire pwm0_out, pwm1_out, pwm2_out;
  assign pwm2_out = uo_out[2];
  assign pwm1_out = uo_out[1];
  assign pwm0_out = uo_out[0];
  wire [7:0] debug_enc = uio_out;

  // Replace tt_um_example with your module name:
  tt_um_mattvenn_rgb_mixer tt_um_mattvenn_rgb_mixer (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  ({debug_mode, enc2_b, enc2_a, enc1_b, enc1_a, enc0_b, enc0_a}),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

endmodule
