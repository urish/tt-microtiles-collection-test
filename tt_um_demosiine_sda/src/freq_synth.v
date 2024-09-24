`default_nettype none

module freq_synth(
    output wire audio,
    input wire synth_clk, 
    input wire clk, rst_n,
    input wire [6:0] hp,
    input wire active
    );
    
    reg audio_reg;
    reg [6:0] hp_ctr;

    reg en_synth_clk;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            audio_reg <= 1'd0;  
            hp_ctr <= 7'd1;
            en_synth_clk <= 1'b1;
        end else begin
            if (en_synth_clk) begin
                if (synth_clk) begin
                    en_synth_clk <= 1'b0;
                    if (hp_ctr == hp) begin
                        hp_ctr <= 7'd1;
                        audio_reg <= ~audio_reg;
                    end else
                        hp_ctr <= hp_ctr + 1'd1;
                end
            end else begin
                if (~synth_clk)
                    en_synth_clk <= 1'b1;
            end
        end
    end
    
    assign audio = audio_reg & active;
    
endmodule
