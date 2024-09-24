`timescale 1ns / 1ns

module coin_acceptor_tb;
    reg reset = 1;
    reg pulse = 1;

    initial begin
        #150 reset = 0;
        #15000 $finish;
    end

    initial begin
        // 1er pulse
        #600 pulse = 0;
        #200 pulse = 1;

        // 5er pulse
        #2000 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;

        // 7er pulse
        #5000 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
        #200 pulse = 0;
        #200 pulse = 1;
    end

    reg clk = 0;

    // 25 MHz
    always #20 clk = !clk;

    wire [5:0] value;

    coin_acceptor dut (
        .clk  (clk),
        .rst  (reset),
        .pulse_in(pulse),
        .coin_out (value)
    );

    defparam dut.COMMIT_COUNTER_MAX = 15;
    // defparam dut.PULSE_EN_COUNTER_MAX = 100;
    // defparam dut.PULSE_GEN_COUNTER_MAX = 3;
 
    initial begin
     $dumpvars(0, dut);
    end

endmodule
