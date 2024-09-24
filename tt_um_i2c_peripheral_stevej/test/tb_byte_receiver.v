`default_nettype none

module tb_byte_receiver ();

  reg clk;
  wire reset;
  reg [7:0] byte_buffer;
  reg [3:0] byte_count;
  reg receiver_enable;
  wire in;

  reg r_in;
  assign in = r_in;
  reg r_reset;
  assign reset = r_reset;

  reg [7:0] test_data;

  initial begin
    clk <= 0;
    r_reset <= 0;
    r_in <= 0;
    test_data <= 8'b0101_0101;
    //byte_buffer <= 8'b0000_0000;
    byte_count <= 3'b000;
    receiver_enable <= 0;
    forever begin
      #1 force clk = ~clk;
    end
  end

  byte_receiver receiver (
      .clk(clk),
      .reset(reset),
      .enable(receiver_enable),
      .in(in),
      .out(byte_buffer)
  );

  integer index = 0;
  initial begin
    $display("tb_byte_receiver starting");
    force r_reset = 1;
    clk = 0;
    #2;
    force r_reset = 0;
    force receiver_enable = 1;

    for (index = 0; index < 8; index = index + 1) begin
      $display("writing bit to in: %h, %h", r_in, test_data[index]);
      #2 r_in = test_data[index];
    end

    if (byte_buffer != test_data) begin
      $display("ASSERTION FAILED in %m: signal %h != value %h ", byte_buffer, test_data);
      $finish;
    end
    $finish();
  end


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

endmodule
