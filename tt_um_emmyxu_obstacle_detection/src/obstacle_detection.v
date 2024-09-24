module obstacle_detection(
  input wire reset,
  input wire sensor_left, // input from left sensor
  input wire sensor_right, // input from right sensor
  output reg [1:0] left_buzz, // 2-bit output for left buzz (00: off, 01: both close, 10: close)
  output reg [1:0] right_buzz // 2-bit output for right buzz (00: off, 01: both close, 10: close)
);
  
  parameter THRESHOLD = 1;
  
  always @(*) begin
    if (reset) begin
      // When reset is active, turn off both buzzers
      left_buzz = 2'b00;
      right_buzz = 2'b00;
    end else begin
      // Default state: both buzzers off
      left_buzz = 2'b00;
      right_buzz = 2'b00;
      
      // Check left sensor close and right sensor close, activates opposite buzzer to closest
      if (sensor_left == THRESHOLD && sensor_right == THRESHOLD) begin
        left_buzz = 2'b01;
        right_buzz = 2'b01;
      end
      
      // Check left sensor close and right sensor far, activates right buzzer
      if (sensor_left == THRESHOLD && sensor_right != THRESHOLD) begin
        right_buzz = 2'b10;
      end
      
      // Check right sensor close and left sensor far, activates left buzzer
      if (sensor_right == THRESHOLD && sensor_left != THRESHOLD) begin
        left_buzz = 2'b10;
      end
    end
  end

endmodule
