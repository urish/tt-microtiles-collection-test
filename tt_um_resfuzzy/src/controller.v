
module controller(
    input  clk,rst_n,
    input wire [7:0] data_bus,    
    input ss,
    output  ef1,
    output reg [7:0]s1,
    output reg [7:0]s2
    );
    
    reg [7:0]r1;
    reg [7:0]r2;
    reg [1:0]count;
    reg efr;
 

    always @(posedge clk) begin    
        if(!rst_n)begin
            r1<=0;
            r2<=0;
            count =2'b00;
        end
        else begin
            
            case(ss)
                1'b0:begin
                     r1 <= data_bus ;  
                     count = count+2'b01;

                     end
                1'b1:begin
                     r2 <= data_bus;
                     count = count+2'b01;

                     end
            endcase
            
            if(count == 2'b10)begin
                if (r1 !=0 && r2!=0)begin
                    efr=1;
                    s1=r1;
                    s2= r2;       
                end
                  count =0; 
            end else begin
                efr=0;  
                count = count;          
            end
        end 
    
    end
   assign ef1 = efr;
   
endmodule
