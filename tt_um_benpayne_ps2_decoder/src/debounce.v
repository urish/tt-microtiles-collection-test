
//
// This is a simple debouncer that will output the input signal after it has been stable for 128 clocks.
//

module debounce (
    input wire clk,
    input wire reset,
    input wire button,
    output wire debounced_button
);
    reg [7:0]  counter;  // use high bit to flag completion
    reg        debounced_button_reg;
    reg        last_button;

    assign debounced_button = debounced_button_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            debounced_button_reg <= 0;
            last_button <= 0;
        end else begin
            last_button <= button;
            if (button != last_button) begin
                counter <= 0;
            end else if (counter[7] == 1) begin
                debounced_button_reg <= last_button;
            end else begin
                counter <= counter + 1;
            end
        end
    end 

endmodule
