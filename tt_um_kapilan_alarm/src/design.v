`default_nettype none

// Code your design here
module tt_um_kapilan_alarm (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

wire [5:0] minutes_out;
tt_um_ClockAlarm my_alarm(
  .clk(clk),
  .rst_n(rst_n),
  .alarm_hours(ui_in[4:0]),
  .alarm_minutes({uio_in[2:0], ui_in[7:5]}), 
   //output
  .hours(uo_out[4:0]),
  .minutes(minutes_out),
  .alarm(uio_out[7])  
);

assign uio_oe = 8'b1111_0000;
assign uo_out[7:5] = minutes_out[2:0];
assign uio_out[6:4] = minutes_out[5:3];
assign uio_out[3:0] = 4'b0;
    
wire _unused = & {uio_in[7:3], ena};
endmodule

