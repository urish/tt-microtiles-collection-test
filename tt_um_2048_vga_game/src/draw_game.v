/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module draw_game (
    input wire [63:0] grid,
    input wire [9:0] x,
    input wire [9:0] y,
    input wire debug_mode,
    output reg [5:0] rrggbb
);

  localparam CELL_SIZE = 64;

  wire [9:0] board_x = x - 128;
  wire [9:0] board_y = y - 128;
  wire [1:0] cell_x = board_x[7:6];
  wire [1:0] cell_y = board_y[7:6];
  wire [5:0] cell_offset = {cell_y, cell_x, 2'b00};
  wire [3:0] current_number = grid[cell_offset+:4];

  // Determine if we're on the outline
  wire is_outline_x = (x % CELL_SIZE == 0 || x % CELL_SIZE == (CELL_SIZE - 1));
  wire is_outline_y = (y % CELL_SIZE == 0 || y % CELL_SIZE == (CELL_SIZE - 1));
  wire is_outline = is_outline_x || is_outline_y;

  wire pixel;

  draw_numbers draw_numbers_inst (
      .index(current_number),
      .x(x[5:0]),
      .y(y[5:0]),
      .pixel(pixel)
  );

  wire board_area = x >= 128 && y >= 128 && x < 128 + 256 && y < 128 + 256;
  wire [5:0] outline_color = is_outline ? 6'b111111 : 6'b0;

  wire debug_rect = x >= 64 && x < 128 + 256 + 64 && y >= 16 && y < 32;

  always @(*) begin
    rrggbb = board_area ? {2'b0, {4{pixel}}} | outline_color : 
             debug_mode && debug_rect ? x[8:3] :    
             6'b0;
  end

endmodule
