`default_nettype none

module drive(
    input clk,      
    input rst_n,   
    input en,
    input [11:0] bcd,  //3 digits          
    output reg [2:0] Enable,  //select which segment to display
    output reg [7:0] SevenSegment  //the current display segment
);



/*count 1_0000 clk cycle (1ms)，output a flag*/
reg [13:0] cnt0;
reg flag; 
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt0 <= 14'b0;
        flag <= 1'b0;
    end
    else if (cnt0 < 14'd1_0000 - 1'b1) begin
        cnt0 <= cnt0 + 1'b1;
        flag <= 1'b0;
    end
    else begin
        cnt0 <= 14'b0;
        flag <= 1'b1;
    end
end


/*select digit to display*/
reg [1:0] cnt_sel  ; // 0 1 2 
reg [3:0] num_disp ; // current display number     
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)
        cnt_sel <= 2'b0;
    else if(flag) begin
        if(cnt_sel < 2'd2)
            cnt_sel <= cnt_sel + 1'b1;
        else
            cnt_sel <= 2'b0;
    end
    else
        cnt_sel <= cnt_sel;
end


always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        Enable <= 3'b111;              //位选信号低电平有效(共阳极数码管，低电平导通)
        num_disp <= 4'b0;           
    end
    else begin
        if(en) begin
            case (cnt_sel)
                2'd0: begin
                    Enable <= 3'b110;      //当前数码管是哪个数码管
                    num_disp <= bcd[3:0];      //当前数码管显示什么值
                end
                2'd1: begin
                    Enable <= 3'b101;  
                    num_disp <= bcd[7:4];
                end
                2'd2: begin
                    Enable <= 3'b011;  
                    num_disp <= bcd[11:8];
                 
                end
                default: begin
                    Enable <= 3'b111;
                    num_disp <= 4'b0;
                end
            endcase
        end
        else begin
            Enable <= 3'b111;
            num_disp <= 4'b0;
        end
    end
end


/*decode*/
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)
        SevenSegment <= 8'b1100_0000; //0
    else begin
        case (num_disp)
            4'd0 : SevenSegment <= {1'b1,7'b1000000}; //0
            4'd1 : SevenSegment <= {1'b1,7'b1111001}; //1
            4'd2 : SevenSegment <= {1'b1,7'b0100100}; //2
            4'd3 : SevenSegment <= {1'b1,7'b0110000}; //3
            4'd4 : SevenSegment <= {1'b1,7'b0011001}; //4
            4'd5 : SevenSegment <= {1'b1,7'b0010010}; //5
            4'd6 : SevenSegment <= {1'b1,7'b0000010}; //6
            4'd7 : SevenSegment <= {1'b1,7'b1111000}; //7
            4'd8 : SevenSegment <= {1'b1,7'b0000000}; //8
            4'd9 : SevenSegment <= {1'b1,7'b0010000}; //9
            4'd10: SevenSegment <= 8'b11111111;        //disable
            //4'd11: SevenSegment <= 8'b10111111;        //minus sign
            default: 
                SevenSegment <= {1'b1,7'b1000000};
        endcase
    end
end

endmodule
