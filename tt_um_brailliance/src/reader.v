module reader (
    input clk,
    input reset,
    input [7:0] braille_out,      // Input data from braille_converter (8-bit)
    input [7:0] braille_size,     // Size of the data to be loaded (max 256)
    input braille_valid,          // Signal indicating data is valid
    input next,                   // Signal to load the next set of data
 
    output reg [7:0] reader1_out // Reader 1 output (8-bit)
);

    // States of the state machine
    parameter IDLE = 3'b000,
              LOADING = 3'b001,
              START_SIGNAL = 3'b010,
              SENDING = 3'b011,
              WAIT_NEXT = 3'b100,
              END_SIGNAL = 3'b101;

    reg [2:0] state, next_state;

    reg [7:0] buffer [0:255];       // Buffer to store up to 256 characters (8-bit)
    reg [7:0] buffer_index;         // Index to track buffer writing (8-bit to cover 256 entries)
    reg [7:0] read_addr;            // Read address for the current set of 4 characters
    reg [7:0] loaded_braille_size;  // Size of the loaded data (8-bit for up to 256 entries)

    reg next_prev;                  // Register to store previous state of 'next'
    reg next_sync;                  // Synchronized version of 'next'

    integer i;

    // Edge detection: detect falling edge of 'next'
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            next_prev <= 0;
            next_sync <= 0;
        end else begin
            next_prev <= next_sync;
            next_sync <= next;
        end
    end

    wire next_falling_edge = next_prev & ~next_sync;

    // State transition logic
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (braille_valid) begin
                    next_state = LOADING;
                end else begin
                    next_state = IDLE;
                end
            end
            LOADING: begin
                if (buffer_index < braille_size) begin
                    next_state = LOADING;
                end else begin
                    next_state = START_SIGNAL;  // Transition to START_SIGNAL after loading is done
                end
            end
            START_SIGNAL: begin
                next_state = SENDING;  // Move to SENDING state after displaying start signal
            end
            SENDING: begin
                if (next_falling_edge && read_addr < loaded_braille_size) begin
                    if (read_addr + 1 >= loaded_braille_size) begin
                        next_state = WAIT_NEXT;  // Move to WAIT_NEXT state if last set is reached
                    end else begin
                        next_state = SENDING;
                    end
                end else begin
                    next_state = SENDING;
                end
            end
            WAIT_NEXT: begin
                if (next_falling_edge) begin
                    next_state = END_SIGNAL;  // Transition to END_SIGNAL when next is pressed again
                end else begin
                    next_state = WAIT_NEXT;  // Stay in WAIT_NEXT until next is pressed
                end
            end
            END_SIGNAL: begin
                next_state = IDLE;  // Return to IDLE state after END_SIGNAL
            end
            default: next_state = IDLE;
        endcase
    end

    // Sequential logic for loading data and sending data
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            // Reset all variables
            buffer_index <= 0;
            read_addr <= 0;
            loaded_braille_size <= 0;
            for (i = 0; i < 256; i = i + 1) begin
                //buffer[i] <= 8'b00000000;
		buffer[i] = 8'b00000000; // changed for synthesis
            end
            reader1_out <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (braille_valid) begin
                        buffer_index <= 0;
                        read_addr <= 0;
                        loaded_braille_size <= braille_size;
                    end
                end
                LOADING: begin
                    if (braille_valid && buffer_index < braille_size) begin
                        buffer[buffer_index] <= braille_out;
                        buffer_index <= buffer_index + 1;
                    end
                end
                START_SIGNAL: begin
                    // Display start signal (00010111b, 17h) on all outputs
                    reader1_out <= 8'b00010111;
                end
                SENDING: begin
                    if (next_falling_edge && read_addr < loaded_braille_size) begin
                        // Output the current set of 4 characters
                        reader1_out <= buffer[read_addr];
                        // Move to the next set of 4 characters
                        read_addr <= read_addr + 1;
                    end
                end
                WAIT_NEXT: begin
                    // Keep the last set of data outputs or set an end signal here if desired
                end
                END_SIGNAL: begin
                    // Display 4 sets of '00000001'
                    reader1_out <= 8'b00000001;
                end
            endcase
        end
    end

endmodule
