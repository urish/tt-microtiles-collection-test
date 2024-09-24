`default_nettype none
// Taken from https://ieeexplore.ieee.org/abstract/document/7372600 (DRUM)

module square #(
    parameter N = 16,
    parameter K = 5,
    parameter PAD = 2 * (N - K),
    parameter LOD_W = $clog2(N),
    parameter POST_SHIFT = 8
) (
    input wire [N-1:0] in,
    output wire [2*N-1:0] out
);

    reg [LOD_W-1:0] lod_val;
    reg [K-1:0] in_selected;
    wire [N-1:0] in_abs = in[N-1] ? -in : in;    
    wire [N-1:0] lod_one_hot;
    wire [2*K-1:0] prod;

    lod #(.N(N)) lod_inst (.in(in_abs), .out(lod_one_hot));

    // yosys will incorrectly infer both a latch and a conflicting drivers?

    // MSB Priority encoder
    integer i;
    (* nolatches *)
    always @(*) begin
        lod_val = '0;
        for (i = 0; i < N; i = i + 1) begin : priority_encoder
            if (lod_one_hot[i]) 
                lod_val = LOD_W'(i);
        end
    end
    

    // Select Bits from input
    integer j;
    (* nolatches *)
    always @(*) begin
        in_selected = '0;
        // A lod_val thats less than K implies the MSBs are all zeros, just select
        if (lod_val < K) begin
            in_selected = in_abs[K-1:0];
        end else begin
            for (j = K; j < N; j = j + 1) begin : input_selector
                if (lod_val == j)
                    in_selected = {in_abs >> (lod_val - K + 2), 1'b1};
            end
        end
    end

    assign prod = (in_selected) * (in_selected);
    // Shift left 2 * lod_val, then right POST_SHIFT
    wire [LOD_W:0] lod_shamt = (lod_val < K) ? 0 : (lod_val - (K - 1)) << 1;
    wire [LOD_W:0] shamt = POST_SHIFT - lod_shamt;
    wire shift_dir = shamt[LOD_W];

    assign out = shift_dir ? {{PAD{1'b0}}, prod} << -shamt : {{PAD{1'b0}}, prod} >> shamt;

endmodule