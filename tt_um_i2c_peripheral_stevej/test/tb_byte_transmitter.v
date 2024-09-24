`default_nettype none

module tb_byte_transmitter ();

  reg clk;
  wire reset;
  reg [7:0] byte_buffer;
  reg [3:0] byte_count;
  reg transmitter_enable;
  wire out;

  reg r_out;
  assign out = r_out;
  reg r_reset;
  assign reset = r_reset;

  reg [7:0] test_data;

  initial begin
    clk <= 0;
    r_reset <= 0;
    r_out <= 0;
    test_data <= 8'b0000_0000;  // results from byte_transmitter
    byte_buffer <= 8'b0101_0101;  // data to write
    byte_count <= 3'b000;
    transmitter_enable <= 0;
    forever begin
      #1 force clk = ~clk;
    end
  end

  byte_transmitter transmitter (
      .clk(clk),
      .reset(reset),
      .enable(transmitter_enable),
      .in(byte_buffer),
      .out(out)
  );

  integer index = 0;
  initial begin
    $display("tb_byte_receiver starting");
    force r_reset = 1;
    force clk = 0;
    #2;
    force r_reset = 0;
    force clk = 1;
    force transmitter_enable = 1;

    for (index = 0; index <= 7; index = index + 1) begin
      #1 test_data[index] = out;
      //$display("out: %h", out);
      #1 $display("test_data[%h] = %h", index, test_data[index]);
    end

    if (byte_buffer != test_data) begin
      $display("ASSERTION FAILED in %m: signal %h != value %h ", byte_buffer, test_data);
      $finish;
    end
    #20 $finish();
  end


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

endmodule
