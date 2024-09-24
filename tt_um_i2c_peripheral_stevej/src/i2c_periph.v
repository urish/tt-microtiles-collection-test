`ifndef _I2C_PERIPH_
`define _I2C_PERIPH_

`default_nettype none `timescale 1us / 100 ns

`include "byte_transmitter.v"
`include "byte_receiver.v"
`include "mux_2_1.v"

module i2c_periph (
    input clk,  // using SCL for our clock.
    input reset,
    input read_channel,
    output reg [7:0] direction,  // set to the correct mask before using write_channel
    output write_channel
);

  localparam [3:0] Stop = 4'b0001;  // 1
  localparam [3:0] AddressAndRw = 4'b0011;  // 3
  localparam [3:0] WriteBuffer = 4'b1001;  // 9
  localparam [3:0] Reset = 4'b1010;  // 10
  localparam [3:0] BadAddress = 4'b1011;  // 11

  localparam [7:0] ReadMask = 8'b0000_0000;
  localparam [7:0] WriteMask = 8'b0010_0000;  // 20

  reg [3:0] current_state;
  reg last_sda;
  reg [6:0] address;  // device address decoded from SDA line
  // Keeps track of how many bytes have been written or read.
  reg [3:0] byte_count;
  reg [7:0] transmitter_byte_buffer;
  reg [7:0] receiver_byte_buffer;
  reg read_request;
  reg transmitter_channel;
  reg ack_channel;
  reg [7:0] bad_address;

  reg r_output_selector_transmitter;  // 1 means transmitter, 0 means send an ack
  mux_2_1 output_mux (
      .one(transmitter_channel),
      .two(ack_channel),
      .selector(r_output_selector_transmitter),
      .out(write_channel)
  );

  reg byte_receiver_enable;
  byte_receiver byte_receiver (
      .clk(clk),
      .reset(reset),
      .enable(byte_receiver_enable),
      .in(read_channel),
      .out(receiver_byte_buffer)
  );

  reg byte_transmitter_enable;
  byte_transmitter byte_transmitter (
      .clk(clk),
      .reset(reset),
      .enable(byte_transmitter_enable),
      .in(transmitter_byte_buffer),
      .out(transmitter_channel)
  );

  reg [7:0] one_zero;
  reg [7:0] zero_one;

  always @(posedge clk) begin
    if (reset) begin
      r_output_selector_transmitter <= 1;
      read_request <= 0;
      direction <= ReadMask;
      current_state <= Stop;
      last_sda <= 0;
      byte_count <= 0;
      transmitter_byte_buffer <= 8'b0000_0000;
      byte_receiver_enable <= 0;
      byte_transmitter_enable <= 0;
      address <= 7'b000_0000;
      one_zero <= 8'b1010_1010;
      zero_one <= 8'b0101_0101;
      bad_address <= 8'b1100_1100;
    end else begin
      case (current_state)
        Stop: begin
          if (last_sda == 0 && read_channel == 1) begin
            current_state <= AddressAndRw;
          end else begin
            current_state <= Stop;
          end
        end
        AddressAndRw: begin
          byte_receiver_enable <= 1;
          if (byte_count < 8) begin
            byte_count <= byte_count + 1;
          end else begin
            direction <= WriteMask;
            r_output_selector_transmitter <= 0;
            ack_channel <= 1;  // sending ACK
            r_output_selector_transmitter <= 1;
            address <= receiver_byte_buffer[7:1];
            read_request <= receiver_byte_buffer[0];
            byte_receiver_enable <= 0;
            if (read_request) begin
              case (address)
                7'h2A: begin  // This is our ZeroOnePeriph peripheral.
                  direction <= WriteMask;
                  transmitter_byte_buffer <= zero_one;
                  byte_transmitter_enable <= 1;
                  byte_count <= 0;
                  current_state <= WriteBuffer;
                end
                7'h55: begin
                  direction <= WriteMask;
                  transmitter_byte_buffer <= one_zero;
                  byte_transmitter_enable <= 1;
                  byte_count <= 0;
                  current_state <= WriteBuffer;
                end
                default: begin  // Bad Address
                  direction <= WriteMask;
                  transmitter_byte_buffer <= bad_address;
                  byte_transmitter_enable <= 1;
                  byte_count <= 0;
                  current_state <= WriteBuffer;
                end
              endcase
            end
          end
        end
        WriteBuffer: begin
          if (byte_count == 7) begin
            byte_transmitter_enable <= 0;
            current_state <= Stop;
          end else begin
            byte_count <= byte_count + 1;
          end
        end
        BadAddress: begin
          current_state <= Stop;
        end
        Reset: begin
          address <= 7'b000_0000;
          current_state <= Stop;
        end
        default: current_state <= Stop;
      endcase
      last_sda <= read_channel;
    end
  end
endmodule
`endif
