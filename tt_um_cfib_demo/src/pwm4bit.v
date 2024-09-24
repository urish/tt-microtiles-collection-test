module pwm4bit (input wire clock, input wire reset, input wire ena, input wire [3:0] sample, output wire pwm);

    reg [3:0] cntr;
    assign pwm = cntr < sample;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            cntr <= 4'b0;
        end else if (ena) begin
            cntr <= cntr + 4'b1;
        end
    end
endmodule
