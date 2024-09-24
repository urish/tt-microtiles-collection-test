module io_serdes #(parameter WIDTH=24)(
    input logic              clk,
    input logic              reset,

    input logic [7:0]        inputs,
    output logic [7:0]       outputs,

    output logic [WIDTH-1:0] a,
    output logic [WIDTH-1:0] b,
    input logic [WIDTH-1:0]  z,

    input logic              start_calc,
    input logic              output_result
);

    logic [WIDTH-1:0]        a_reg, b_reg;
    logic [5:0]              input_index;
    logic [5:0]              output_index;

    typedef enum             {IDLE, READ_A, READ_B} states_t;
    states_t state;

    always_ff @(posedge clk) begin
        if (reset == 1'b0) begin
            state <= READ_A;
            input_index <= WIDTH-1;
            output_index <= WIDTH-1;
            a_reg <= 0;
            b_reg <= 0;
            outputs <= 0;
        end

        else if (output_result) begin
            outputs <= z[output_index-:8];

            if (output_index <= 7) begin
                output_index <= WIDTH-1;
                state <= IDLE;
            end else
                output_index <= output_index - 8;
        end

        else begin
            case (state)
                READ_A: begin
                    a_reg[input_index-:8] <= inputs;

                    if (input_index <= 7) begin
                        input_index <= WIDTH-1;
                        state <= READ_B;
                    end else
                      input_index <= input_index - 8;
                end

                READ_B: begin
                    b_reg[input_index-:8] <= inputs;

                    if (input_index <= 7) begin
                        input_index <= WIDTH-1;
                        state <= IDLE;
                    end else
                      input_index <= input_index - 8;
                end
            endcase
        end
    end

    assign a = (start_calc) ? a_reg : 0;
    assign b = (start_calc) ? b_reg : 0;

endmodule // io_serdes
