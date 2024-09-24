// Code your design here
module tt_um_ClockAlarm(
  input wire clk,
  input wire rst_n,
  input wire [4:0] alarm_hours,
  input wire [5:0] alarm_minutes, 
  
  //Output time in the clock
  output reg [4:0] hours,
  output reg [5:0] minutes, 
  output reg alarm
);

  reg [5:0] seconds;
  
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
          hours <= 0;
          minutes <= 0;
          seconds <= 0;
          alarm <= 1'b0;
     end else if (alarm == 0) begin
          seconds <= seconds + 6'd1;
     
     if (seconds == 6'd59) begin
          seconds <= 6'd0;
          minutes <= minutes + 6'd1;
     end

    if (minutes == 6'd59 && seconds == 6'd59) begin
          minutes <= 6'd0;
          hours <= hours + 5'd1;
    end

    if (hours == 5'd23 && minutes == 6'd59 && seconds == 6'd59) begin
          hours <= 5'd0;
    end

    if ((hours == alarm_hours) && (minutes == alarm_minutes)) begin
               alarm <= 1'b1; 
    end 
  end
  end
  
endmodule
