/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module game_logic (
    input wire clk,
    input wire rst_n,

    input wire btn_up,
    input wire btn_right,
    input wire btn_down,
    input wire btn_left,
    input wire [15:0] lfsr_value,

    input wire debug_move,
    input wire debug_grid_valid,
    input wire [3:0] debug_grid_addr,
    input wire [3:0] debug_grid_data,

    output reg [63:0] grid
);

  function [63:0] transpose_grid(input [63:0] grid_in);
    reg [63:0] transposed_grid;
    begin
      transposed_grid[63:60] = grid_in[63:60];  // Row 0, Col 0 -> Row 0, Col 0
      transposed_grid[59:56] = grid_in[47:44];  // Row 1, Col 0 -> Row 0, Col 1
      transposed_grid[55:52] = grid_in[31:28];  // Row 2, Col 0 -> Row 0, Col 2
      transposed_grid[51:48] = grid_in[15:12];  // Row 3, Col 0 -> Row 0, Col 3

      transposed_grid[47:44] = grid_in[59:56];  // Row 0, Col 1 -> Row 1, Col 0
      transposed_grid[43:40] = grid_in[43:40];  // Row 1, Col 1 -> Row 1, Col 1
      transposed_grid[39:36] = grid_in[27:24];  // Row 2, Col 1 -> Row 1, Col 2
      transposed_grid[35:32] = grid_in[11:8];  // Row 3, Col 1 -> Row 1, Col 3

      transposed_grid[31:28] = grid_in[55:52];  // Row 0, Col 2 -> Row 2, Col 0
      transposed_grid[27:24] = grid_in[39:36];  // Row 1, Col 2 -> Row 2, Col 1
      transposed_grid[23:20] = grid_in[23:20];  // Row 2, Col 2 -> Row 2, Col 2
      transposed_grid[19:16] = grid_in[7:4];  // Row 3, Col 2 -> Row 2, Col 3

      transposed_grid[15:12] = grid_in[51:48];  // Row 0, Col 3 -> Row 3, Col 0
      transposed_grid[11:8] = grid_in[35:32];  // Row 1, Col 3 -> Row 3, Col 1
      transposed_grid[7:4] = grid_in[19:16];  // Row 2, Col 3 -> Row 3, Col 2
      transposed_grid[3:0] = grid_in[3:0];  // Row 3, Col 3 -> Row 3, Col 3

      transpose_grid = transposed_grid;
    end
  endfunction

  localparam DIRECTION_LEFT = 2'd0;
  localparam DIRECTION_RIGHT = 2'd1;
  localparam DIRECTION_UP = 2'd2;
  localparam DIRECTION_DOWN = 2'd3;

  reg game_started;
  reg [1:0] add_new_tiles;
  reg [1:0] lfsr_shift;
  wire [3:0] new_tile_index = lfsr_value[lfsr_shift*4+:4];
  reg [1:0] current_direction;

  wire any_button_pressed = btn_up | btn_right | btn_down | btn_left;
  reg prev_any_button_pressed;
  wire button_pressed = ~prev_any_button_pressed & any_button_pressed;
  reg calculate_move;
  reg valid_move;
  reg debug_move_reg;
  reg should_transpose;
  wire [63:0] transposed_grid = transpose_grid(grid);
  reg [1:0] current_row_index;
  wire [15:0] current_row = grid[current_row_index*16+:16];
  wire [15:0] current_row_pushed_merged;

  game_row_push_merge push_merge (
      .row(current_row),
      .push_right(current_direction == DIRECTION_RIGHT || current_direction == DIRECTION_DOWN),
      .result_row(current_row_pushed_merged)
  );

  always @(posedge clk) begin
    if (~rst_n) begin
      add_new_tiles <= 0;
      lfsr_shift <= 0;
      grid <= 0;
      prev_any_button_pressed <= 0;
      current_direction <= 0;
      current_row_index <= 0;
      should_transpose <= 0;
      game_started <= 0;
      calculate_move <= 0;
      valid_move <= 0;
      debug_move_reg <= 0;
    end else begin
      lfsr_shift <= lfsr_shift - 2'd1;
      prev_any_button_pressed <= any_button_pressed;
      if (~game_started) begin
        if (button_pressed) begin
          game_started  <= 1;
          add_new_tiles <= 2;
        end
      end else if (button_pressed) begin
        if (btn_left) begin
          current_direction <= DIRECTION_LEFT;
        end else if (btn_right) begin
          current_direction <= DIRECTION_RIGHT;
        end else if (btn_up) begin
          current_direction <= DIRECTION_UP;
        end else if (btn_down) begin
          current_direction <= DIRECTION_DOWN;
        end
        if (btn_up | btn_down) begin
          should_transpose <= 1;
        end
        current_row_index <= 0;
        valid_move <= 0;
        calculate_move <= 1;
        debug_move_reg <= debug_move;
      end else if (should_transpose) begin
        grid <= transposed_grid;
        should_transpose <= 0;
      end else if (calculate_move) begin
        if (current_row != current_row_pushed_merged) begin
          valid_move <= 1;
        end
        grid[current_row_index*16+:16] <= current_row_pushed_merged;

        current_row_index <= current_row_index + 1;
        if (current_row_index == 2'd3) begin
          if (current_direction == DIRECTION_UP || current_direction == DIRECTION_DOWN) begin
            should_transpose <= 1;
          end
          add_new_tiles  <= valid_move && !debug_move_reg ? 1 : 0;
          calculate_move <= 0;
        end
      end else if (add_new_tiles != 0) begin
        if (grid[new_tile_index*4+:4] == 0) begin
          grid[new_tile_index*4+:4] <= 1;
          add_new_tiles <= add_new_tiles - 1;
        end
      end
    end

    if (debug_grid_valid) begin
      grid[debug_grid_addr*4+:4] <= debug_grid_data;
    end
  end
endmodule
