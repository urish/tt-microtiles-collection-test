module tb_i2c ();

  reg clk;
  wire SDA;
  wire SCL;
  reg [7:0] uio_oe;
  wire reset;
  reg r_reset;
  assign reset = r_reset;

  pullup (SDA);
  pullup (SCL);

  reg [6:0] addressToSend = 7'b010_1010;  // 0x55
  reg readWrite = 1'b1;  // 1 is read, 0 is write
  reg [7:0] dataToSend = 8'b0110_0111;  // 103 = 0x67
  reg [7:0] test_data = 8'b0101_0101;  // data to compare with
  integer ii = 0;

  initial begin
    force SDA = 1;
    r_reset <= 0;
    clk = 0;
    force SCL = clk;
    forever begin
      clk = #1 ~clk;
      force SCL = clk;
    end
  end

  i2c_periph i2c_periph (
      .clk(SCL),
      .reset(reset),
      .read_channel(SDA),
      .direction(uio_oe),
      .write_channel(SDA)
  );

  initial begin
    $display("Starting Testbench...");

    force r_reset = 1;
    clk = 0;
    force SCL = clk;

    #5 force r_reset = 0;

    // Set SDA Low to start
    #2 force SDA = 0;
    // Write address
    /*
    for (ii = 0; ii < 7; ii = ii + 1) begin
      $display("Address SDA %h to %h", SDA, addressToSend[ii]);
      #2 force SDA = addressToSend[ii];
    end */

    // for some reason, our timing is off with what we are sending!
    #2 force SDA = 0;
    #2 force SDA = 1;
    #2 force SDA = 0;
    #2 force SDA = 1;

    #2 force SDA = 0;
    #2 force SDA = 1;
    #2 force SDA = 0;
    #2 force SDA = 1;

    // Are we wanting to read or write to/from the device?
    $display("Read/Write %h SDA: %h", readWrite, SDA);
    #2 force SDA = readWrite;

    // Next SDA will be driven by slave, so release it
    release SDA;

    $display("SDA: %h", SDA);
    #3

    for (ii = 0; ii < 8; ii = ii + 1) begin
      //$display("Data SDA %h to %h", SDA, dataToSend[ii]);
      //#3 force SDA = dataToSend[ii];
      #2 $display("SDA is %h", SDA);
      test_data[ii] = SDA;
    end

    if (test_data != 8'h55) begin
      $display("ASSERTION FAILED data not equal: %h != %h", test_data, 8'h55);
      $finish();
    end

    #2;  // Wait for ACK bit

    // Next SDA will be driven by slave, so release it
    release SDA;

    // Force SDA high again, we are done
    #2 force SDA = 1;

    $finish();
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

endmodule
