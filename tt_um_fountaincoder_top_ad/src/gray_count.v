// Gray counter

module GREY_COUNT(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [7:0] gray_count
);

    // q is the counter, plus the imaginary bit
    reg q [8:0]; // Adjusted to use positive indices
    
    // no_ones_below[x] = 1 iff there are no 1's in q below q[x]
    reg no_ones_below [8:0]; // Adjusted to use positive indices
    
    // q_msb is a modification to make the msb logic work
    reg q_msb;
    
    integer i, j, k;
    
    always @ (posedge reset or posedge clk)
    begin
        if (reset)
        begin
            // Resetting involves setting the imaginary bit to 1
            q[0] <= 1; // Adjusted index
            for (i = 1; i <= 8; i = i + 1) // Adjusted loop range
                q[i] <= 0;
        end
        else if (enable)
        begin
            // Toggle the imaginary bit
            q[0] <= ~q[0]; // Adjusted index
            // Additional logic to handle the rest of the bits
            for (i = 1; i <= 7; i = i + 1)
            begin
                // Flip q[i] if lower bits are a 1 followed by all 0's
                q[i] <= q[i] ^ (q[i-1] & no_ones_below[i-1]);
            end
            q[8] <= q[8] ^ (q_msb & no_ones_below[7]);
        end
    end
    
    always @(*)
    begin
        // There are never any 1's beneath the lowest bit
        no_ones_below[0] <= 1; // Adjusted index
        
        for (j = 1; j <= 8; j = j + 1) // Adjusted loop range
            no_ones_below[j] <= no_ones_below[j-1] & ~q[j-1];
        
        q_msb <= q[8] | q[7];
        
        // Copy over everything but the imaginary bit
        for (k = 0; k < 8; k = k + 1)
            gray_count[k] <= q[k+1]; // Adjusted index to skip the imaginary bit
    end
    
endmodule