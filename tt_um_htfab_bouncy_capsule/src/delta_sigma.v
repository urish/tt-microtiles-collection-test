`default_nettype none

module delta_sigma (
    input wire clk,
    input wire rst,
    input wire [11:0] sample,
    output pdm
);

reg [13:0] acc;

always @(posedge clk) begin
    if (rst) begin
        acc <= {(14){1'b0}};
    end else if (acc[13]) begin
        acc <= acc + {{(2){sample[11]}}, sample} + {3'b001, {(11){1'b0}}};
    end else begin
        acc <= acc + {{(2){sample[11]}}, sample} - {3'b001, {(11){1'b0}}};
    end      
end

assign pdm = ~acc[13];

endmodule
