// Copyright, 2024 - Alea Art Engineering, Enrico Sanino
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


module mult8x8_module (
   input wire clk,
   input wire reset,
   input wire ld,
   output reg mult_rdy,
   input wire[7:0] a,
   input wire[7:0] b,
   output reg[15:0] result
);

 reg[7:0] a_sig = 8'h00;
 reg[7:0] b_sig = 8'h00;
 reg [3:0] seq = 4'h0;
 reg ld_latch = 1'b0;
 reg ld_prev = 1'b0;


always @(posedge clk)
   begin
   if (reset == 1'b0)
      begin
         result <= 16'h0000;
         mult_rdy <=  1'b 0; 
         seq <= 4'b0000;
         ld_latch <= 1'b0;  
      end
   else 
   begin
      ld_latch <= ld;
      ld_prev <= ld_latch;
      if (seq == 4'h0) begin
         if (ld == 1'b0)
         begin
            mult_rdy <= 1'b0;
         end
            
         if (ld_prev == 1'b0 && ld_latch == 1'b1) // at the rising edge of load, store the operands
         begin
            a_sig <= a;
            b_sig <= b;
            mult_rdy <= 1'b0;
            seq <= 4'h1;
         end
      end
      else if (seq == 4'h1) // execute the multiplication and assert to the rdy signal
      begin
         result <= a_sig * b_sig;
         mult_rdy <= 1'b1;
         seq <= 4'h2;
      end
      else if (seq == 4'h2) // to synchronize with the color wheel, extends the rdy by one tclk. probably useless,
                            // can be avoided, but it works. it took some time to find right sync, so is fine for now
      begin
         seq <= 4'h0;
      end
      else seq <= 4'h0;

      end
   end
endmodule 

