module coin_acceptor (clk, rst, pulse_in, coin_out, pulse_out);

    localparam MAX_PULSE_COUNT = 50;
    localparam COIN_WIDTH = $clog2(MAX_PULSE_COUNT);

    input clk;
    input rst;
    input pulse_in;
    output reg [COIN_WIDTH-1:0] coin_out;
    output pulse_out;    
    
    reg pulse0;
    reg pulse1;
    reg pulse2;

    always @(posedge clk) begin : synchronizer
        if (rst) begin
            pulse0 <= 1;
            pulse1 <= 1;
            pulse2 <= 1;
        end else begin
            pulse0 <= pulse_in;
            pulse1 <= pulse0;
            pulse2 <= pulse1;
        end
    end

    reg [COIN_WIDTH:0] pulse_count;

    parameter COMMIT_COUNTER_MAX = 3_600_000;
    localparam COMMIT_COUNTER_WIDTH = $clog2(COMMIT_COUNTER_MAX);

    reg [COMMIT_COUNTER_WIDTH-1:0] commit_count;

    always @(posedge clk) begin : pulse_counter
        if (rst) pulse_count <= 0;
        else if (commit_count == COMMIT_COUNTER_MAX) pulse_count <= 0;
        else if (pulse2 == 0 && pulse1 == 1) pulse_count <= pulse_count + 1;
    end

    reg counting;

    always @(posedge clk) begin : commit_counter
        if (rst) begin
            commit_count <= 0;
            counting <= 0;
        end else if (pulse1 == 0 && pulse2 == 1) begin
            commit_count <= 0;
            counting <= 1;
        end else if (commit_count == COMMIT_COUNTER_MAX) begin
            commit_count <= 0;
            counting <= 0;
        end else if (counting == 1) commit_count <= commit_count + 1;
    end

    always @(posedge clk) begin : commit
        if (rst) begin
            coin_out <= 0;
        end else if (commit_count == COMMIT_COUNTER_MAX) coin_out <= pulse_count;
        else coin_out <= 0;
    end

    assign pulse_out = pulse2;

endmodule
