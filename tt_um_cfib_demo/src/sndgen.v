module sndgen #(parameter SAMPLE_RATE=16384) (input wire clock, input wire sample_ena, input wire reset, output wire [3:0] sample,
                                             output wire s1_o, output wire s2_o, output wire s3_o, output wire s4_o);

    reg [5:0] sample_int;
    
    localparam TIMESLOT  = SAMPLE_RATE/8;
    localparam BARSLOT   = 16;
    localparam LFSRTIME  = SAMPLE_RATE-14'd1024;
    
    reg [$clog2(SAMPLE_RATE)-1:0]      phacc1;
    reg [$clog2(SAMPLE_RATE)-1:0]      phacc2;
    reg [$clog2(SAMPLE_RATE)-1:0]      phacc3;
    reg [$clog2(SAMPLE_RATE)-1:0]      phacc4;
    reg [$clog2(TIMESLOT)+$clog2(BARSLOT)-1:0] slot_counter;
    reg [3:0]                          mask_1;
    reg                                mask_2;
    
    reg [3:0]                          s1;
    reg [3:0]                          s2;
    reg [3:0]                          s3;
    reg [3:0]                          s4;
    
    reg [1:0]                          c1;
    reg [3:0]                          c2;
    reg [3:0]                          c3;
    reg [3:0]                          c4;
    
    reg [7:0] lfsr;
   
   
    localparam D=1;
    localparam DIS=2;
    localparam E=3;
    localparam F=4;
    localparam FIS=5;
    localparam G=6;
    localparam GIS=7;
    localparam A=8;
    localparam AIS=9;
    localparam H=10;
    localparam C=11;
   
    
    assign sample = sample_int[5:2];
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            lfsr <= 8'h01;
        end else if (sample_ena) begin
            lfsr <= lfsr[7] ? {lfsr[6:0],1'b1} ^ 8'b01110000 : {lfsr[6:0],1'b0};
        end
    end
        
    reg [$clog2(SAMPLE_RATE)-1:0] rom_out;
    reg [3:0]                     rom_addr;
        
    always @(*) begin
        case (rom_addr)
            D   : rom_out = SAMPLE_RATE-14'd277;
            //DIS : rom_out = 294;
            E   : rom_out = SAMPLE_RATE-14'd311;
            F   : rom_out = SAMPLE_RATE-14'd330;
            FIS : rom_out = SAMPLE_RATE-14'd369;
            G   : rom_out = SAMPLE_RATE-14'd392;
            GIS : rom_out = SAMPLE_RATE-14'd415;
            //A   : rom_out = 440;
            AIS : rom_out = SAMPLE_RATE-14'd466;
            //H   : rom_out = 494;
            C   : rom_out = SAMPLE_RATE-14'd261;
            default: rom_out = 0;
        endcase
    end
    
    reg [3:0]  llsr;
    reg [3:0]  sample_ena_delay;
    reg [$clog2(SAMPLE_RATE)-1:0] p_c2;
    reg [$clog2(SAMPLE_RATE)-1:0] p_c3;
    reg [$clog2(SAMPLE_RATE)-1:0] p_c4;
    

    always @(posedge clock or posedge reset)
        if (reset) begin
            sample_ena_delay = 4'b0;
            p_c2 <= 0;
            p_c3 <= 0;
            p_c4 <= 0;
            rom_addr <= 0;
        end else begin
            sample_ena_delay = {sample_ena_delay[2:0],sample_ena};
            if (sample_ena_delay[0]) begin
                rom_addr <= c2;
            end
            if (sample_ena_delay[1]) begin
                p_c2 <= rom_out;
                rom_addr <= c3;
            end
            if (sample_ena_delay[2]) begin
                p_c3 <= rom_out;
                rom_addr <= c4;
            end
            if (sample_ena_delay[3]) begin
                p_c4 <= rom_out;
            end
        end
        
    wire [$clog2(BARSLOT)-1:0] bar_counter = slot_counter[$clog2(TIMESLOT)+:$clog2(BARSLOT)];
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            slot_counter   <= 0;
            c1             <= 2;
            c2             <= 0;
            c3             <= 0;
            c4             <= 0;
            mask_1         <= 4'h0;
            mask_2         <= 1'b1;
            phacc2         <= 0;
            phacc3         <= 0;
            phacc4         <= 0;
        end else if (sample_ena) begin
            slot_counter <= slot_counter + 1;
            
            /* generate masks at start of new bar */
            if (& slot_counter) begin
                mask_1 <=  lfsr[1+:4];
                mask_2 <=  | (lfsr[1+:3]) ? 1'b0 : 1'b1; /* prevent silence */
            end
            
            if (& slot_counter[$clog2(TIMESLOT)-1:0]) begin
                
                /* generate perc note */
                case (bar_counter[2:0])
                    0 : c1 <= 2'd2;
                    1 : c1 <= 2'd0;
                    2 : c1 <= 2'd1;
                    3 : c1 <= 2'd0;
                    4 : c1 <= 2'd2;
                    5 : c1 <= 2'd1;
                    6 : c1 <= 2'd1;
                    7 : c1 <= 2'd0;
                endcase
                
                /* generate bass note */
                if (bar_counter[1:0] == 2'b11) begin
                    case (bar_counter[3:2])
                        2'b00 : c2 <= D;
                        2'b01 : c2 <= E;
                        2'b10 : c2 <= GIS;
                        2'b11 : c2 <= FIS;
                    endcase
                end
                
                /* generate melody note */
                case ({lfsr[7],lfsr[5],lfsr[3]})
                    3'b100  : begin c3 <= D;   c4 <= FIS;   end
                    3'b101  : begin c3 <= E;   c4 <= GIS;   end
                    3'b110  : begin c3 <= FIS; c4 <= AIS;   end
                    3'b111  : begin c3 <= GIS; c4 <= C;     end
                    default : begin c3 <= 0;   c4 <= 0;     end
                endcase
            end
            
            /* generate tones */
            if (&slot_counter[1:0]) begin
                phacc2 <= (phacc2 + p_c2);
            end
            phacc3 <= (phacc3 + p_c3);
            phacc4 <= (phacc4 + p_c4);

        end
    end
        
    wire three_quarters = (slot_counter[$clog2(TIMESLOT)-1:0] > ((TIMESLOT*3)/4));
        
    always @(*) begin
        /* generate samples */
        if (three_quarters || ({mask_1[0],mask_2} == 2'b0) || (c1 == 2'b0)) begin
            s1 = 4'b1000;
        end else begin
            s1 = (c1 == 2'b1) ? {1'b0,{lfsr[7],lfsr[5],lfsr[3]}} : {lfsr[7],lfsr[5],lfsr[3],lfsr[1]};
        end
        
        s2     = (mask_1[1] & ~three_quarters) ? phacc2[$clog2(SAMPLE_RATE)-1] ? 4'b1100 : 4'b0100 : 4'b1000;
        s3     = mask_1[2]                     ? phacc3[$clog2(SAMPLE_RATE)-1] ? 4'b1100 : 4'b0100 : 4'b1000;
        s4     = mask_1[3]                     ? phacc4[$clog2(SAMPLE_RATE)-1] ? 4'b1100 : 4'b0100 : 4'b1000;
    
        /* mix samples */
        sample_int = s1 + s2 + s3 + s4;
    end

    assign s1_o = {!(({mask_1[0],mask_2} == 2'b0) || (c1 == 2'b0))};
    assign s2_o = {mask_1[1]           ? c2 != 0 : 1'b0};
    assign s3_o = {mask_1[2]           ? c3 != 0 : 1'b0};
    assign s4_o = {mask_1[3]           ? c4 != 0 : 1'b0};

endmodule
