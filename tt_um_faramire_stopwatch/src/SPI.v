/*
 * Copyright (c) 2024 Fabio Ramirez Stern
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module SPI_driver (
  input wire clk, // 1 MHz clock to run the FSM and other loops
  input wire clk_div, // 100 Hz clock to trigger a time to be send out
  input wire res, // reset, active low
  input wire ena,

  input wire skip_setup, // high => do not send setup packages

  input wire [2:0] min_X0, // minutes
  input wire [3:0] min_0X,
  input wire [2:0] sec_X0, // seconds
  input wire [3:0] sec_0X,
  input wire [3:0] ces_X0, // centiseconds (100th)
  input wire [3:0] ces_0X,

  output wire  Cs,
  output wire Sclk,
  output wire Mosi
);

  // FSM
  reg [3:0] state;
  localparam SETUP_TST = 4'b0000;
  localparam SETUP_SCN = 4'b0001;
  localparam SETUP_LUX = 4'b0010;
  localparam SETUP_BCD = 4'b0011;
  localparam SETUP_PWR = 4'b0100;
  localparam IDLE      = 4'b0101;
  localparam TRANSFER  = 4'b0110;
  localparam WAIT      = 4'b0111;
  localparam DONE      = 4'b1000;

  reg [15:0] word_out;
  reg [2:0] digit_count;
  reg [3:0] wait_count;
  wire ready_reported; // master module reports that it is ready to transmit the next word
  reg reset_master; // reset the master module
  reg send_order; // orders the master module to send a word via SPI
  reg sent_TST; // flags to track setup states
  reg sent_SCN;
  reg sent_LUX;
  reg sent_BCD;
  reg sent_PWR;

  always @(posedge clk) begin  // controlling FSM
    if (!res) begin // active low reset
      reset_master <= 0;
      send_order <= 0;
      word_out <= 16'b0;
      digit_count <= 3'b0;
      sent_TST <= 0;
      sent_SCN <= 0;
      sent_LUX <= 0;
      sent_BCD <= 0;
      sent_PWR <= 0;
      if (skip_setup) begin
        state <= IDLE;
      end else begin
        state <= SETUP_TST;
      end
    end

    case(state)

      SETUP_TST: begin // disable test mode
        if (res) begin
          reset_master <= 1;
          if (!sent_TST) begin
            if (ready_reported) begin
              word_out <= 16'b0000_1111_0000_0000; // address = test mode, data = disable (normal mode)
              send_order <= 1;
              sent_TST <= 1;
            end
          end else begin
            send_order <= 0;
            if (ready_reported) begin
              state <= SETUP_SCN;
            end
          end
        end
      end // SETUP_TST

      SETUP_SCN: begin // send a setup packet enabling 6 digits
        if (!sent_SCN) begin
          if (ready_reported) begin
            word_out <= 16'b0000_1011_0000_0101; // address = scan limit, data = scan digits 0-5
            send_order <= 1;
            sent_SCN <= 1;
          end
        end else begin
          send_order <= 0;
          if (ready_reported) begin
            state <= SETUP_LUX;
          end
        end
      end // SETUP_SCN

      SETUP_LUX: begin // set intensity (brightness)
        if (!sent_LUX) begin
          if (ready_reported) begin
            word_out <= 16'b0000_1010_0000_0101; // address = intensity, data = 11/32
            send_order <= 1;
            sent_LUX <= 1;
          end
        end
        else begin
          send_order <= 0;
          if (ready_reported) begin
            state <= SETUP_BCD;
          end
        end
      end // SETUP_LUX

      SETUP_BCD: begin // send a setup packet enabling BCD
        if (!sent_BCD) begin
          if (ready_reported) begin
            word_out <= 16'b0000_1001_0011_1111; // address = decode mode, data = BCD for digits 0-5
            send_order <= 1;
            sent_BCD <= 1;
          end
        end
        else begin
          send_order <= 0;
          if (ready_reported) begin
            state <= SETUP_PWR;
          end
        end
      end // SETUP_BCD

      SETUP_PWR: begin // send a setup packet leaving shutdown mode
        if (!sent_PWR) begin
          if (ready_reported) begin
            word_out <= 16'b0000_1100_0000_0001; // address = shutdown mode, data = device on
            send_order <= 1;
            sent_PWR <= 1;
          end
        end else begin
          send_order <= 0;
          if (ready_reported) begin
            state <= IDLE;
          end
        end
      end // SETUP_PWR
      

      IDLE: begin // wait for the 100Hz clock do initiate an update of all digits
        if (clk_div & ena) begin
          digit_count <= 3'b000;
          wait_count <= 4'b0000;
          state <= TRANSFER;
        end
      end // IDLE

      TRANSFER: begin
        if (ready_reported == 1) begin // wait for TX ready
          case(digit_count)

            3'b000: begin // ces_0X
              word_out <= {8'b0000_0001, 8'b0000_0000 | {4'b0000, ces_0X}}; // send the 16-bit word
              send_order <= 1; // order master to send data
              digit_count <= 3'b001; // advance the position counter
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b001: begin // ces_X0
              word_out <= {8'b0000_0010, 8'b0000_0000 | {4'b0000, ces_X0}};
              send_order <= 0;
              digit_count <= 3'b010;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b010: begin // sec_0X
              word_out <= {8'b0000_0011, 8'b1000_0000 | {4'b0000, sec_0X}};
              send_order <= 0;
              digit_count <= 3'b011;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b011: begin // sec_X0
              word_out <= {8'b0000_0100, 8'b0000_0000 | {5'b00000, sec_X0}};
              send_order <= 0;
              digit_count <= 3'b100;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b100: begin // min_0X
              word_out <= {8'b0000_0101, 8'b1000_0000 | {4'b0000, min_0X}};
              send_order <= 0;
              digit_count <= 3'b101;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b101: begin // min_X0
              word_out <= {8'b0000_0110, 8'b0000_0000 | {5'b00000, min_X0}};
              send_order <= 0;
              digit_count <= 3'b110;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b110: begin // once send has been complete and CS is high again, switch state
              state <= DONE;
            end

            default:digit_count <= 3'b000;
          endcase

        end
      end // TRANSFER

      WAIT: begin
        send_order <= 0; // STEP 1: pull order down again
        if (wait_count == 4'b1111) begin // STEP 4: go back to transfer to send next packet
          state <= TRANSFER;
        end else if (ready_reported) begin // STEP 2: wait until SPI master is done
          wait_count <= wait_count + 1'b1; // STEP 3: count up
        end
      end // WAIT

      DONE: begin // wait for the 100 Hz clock to go low again
        if (!clk_div && ready_reported) begin
          state <= IDLE;
        end
      end // DONE

      default:state <= SETUP_PWR;
    endcase    
  end

  SPI_Master SPI_Master1 (
    .clk(clk),
    .res(reset_master),
    .send_order(send_order),
    .word_in(word_out),

    .cs(Cs),
    .sclk(Sclk),
    .mosi(Mosi),
    .report_ready(ready_reported)
  );

endmodule // SPI_wrapper

module SPI_Master (
  input wire clk,
  input wire res,
  input wire send_order,
  input wire [15:0] word_in, // word to be sent

  output reg cs,             // Chip Select
  output reg sclk,            // serial clock
  output reg mosi,           // MOSI
  output reg report_ready    // ready for next transmission
);

  // FSM states
  localparam IDLE = 2'b00;
  localparam SEND = 2'b01;
  localparam WAIT = 2'b10;

  reg  [1:0] state;
  reg  [1:0] count_bit;  // count through the clock cylce: 00 pull low (set), 01 hold low, 10 pull high (sample), 11 hold high
  reg  [3:0] count_word; // count through the bits of the word
  reg [15:0] word_out;


  always @(posedge clk) begin
    if (!res) begin // reset, active low
      cs <= 1;
      sclk <= 0;
      mosi <= 0;
      report_ready <= 0; // goes high when CS is high and reset is complete
      state <= IDLE;
    end else begin

      case(state) // FSM

        IDLE: begin
          if (res) begin
            if (send_order == 0) begin
              report_ready <= 1;
            end
            else begin // order to send the word
              report_ready <= 0;
              count_bit <= 0;
              count_word <= 15;
              word_out <= word_in;
              cs <= 0;
              state <= SEND;
            end
          end 
        end // IDLE

        SEND: begin
          case(count_bit)

            2'b00: begin // pull low
              sclk <= 1'b0;
              count_bit <= 2'b01;

              mosi <= word_out[15];
              word_out <= word_out << 1;

              // alternative:
              /* mosi <= word_out[count_word];
              count_word <= count_word - 1; */
            end

            2'b01: begin // hold low
              sclk <= 1'b0;
              count_bit <= 2'b10;
            end

            2'b10: begin // pull high
              sclk <= 1'b1;
              count_bit <= 2'b11;
            end

            2'b11: begin // hold high
              sclk <= 1'b1;
              count_bit <= 2'b00;

              if (count_word == 0) begin // end of word? exit
                state <= WAIT;
              end else begin
                count_word <= count_word - 1; // this is here so that once it goes 0, one clock cycle is still executed
              end
            end

            default:;
          endcase
        end // SEND

        WAIT: begin // pull everything idle
          cs <= 1;
          sclk <= 0;
          mosi <= 0;
          state <= IDLE;
        end // DONE

        default:;
      endcase
    end
  end

endmodule
