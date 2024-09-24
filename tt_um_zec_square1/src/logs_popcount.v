/*
 * Copyright (c) 2024 Zachary Catlin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// sets `sum` to the sum of the NBITS bits of `word`

module logs_popcount #(
  parameter NBITS = 3
) (
  input  wire [(NBITS-1):0]           word,  // the word whose bits we're going to sum
  output wire [($clog2(NBITS+1)-1):0] sum    // the resulting population count
);

  parameter HALF = NBITS / 2;

  // widths
  parameter WHALF = $clog2(HALF + 1);
  parameter WREST = $clog2(NBITS - HALF + 1);
  parameter W_ALL = $clog2(NBITS + 1);

  generate
    if (NBITS == 1) begin : gen_1bit
      assign sum = word[0];
    end
    else if (NBITS == 2) begin : gen_2bits
      assign sum = {1'b0,word[0]} + {1'b0,word[1]};
    end
    else if (NBITS == 3) begin : gen_3bits
      assign sum = {1'b0,word[0]} + {1'b0,word[1]} + {1'b0,word[2]};
    end
    else begin : gen_recurse
      wire [(WHALF-1):0] lo_sum;
      wire [(WREST-1):0] hi_sum;

      logs_popcount #(HALF) low_bits(
        .word(word[(HALF-1):0]),
        .sum(lo_sum)
      );

      logs_popcount #(NBITS - HALF) high_bits(
        .word(word[(NBITS-1):HALF]),
        .sum(hi_sum)
      );

      assign sum
        = { {(W_ALL-WHALF){1'b0}}, lo_sum } + { {(W_ALL-WREST){1'b0}}, hi_sum };
    end
  endgenerate

endmodule
