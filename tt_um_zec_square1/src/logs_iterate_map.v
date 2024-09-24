/*
 * Copyright (c) 2024 Zachary Catlin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// performs iterations of the logistic map: x <- r * x * (1 - x)

module logs_iterate_map #(
  parameter FRAC = 4,     // number of fraction bits in numbers
  parameter ITER_LEN = 20 // length of an iteration in clock cycles
) (
  input  wire                clk,   // clock
  input  wire                reset, // reset (active HIGH)

  input  wire [(2+FRAC-1):0] r,  // the map parameter 'r' (2.FRAC fixed-point)

  output reg  [(FRAC-1):0]   x,         // 'x', the value we iteratively apply the map to (0.FRAC fixed-point)
  output reg                 next_ready // set to 1 when we have finished calculating a new value of 'x'
);
  // initial value of 'x'; 0.0625
  parameter INITIAL_X = 1 << (FRAC - 4);

  // size of multiplier output
  parameter MULT_SZ = FRAC + (FRAC + 2);

  // we multiply using an iterative shift-and-add algorithm

  reg [(MULT_SZ-1):0] mult1_shift; // shifted version of first multiplicand for multiplier
  reg [(FRAC-1):0]    mult2_shift; // shifted version of second multiplicand for multiplier
  reg [(MULT_SZ-1):0] mult_accum;  // the multiplier's accumulator

  // this module operates on a cycle lasting at least (2 * FRAC + 3) clock cycles, to wit:
  //
  //            cycle(s)     :        action(s)
  //              0          : mult1 := x;  mult2 := "1 - x";  accum := 0
  //        1 ..= FRAC       : if (mult2[0]) { accum += mult1 }; mult1 <<= 1; mult2 <<= 1
  //              FRAC + 1   : mult1 := r;  mult2 := accum >> [suitable shift]; accum := 0
  // (FRAC+2) ..= (2*FRAC+1) : if (mult2[0]) { accum += mult1 }; mult1 <<= 1; mult2 <<= 1
  //            2 * FRAC + 2 : x := accum >> [suitable shift]
  //      remainder (if any) : idle

  parameter CYCLE_LEN = (ITER_LEN >= (2 * FRAC + 3)) ? ITER_LEN : 2 * FRAC + 3;

  reg [($clog2(CYCLE_LEN)-1):0] counter;

  always @(posedge clk) begin
    if (reset) begin
      x <= INITIAL_X;
      next_ready <= 0;
      counter <= 0;
    end
    else begin
      next_ready <= 0;

      if (counter == 0) begin
        mult_accum <= 0;
        mult1_shift <= {{(MULT_SZ - FRAC){1'b0}}, x};
        mult2_shift <= ~x;  // in fixed-point, essentially 1-x
      end
      else if ( ((counter > 0       ) & (counter <= FRAC         ))
              | ((counter > (FRAC+1)) & (counter <= (FRAC+FRAC+1)))) begin

        if (mult2_shift[0]) begin
          mult_accum <= mult_accum + mult1_shift;
        end
        mult1_shift <= {mult1_shift[(MULT_SZ-2):0], 1'b0};
        mult2_shift <= {1'b0, mult2_shift[(FRAC-1):1]};

      end
      else if (counter == (FRAC + 1)) begin
        mult1_shift <= {{(MULT_SZ - FRAC - 2){1'b0}}, r};
        mult2_shift <= mult_accum[(MULT_SZ - 3):(MULT_SZ - FRAC - 2)]; // x * (1 - x)
        mult_accum <= 0;
      end
      else if (counter == (FRAC+FRAC+2)) begin
        x <= mult_accum[(MULT_SZ - 3):(MULT_SZ - FRAC - 2)]; // r * x * (1 - x)
        next_ready <= 1;
      end

      counter <= (counter >= (CYCLE_LEN - 1)) ? 0 : counter + 1;
    end
  end
endmodule
