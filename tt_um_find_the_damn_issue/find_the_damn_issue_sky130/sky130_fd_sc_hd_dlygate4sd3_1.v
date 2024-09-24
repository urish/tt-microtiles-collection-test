`timescale 1ps/1ps

module sky130_fd_sc_hd_dlygate4sd3_1 (
    input A,
    output reg X
);

    always @(A) begin
        #375; // Delay of 375 picoseconds
        X = A;
    end

endmodule
