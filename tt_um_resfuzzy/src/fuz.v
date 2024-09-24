module fuzzy(
    input  clk,rst_n,ef,
    input wire [7:0] raw,     
    input wire [7:0] sow, 
    output reg [7:0] risk           
);
  
    wire [7:0] rain_low;
    wire [7:0] rain_medium;
    wire [7:0] rain_high;
    
    wire [7:0] soil_moisture_low;
    wire [7:0] soil_moisture_medium;
    wire [7:0] soil_moisture_high;
    
    wire [7:0] rule1_firing_strength;
    wire [7:0] rule2_firing_strength;
    wire [7:0] rule3_firing_strength;
    
    wire [15:0] numerator;
    wire [7:0] denominator;



    function [7:0] triangular_membership;
        input [7:0] value;
        input [7:0] a;
        input [7:0] b;
        input [7:0] c;
        begin
            if (value <= a)
                triangular_membership = 0;
            else if (value <= b)
                triangular_membership = (((value - a)<<8)-(value - a))/ (b - a);  
            else if (value <= c)
                triangular_membership = (((c - value)<<8)-(c - value)) / (c - b);
            else
                triangular_membership = 0;
        end
    endfunction
    
        assign rain_low = triangular_membership(raw, 0, 20, 40);
        assign rain_medium = triangular_membership(raw, 30, 50, 70);
        assign rain_high = triangular_membership(raw, 60, 80, 100);
        
        assign soil_moisture_low = triangular_membership(sow, 0, 20, 40);
        assign soil_moisture_medium = triangular_membership(sow, 30, 50, 70);
        assign soil_moisture_high = triangular_membership(sow, 60, 80, 100);
        
        assign  rule1_firing_strength = rain_high & soil_moisture_high;
        assign  rule2_firing_strength = rain_medium & soil_moisture_medium;
        assign  rule3_firing_strength = rain_low & soil_moisture_low;
        
        assign numerator = ((rule1_firing_strength <<8)-(rule1_firing_strength)) + rule2_firing_strength * 170 + rule3_firing_strength * 85;
        assign denominator = rule1_firing_strength + rule2_firing_strength + rule3_firing_strength;

    always @(posedge clk ) begin
       
        if (!rst_n)begin
             risk <= 8'b0;       
        end
        else if (ef) begin
            risk<= (denominator != 0) ? numerator / denominator :8'b0;
        end 
     end    
endmodule
