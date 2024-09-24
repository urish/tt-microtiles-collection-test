module top(   
    input  clk,rst_n,ss,
    input wire [7:0] data_bus,     
    output wire [7:0] risk          
    );
  
  wire [7:0]ra;
  wire [7:0]so;
  wire efw;
  
 controller controller (
        .clk(clk),
        .rst_n(rst_n),
        .data_bus(data_bus),
        .ss(ss),
        .ef1(efw),
        .s1(ra),
        .s2(so)
    );    

fuzzy fuzzy(
    .clk(clk),
    .rst_n(rst_n),
    .ef(efw),
    .raw(ra),
    .sow(so),
    .risk(risk)           
    );
endmodule
