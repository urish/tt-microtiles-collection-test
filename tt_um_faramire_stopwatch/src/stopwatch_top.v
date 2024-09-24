/*
 * Copyright (c) 2024 Fabio Ramirez Stern
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none
`include "SPI.v"

module tt_um_faramire_stopwatch (
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // will go high when the design is enabled
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
 );
  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign uo_out[7:5] = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[7:4], uio_in[7:0], 1'b0};

  wire dividedClock; // 100 Hz clock
  wire counter_enable;
  wire display_enable;
  wire reset_either; // an OR of the input reset and the chip wide reset, for those that shall be affected by both
  wire reset_either_async;
  //wire clock_enabled; // and AND of the clock with the counter enable,
                     // so that the clock divider doesn't advance when the counters are halted

  assign reset_either = rst_n | (~ui_in[2]);
  assign reset_either_async = rst_n | (~ui_in[2]);
  //assign clock_enabled = counter_enable && clk;

  wire [2:0] w_min_X0; // all the results of the counter chain
  wire [3:0] w_min_0X;
  wire [2:0] w_sec_X0;
  wire [3:0] w_sec_0X;
  wire [3:0] w_ces_X0;
  wire [3:0] w_ces_0X;

  clockDivider clockDivider1 ( // divides the 1 MHz clock to 100 Hz
    .clk_in  (clk),
    .ena     (counter_enable),
    .res     (reset_either),
    .clk_out (dividedClock)
  );

  controller controller1 ( // two latches for starting/stopping and lap times
    .res        (rst_n),
    .clk        (clk),
    .start_stop (ui_in[0]),
    .lap_time   (ui_in[1]),
    .counter_enable (counter_enable),
    .display_enable (display_enable)
  );

  assign uo_out[3] = counter_enable; // output the internal state
  assign uo_out[4] = display_enable;

  counter_chain counter_chain1 ( // a chain of 6 counters that count from 00:00:00 to 59:59:99
    .clk (dividedClock),
    .ena (counter_enable),
    .res (reset_either_async),
    .min_X0 (w_min_X0),
    .min_0X (w_min_0X),
    .sec_X0 (w_sec_X0),
    .sec_0X (w_sec_0X),
    .ces_X0 (w_ces_X0),
    .ces_0X (w_ces_0X)
  );

  SPI_driver SPI_driver1 (
    .clk (clk),
    .clk_div(dividedClock),
    .res (rst_n),
    .ena (display_enable),
    .skip_setup (ui_in[3]),
    .min_X0 (w_min_X0),
    .min_0X (w_min_0X),
    .sec_X0 (w_sec_X0),
    .sec_0X (w_sec_0X),
    .ces_X0 (w_ces_X0),
    .ces_0X (w_ces_0X),
    .Mosi (uo_out[0]), // MOSI on out 0
    .Cs   (uo_out[1]), //  CS  on out 1
    .Sclk (uo_out[2])  //  CLK on out 3
  );



endmodule // tt_um_faramire_stopwatch

module clockDivider (
  input wire clk_in, // input clock 1 MHz
  input wire ena,
  input wire res,    // reset, active low
  output reg clk_out // output clock 100 Hz
);

  reg[13:0] counter;
  parameter div     = 5000; // 1 MHz / 10'000 = 100 Hz, 50% duty cycle => 1/2 of that


  always @(posedge clk_in) begin
    if (!res) begin // reset
      counter <= 14'b0;
      clk_out <= 1'b0;
    end else if (ena) begin
      if (counter < (div-1)) begin    // count up
        counter <= counter + 1;
      end else begin                  // reset counter and invert output
        counter <= 14'b0;
        clk_out <= ~clk_out; 
      end
    end
  end

endmodule //clockDivider

module controller (
  input  wire res,            // reset, active low
  input  wire clk,
  input  wire start_stop,     // impulse toggles counter_enable
  input  wire lap_time,       // impulse toggles display_enable
  output reg  counter_enable, // 
  output reg  display_enable  //
);

  always @(posedge clk) begin
    if (!res) begin
      counter_enable <= 1'b0;
    end else if(start_stop) begin
      counter_enable <= ~counter_enable;
    end
  end

  always @(posedge clk) begin
    if (!res) begin
      display_enable <= 1'b1;
    end else if (lap_time) begin
        display_enable <= ~display_enable;
    end
  end
  
endmodule // controller

module counter6 (
  input  wire      clk, // clock
  input  wire      ena, // enable
  input  wire      res, // reset, active low
  output reg       max, // high when max value (6) reached
  output reg [2:0] cnt  // 3 bit counter output
);

parameter max_count = 6;

  always @(posedge clk) begin
    if (!res) begin
      cnt <= 3'b0;
      max <= 1'b0;
    end else if (ena) begin
      if (cnt < (max_count-1)) begin
        cnt <= cnt + 1;
      end else begin
        cnt <= 3'b0;
      end

    if (cnt == max_count-2) begin
        max <= 1'b1;
      end else begin
        max <= 1'b0;
      end
    end
  end

endmodule // counter6

module counter10 (
  input  wire      clk, // clock
  input  wire      ena, // enable
  input  wire      res, // reset, active low
  output reg       max, // high when max value (10) reached
  output reg [3:0] cnt  // 3 bit counter output
);

  parameter max_count = 10;

  always @(posedge clk) begin
    if (!res) begin
      cnt <= 4'b0;
      max <= 1'b0;
  end else if (ena) begin
      if (cnt < (max_count-1)) begin
        cnt <= cnt + 1;
      end else begin
        cnt <= 4'b0;
      end

    if (cnt == max_count-2) begin
        max <= 1'b1;
      end else begin
        max <= 1'b0;
      end
    end
  end

endmodule // counter10

module counter_chain (
  input wire clk,
  input wire ena,
  input wire res,
  // the X denotes which digit the counter drives
  output wire [3:0] ces_0X, // centiseconds (100th)
  output wire [3:0] ces_X0,
  output wire [3:0] sec_0X, // seconds
  output wire [2:0] sec_X0,
  output wire [3:0] min_0X, // minutes
  output wire [2:0] min_X0
);

  wire ces_X0_ena;
  wire sec_0X_ena;
  wire sec_X0_ena;
  wire min_0X_ena;
  wire min_X0_ena;

  wire max; // just something to connect the unused max pin of the last counter to something

  counter10 inst_ces_0X ( // counts first digit centiseconds
    .clk (clk), // clock in
    .ena (ena), // enable
    .res (res),  // reset
    .max (ces_X0_ena), // reached max value, used as enable for the next counter
    .cnt (ces_0X) // output value
  );

  counter10 inst_ces_X0 ( // counts second digit centiseconds
    .clk (clk),
    .ena (ena & ces_X0_ena),
    .res (res),
    .max (sec_0X_ena),
    .cnt (ces_X0)
  );

  counter10 inst_sec_0X ( // counts first digit seconds
    .clk (clk),
    .ena (ena & ces_X0_ena & sec_0X_ena),
    .res (res),
    .max (sec_X0_ena),
    .cnt (sec_0X)
  );

  counter6 inst_sec_X0 ( // counts second digit seconds
    .clk (clk),
    .ena (ena & ces_X0_ena & sec_0X_ena & sec_X0_ena),
    .res (res),
    .max (min_0X_ena),
    .cnt (sec_X0)
  );

  counter10 inst_min_0X ( // counts single digit minutes
    .clk (clk),
    .ena (ena & ces_X0_ena & sec_0X_ena & sec_X0_ena & min_0X_ena),
    .res (res),
    .max (min_X0_ena),
    .cnt (min_0X)
  );

  counter6 inst_min_X0 ( // counts second digit minutes
    .clk (clk),
    .ena (ena & ces_X0_ena & sec_0X_ena & sec_X0_ena & min_0X_ena & min_X0_ena),
    .res (res),
    .max (max),
    .cnt (min_X0)
  );

endmodule // counter_chain
