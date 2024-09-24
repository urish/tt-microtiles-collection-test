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


module clock_prescaler_module (
   clk,
   clk_presc_pulse,
   reset,
   reset_out);
 

input   clk; 
output wire  clk_presc_pulse; 
output reg reset_out;
input   reset; 

reg     [7:0] prescaler_cnt;
reg     [7:0] reset_cnt;
reg     clk_presc_sig;

reg [4 : 0] clk_state;

localparam init = 5'd0;
localparam startup = 5'd1;
localparam active = 5'd2;

assign   clk_presc_pulse = clk_presc_sig;   

always @(posedge clk)
   begin : mainprocess
   if (reset == 1'b 0)
      begin
      prescaler_cnt <= 8'h00;
      reset_cnt <= 0;  
      clk_presc_sig <= 1'b 0;
      clk_state <= 0;   
      reset_out <= 0;
      end
   else
      begin
      case (clk_state)
      init: begin
         /* placeholder for more functionalities */
         prescaler_cnt <= 8'h00;
         reset_cnt <= 0;  
         clk_presc_sig <= 1'b 0;
         clk_state <= startup;
         reset_out <= 0;
      end

      startup: begin
         if (reset_cnt >= 8'd128)
         begin
            reset_cnt <= 0;
            clk_state <= active;
            reset_out <= 1;
         end
         else begin
            reset_cnt <= reset_cnt + 1;
            reset_out <= 0;
         end
      
         
            if (prescaler_cnt == 8'h 0) // simply divide by 2 in this implementation
            begin
            if (clk_presc_sig == 1) begin
            clk_presc_sig <= 0;
            end
            else begin
               clk_presc_sig <= 1;
               prescaler_cnt <= 0;   
            end
            end
         else
            begin
            prescaler_cnt <= prescaler_cnt + 8'h 01;   
            end
         end      


      active: begin
            if (prescaler_cnt == 8'h 0) // simply divide by 2 in this implementation
            begin
            if (clk_presc_sig == 1) begin
            clk_presc_sig <= 0;
            end
            else begin
               clk_presc_sig <= 1;
               prescaler_cnt <= 0;   
            end
            end
         else
            begin
            prescaler_cnt <= prescaler_cnt + 8'h 01;   
            end
      end
      default: clk_state <= init;
      endcase
      end
   end

endmodule 

