`timescale 1ns/1ps
module top_tb();

    reg clock = 1'b0;
    reg reset = 1'b1;
    
    initial begin
        //$dumpfile("top.fst");
        //$dumpvars();
        repeat (10) @(negedge clock);
        reset <= 1'b0;
    end
    
    always
        #10 clock <= ~clock;
        
    wire hsync;
    wire vsync;
    wire [1:0] r;
    wire [1:0] g;
    wire [1:0] b;
    
    integer i,x,y;
    integer fp;
    reg [255*8-1:0] filename;
    
    initial begin
        $dumpvars();
        i = 0;        
        @(negedge reset);
        @(posedge clock);
        @(posedge clock);
        @(posedge clock);
        repeat(60) begin
            $display("frame %d",i);
            $sformat(filename, "frame-%0d.ppm",i);
            fp = $fopen(filename,"w");
            $fwrite(fp,"P3\n640 480\n255\n");
            for (y = 0; y < 525; y=y+1) begin
                for (x = 0; x < 800; x=x+1) begin
                    if (x < 640 && y < 480)
                        $fwrite(fp,"%0d %0d %0d\n", {r,6'b0}, {g,6'b0}, {b,6'b0});
                    @(posedge clock);
                    @(posedge clock);
                end
            end
            i = i + 1;
        end
        $finish();
    end
    
    integer count;
    integer sample_cnt;
    integer audio_file;
    integer audio_byte;
    integer s;
    
    initial begin
        @(negedge reset);
        audio_file = $fopen("sound.u8_16khz.raw");
        s = 0;
        while (1) begin
            count = 0;
            for (sample_cnt = 0; sample_cnt < 3279; sample_cnt=sample_cnt+1) begin
                count = count + pwm;
                @(posedge clock);
            end
            audio_byte = (count*255)/3279;
            $display("sample %d",s);
            s = s+1;
            $fwrite(audio_file,"%c",audio_byte);
            $fflush(audio_file);
        end
    end
        
    wire pwm;

    top dut_inst (.clock(clock), .reset(reset),.hsync(hsync),.vsync(vsync),.r(r),.g(g),.b(b),.pwm(pwm));

endmodule
