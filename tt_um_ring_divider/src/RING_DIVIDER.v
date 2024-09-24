`default_nettype none
module RING_DIVIDER(
    input logic enable,
    input logic enable1,
    output logic osc_out,
    output logic final_out,
    output logic n1,
    output logic n2,
    output logic n3,
    output logic n4,
    output logic n5
);
    wire div_in;
    frequency_divider freq_div (
        .clk_in(div_in),
        .clk_out2(),
        .clk_out4(),
        .clk_out8(),
        .clk_out16(),
        .clk_out32(),
        .clk_out64(),
        .clk_out128(final_out)
    );
    
    RING_OSCILLATOR ring_osc (
        .en0(enable),
        .en1(enable1),
        .in(osc_out),
        .out(osc_out),
        .n1(n1),
        .n2(n2),
        .n3(n3),
        .n4(n4)
    );
    
    assign n5 = !(osc_out & osc_out);
    assign div_in = !(osc_out & osc_out);
    
endmodule

