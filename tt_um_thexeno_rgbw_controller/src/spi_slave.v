// Copyright, 2024 - Alea Engineering, Enrico Sanino
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

module spi_slave_module (
  input sck,
  input clk_en,
  input cs,
  input clk,
  input mosi,
  input reset,
  output wire rdy,
  output reg [7:0] data);
 

reg     [3:0] bit_counter;
reg     [7:0] data_byte  = 8'h00;  
reg     rdy_sig;
reg     cs_sig;
reg     sck_latch; 
reg     sck_prev ;
reg     mosi_latch;
reg     reset_sig;

assign rdy = rdy_sig;

always @(posedge clk)
   begin
   if (clk_en == 1'b0)
    begin
      reset_sig <= reset;  
      cs_sig <= cs; 
      if (reset_sig == 1'b 0)
         begin
         bit_counter <= 0;   
         data_byte <= 8'h00;   
         data <= 8'h00;   
         rdy_sig <= 1'b 0;   
         sck_prev <= 1'b 0;   
         sck_latch <= 1'b 0;   
         mosi_latch <= 1'b 0;
         cs_sig <= 1'b 0;   
         end
      else
         begin
         if (cs_sig == 1'b 0) begin
         sck_prev <= sck_latch;   
         sck_latch <= sck;   
         mosi_latch <= mosi;
         /* implements the SPI Slave MODE 0 */
         if (sck_prev == 1'b 0 & sck_latch == 1'b 1)
            begin
            data_byte <= {data_byte[6:0], mosi_latch};   
            bit_counter <= bit_counter + 1;   
            rdy_sig <= 1'b 0;   
            end
         if (sck_latch == 1'b 0 && bit_counter == 8)
            begin
            rdy_sig <= 1'b 1;   
            bit_counter <= 0;
            /* the byte is fully transferred and be copied on the output reg with no glitches */
            data <= data_byte;      
            end
         else
            begin
            rdy_sig <= 1'b 0;   
            end

         end
         else 
         begin
            bit_counter <= 0;   
            data_byte <= 8'h00;   
            data <= 8'h00;   
            rdy_sig <= 1'b 0;   
            sck_prev <= 1'b 0;   
            sck_latch <= 1'b 0;   
            mosi_latch <= 1'b 0;
         end
      end
   end
   end

endmodule // module spiSlave

