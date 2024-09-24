module clock_divider (
    input wire clk,               // System clock
    input wire rst,               // Reset signal
    input wire [6:0] decimation_ratio, // 8-bit decimation ratio
    input wire [6:0] delay,
    input wire delay_valid,
    output reg dec_clk           // Decimation clock output
);

    reg [6:0] counter;           
    reg [6:0] delay_curr ;
    reg delay_valid_prev;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 7'b0;
            dec_clk <= 1'b0;
            delay_curr<=7'b0;
            delay_valid_prev<=1'b0;
        end else begin
          if(delay_valid && !delay_valid_prev) begin
             delay_curr<=delay;
          end else if (delay != 6'b000000) begin
            delay_curr<=delay_curr-1;
            dec_clk <= 1'b0;
          end else
            
            counter <= counter + 1;
            delay_valid_prev<=delay_valid;
            if (counter >= decimation_ratio-1) begin
                counter <= 8'b0;
                dec_clk <= ~dec_clk;
            end
            
        end
    end


endmodule
