module top(input wire clock, input wire reset, output wire hsync, output wire vsync,
                                               output wire [1:0] r, output wire [1:0] g, output wire [1:0] b,
                                               output wire pwm);
                                                     

    /* prescaler unit */
    /* assume 50 MHz clock */
    localparam CLOCK_FREQUENCY = 50000000;
    localparam SAMPLE_RATE     = 15'd16384;
    
    reg [4:0]  sys_presc;
    
    wire [3:0] sample;
    wire s1, s2, s3, s4;
    
    wire vga_ena = sys_presc[0];
    wire pwm_ena = sys_presc == 5'b0;
    
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            sys_presc    <= 5'b0;
        end else begin
            sys_presc    <= sys_presc + 5'b1;
        end
    end
    

    
    wire sample_ena;
    sndgen #(.SAMPLE_RATE(SAMPLE_RATE)) sndgen_inst (.clock(clock), .sample_ena(sample_ena), .reset(reset), .sample(sample), .s1_o(s1), .s2_o(s2), .s3_o(s3), .s4_o(s4));
    pwm4bit    pwm_inst (.clock(clock),.reset(reset),.ena(pwm_ena),.sample(sample),.pwm(pwm));
    vga        vga_inst (.clock(clock),.reset(reset),.ena(vga_ena),.sample(sample),.hline(sample_ena),.hsync(hsync),.vsync(vsync),.r(r),.g(g),.b(b),.s1(s1),.s2(s2),.s3(s3),.s4(s4));

endmodule
