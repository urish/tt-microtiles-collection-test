/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_2048_vga_game (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Game inputs
  wire btn_up;
  wire btn_down;
  wire btn_left;
  wire btn_right;
  wire debug_en = ui_in[7];

  button_debounce btn_up_debounce (
      .clk(clk),
      .rst_n(rst_n),
      .button(ui_in[0]),
      .debounced(btn_up)
  );

  button_debounce btn_down_debounce (
      .clk(clk),
      .rst_n(rst_n),
      .button(ui_in[1]),
      .debounced(btn_down)
  );

  button_debounce btn_left_debounce (
      .clk(clk),
      .rst_n(rst_n),
      .button(ui_in[2]),
      .debounced(btn_left)
  );

  button_debounce btn_right_debounce (
      .clk(clk),
      .rst_n(rst_n),
      .button(ui_in[3]),
      .debounced(btn_right)
  );

  // VGA signals
  wire hsync;
  wire vsync;
  reg [1:0] R;
  reg [1:0] G;
  reg [1:0] B;
  wire video_active;
  wire [9:0] pix_x;
  wire [9:0] pix_y;

  // TinyVGA PMOD
  assign uo_out = {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]};

  wire [31:0] lfsr_out;

  // Suppress unused signals warning
  wire _unused_ok = &{ena, ui_in[6:4], lfsr_out[27:16]};

  vga_sync_generator vga_sync_gen (
      .clk(clk),
      .reset(~rst_n),
      .hsync(hsync),
      .vsync(vsync),
      .display_on(video_active),
      .hpos(pix_x),
      .vpos(pix_y)
  );

  reg [63:0] grid;
  wire [63:0] next_grid;
  wire [63:0] welcome_screen_grid;
  reg show_welcome_screen;

  reg vsync_prev;
  wire vsync_rising_edge = vsync && ~vsync_prev;

  galois_lfsr lfsr_inst (
      .clk  (clk),
      .rst_n(rst_n),
      .lfsr (lfsr_out)
  );

  wire [5:0] rrggbb;
  draw_game draw_game_inst (
      .grid(grid),
      .debug_mode(debug_en),
      .x(pix_x),
      .y(pix_y),
      .rrggbb(rrggbb)
  );

  welcome_screen welcome_screen_inst (
      .clk(clk),
      .rst_n(rst_n),
      .vsync_rising_edge(vsync_rising_edge),
      .lfsr_out(lfsr_out[31:28]),
      .grid(welcome_screen_grid)
  );

  wire [3:0] debug_move;
  wire debug_btn_up = debug_move[0];
  wire debug_btn_down = debug_move[1];
  wire debug_btn_left = debug_move[2];
  wire debug_btn_right = debug_move[3];

  wire debug_grid_valid;
  wire [3:0] debug_grid_addr;
  wire [3:0] debug_grid_data;

  game_logic game_logic_inst (
      .clk(clk),
      .rst_n(rst_n),
      .grid(next_grid),
      .lfsr_value(lfsr_out[15:0]),
      .btn_up((~show_welcome_screen && btn_up) | debug_btn_up),
      .btn_right((~show_welcome_screen && btn_right) | debug_btn_right),
      .btn_down((~show_welcome_screen && btn_down) | debug_btn_down),
      .btn_left((~show_welcome_screen && btn_left) | debug_btn_left),
      .debug_move(|{debug_move}),
      .debug_grid_valid(debug_grid_valid),
      .debug_grid_addr(debug_grid_addr),
      .debug_grid_data(debug_grid_data)
  );

  debug_controller debug_controller_inst (
      .clk(clk),
      .rst_n(rst_n),
      .debug_en(debug_en),
      .uio_in(uio_in),
      .uio_out(uio_out),
      .uio_oe(uio_oe),
      .grid_in(next_grid),
      .grid_out_valid(debug_grid_valid),
      .grid_out_addr(debug_grid_addr),
      .grid_out_data(debug_grid_data),
      .force_move(debug_move)
  );


  always @(posedge clk) begin
    if (~rst_n) begin
      R <= 0;
      G <= 0;
      B <= 0;
      vsync_prev <= 0;
      show_welcome_screen <= 1'b1;
      grid <= 0;
    end else begin
      R <= video_active ? rrggbb[5:4] : 2'b00;
      G <= video_active ? rrggbb[3:2] : 2'b00;
      B <= video_active ? rrggbb[1:0] : 2'b00;
      vsync_prev <= vsync;
      if (vsync_rising_edge) begin
        if (show_welcome_screen) begin
          grid <= welcome_screen_grid;
          if (btn_up || btn_down || btn_left || btn_right) begin
            show_welcome_screen <= 0;
          end
        end else begin
          grid <= next_grid;
        end
      end
    end
  end

endmodule
