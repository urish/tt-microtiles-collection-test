/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module debug_controller (
    input wire clk,
    input wire rst_n,
    input wire debug_en,
    input wire [7:0] uio_in,
    output reg [7:0] uio_out,
    output reg [7:0] uio_oe,
    input wire [63:0] grid_in,

    output reg grid_out_valid,
    output reg [3:0] grid_out_addr,
    output reg [3:0] grid_out_data,

    output reg [3:0] force_move
);

  wire [3:0] debug_cmd = uio_in[3:0];
  wire [3:0] data_in = uio_in[7:4];

  reg data_out_en;
  reg [3:0] data_out;
  reg [3:0] grid_addr;

  localparam CMD_READ = 1;
  localparam CMD_WRITE = 2;
  localparam CMD_SET_ADDR = 3;
  localparam CMD_FORCE_MOVE = 4;

  assign uio_out = {data_out, 4'b0000};
  assign uio_oe  = {{data_out_en ? 4'b1111 : 4'b0000}, 4'b0000};


  always @(posedge clk) begin
    if (~rst_n) begin
      data_out <= 0;
      data_out_en <= 0;
      grid_addr <= 0;
      grid_out_valid <= 0;
      grid_out_addr <= 0;
      grid_out_data <= 0;
      force_move <= 0;
    end else begin
      data_out_en <= 0;
      grid_out_valid <= 0;
      force_move <= 0;

      case (debug_en ? debug_cmd : 0)
        CMD_READ: begin
          data_out_en <= 1;
          data_out <= grid_in[grid_addr*4+:4];
          grid_addr <= grid_addr + 1;
        end
        CMD_WRITE: begin
          grid_out_data <= data_in;
          grid_out_addr <= grid_addr;
          grid_out_valid <= 1;
          grid_addr <= grid_addr + 1;
        end
        CMD_SET_ADDR: begin
          grid_addr <= data_in;
        end
        CMD_FORCE_MOVE: begin
          force_move <= data_in;
        end
        default: begin
        end
      endcase
    end
  end

endmodule
