module ring_osc(input wire  rst_n,
          input wire  clk,
          input wire  ro_activate,
          output wire   ro_out);

   reg                en;
   (*keep = "true" *) wire q;
   (*keep = "true" *) wire q0;
   (*keep = "true" *) wire q1;
   (*keep = "true" *) wire q2;
   (*keep = "true" *) wire q3;
   (*keep = "true" *) wire q4;
   (* keep = "true" *) wire cq4;

   
   assign ro_out = en ? q : 1'b0;
   
   always @(posedge clk or posedge rst_n) begin
    if (rst_n)
        en <= 1'b0;
    else if (ro_activate)
        en <= 1'b1;
    else
        en <= 1'b0;
    end

   assign cq4 = (en & q4);
   (* keep = 1 *) cinv cinv1(.a(cq4),.q(q0));
   (* keep = 1 *) cinv cinv2(.a(q0), .q(q1));
   (* keep = 1 *) cinv cinv3(.a(q1), .q(q2));
   (* keep = 1 *) cinv cinv4(.a(q2), .q(q3));
   (* keep = 1 *) cinv cinv5(.a(q3), .q(q4));
   assign q  = q4;
endmodule

