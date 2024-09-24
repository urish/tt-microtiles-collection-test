/*
 * Copyright (c) 2024 Emilian Miron
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`timescale 1ns/10ps

module tt_um_emilian_muxpga (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
   
   reg [7:0]       io_out;
   assign uo_out  = io_out;
   assign uio_out = 0;
   assign uio_oe  = 0;

   wire [7:0]      io_in = ui_in;

   wire        reset = !rst_n;
   wire [3:0]  nibble_in = io_in[3:0];
   wire [1:0]  cmd = io_in[7:6];

   localparam  ROWS = 7;
   localparam  COLS = 6;
   localparam  CELLS = (ROWS-1)*COLS;

   // input/output register bits
   localparam  CELL_BITS = 2;
   // function value configuration bits.
   localparam  CFG_BITS = 4;
   localparam  INPUT_MUX_BITS = 2;

   reg [3:0]   cell_cfg[CELLS - 1:0];
   wire [CELL_BITS-1:0] cell_q[0:ROWS-1][0:COLS-1];

   reg [3:0]            global_cfg;
   wire                 en_cells = global_cfg[0];

   always @(posedge clk) begin
      if (reset)
        global_cfg <= 0;
      else if (cmd == 2)
        // CMD == 2: global configuration set.
        global_cfg <= nibble_in;
      else begin
         global_cfg <= global_cfg;
      end
   end

   // TODO(emilian): Make output stationary out <= in by default.
   always @(*) begin
      case(cmd)
        0: io_out = {cell_cfg[CELLS - 1], 4'b0};
        1: io_out = {cell_q[ROWS - 1][COLS - 1], cell_q[ROWS - 1][0], 4'b000};
        2: io_out = {cell_cfg[CELLS - 1], 4'b0};
        3: io_out = {cell_cfg[CELLS - 1], 4'b0};
        default:  io_out = 8'b0;
      endcase
   end

   generate
      genvar   row;
      genvar   col;

      for (row = 0; row < ROWS; row = row + 1'b1) begin : genrow
         for (col = 0; col < COLS; col = col + 1'b1) begin : gencol
            if (row == 0) begin
               // First row is virtual .. it gets inputs only
               assign cell_q[row][col] = nibble_in;
            end else begin
               // Rows 1..ROWS-1 have FPGA cells, each with one cfg nibbles.
               localparam cfg_i = ((row - 1)*COLS + col);

               wire [CFG_BITS-1:0] left_cfg = cfg_i == 0 ? nibble_in : cell_cfg[cfg_i - 1];
               localparam cminus1 = (COLS + col - 1) % COLS;
               localparam rminus1 = row - 1;
               wire [CELL_BITS-1:0] left_q = cell_q[row][cminus1];
               wire [CELL_BITS-1:0] down_q = cell_q[rminus1][col];

               always @(posedge clk) begin
                  if (reset)
                    cell_cfg[cfg_i] <= 0;
                  else if (cmd == 0)
                    // CMD == 0: configuration shift register mode.
                    cell_cfg[cfg_i] <= left_cfg;
                  else begin
                     // CMD != 0: execution mode for the cell.

                     if (cell_cfg[cfg_i][3:2] == 2'b00)
                       // CFG 0 is DFF from left cell, with mux bits used for DFF instead.
                       cell_cfg[cfg_i] <= {cell_cfg[cfg_i][3:2], left_q};
                     else
                       // others CFG values are combinatorial.
                       cell_cfg[cfg_i] <= cell_cfg[cfg_i];
                  end
               end

               wire [1:0] mux_bits = cell_cfg[cfg_i][1:0];
               wire [1:0] cfg_bits = cell_cfg[cfg_i][3:2];

               reg [CELL_BITS-1:0]      cell_in1;
               emilian_mux_in #(CELL_BITS, ROWS, COLS, row, col)
               inmux1(mux_bits, cell_q, cell_in1);

               localparam odd = col % 2;
               emilian_cell#(CELL_BITS, odd) c(clk, reset, en_cells, cfg_bits, mux_bits,
                                                   left_q, down_q, cell_in1, cell_q[row][col]);
            end
         end
      end
   endgenerate

endmodule

module emilian_mux_in
  #(
    parameter int B = 4,
    parameter int ROWS = 0,
    parameter int COLS = 0,
    parameter int row = 0,
    parameter int col = 0
   )
  (
   input [1:0]        sel,
   input [B-1:0]      cell_q[0:ROWS-1][0:COLS-1],
   output reg [B-1:0] q
   );

   localparam          rminus1 = (ROWS + row - 1) % ROWS;
   localparam          rplus1 = (ROWS + row + 1) % ROWS;
   localparam          cminus1 = (COLS + col - 1) % COLS;
   localparam          cplus1 = (COLS + col + 1) % COLS;

   if (col == 0 || col == 1 || col == (COLS - 1)) begin
      always @(*) begin
         case(sel)
           0:  q = cell_q[rminus1][col];
           1:  q = cell_q[rplus1][col];
           2:  q = cell_q[row][cplus1];
           // We're already close to column 0, allow fast access to a cell in the top row instead.
           3:  q = cell_q[ROWS-1][(row+col) % COLS];
           // should never happen
           default:  q = 0;
         endcase
      end
   end else begin
      always @(*) begin
         case(sel)
           0:  q = cell_q[rminus1][col];
           1:  q = cell_q[rplus1][col];
           2:  q = cell_q[row][cplus1];
           3:  q = cell_q[row][0];
           // should never happen
           default:  q = 0;
         endcase
      end
   end
endmodule

// TODO(emilian): Refine cell function.
module emilian_cell
  #(
    parameter int B = 2,
    parameter int odd = 1
   )
  (
    input          clk,
    input          reset,
    input          en,
    input [1:0]    cfg,
    input [1:0]    mux,
    input [B-1:0]  left_q,
    input [B-1:0]  down_q,
    input [B-1:0]  in1,
    output [B-1:0] q
    );

   reg [B-1:0]     f_out;

   always @(*) begin
      case(cfg[1:0])
        0:
          // DFF from left_q using mux bits, inputs connected in generate loop.
          f_out = mux;
        1:
          // Routing mux.
          f_out = in1;
        2:
          // half of LUT2
          f_out = left_q[0] ? {mux[left_q[1]], 1'b0} : {left_q[1], 1'b1};
        3: 
          // mix mux - one bit from left and one bit from down.
          f_out = {left_q[mux[0]], down_q[mux[1]]};
      endcase
   end

   // Output all 0s if en is false, to prevent activating combinational circuits when not running.
   wire     f_out_en = f_out & {en, en};

   // Buffer to make YOSYS happy, otherwise we get combinational loop errors.
  `ifdef EMILIAN_ADD_BUFS
   sky130_fd_sc_hd__buf_2 bufs[B-1:0] (.A(f_out_en), .X(q) );
   // assign #0.00005 q = f_out & {en, en};
  `else
   assign #0.05 q = f_out & {en, en};
  `endif
endmodule
