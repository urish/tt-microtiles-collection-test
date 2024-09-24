`default_nettype none
module tt_um_dpmunit(
     input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
     wire _unused = &{uio_in,ena};
    
    wire  perf_req; // 4-bit performance requirement signal
    wire [1:0] temp_sensor; // 2-bit temperature sensor input
    wire [1:0] battery_level; // 2-bit battery level input
    wire [2:0] workload_core; // 3-bit
    reg [1:0] vcore1; // 2-bit voltage control for core 1
    reg [1:0] vcore2; // 2-bit voltage control for core 2
    reg [1:0] vmem; // 2-bit voltage control for memory
    reg [2:0] fcore1; // 3-bit frequency control for core 1
    reg [2:0] fcore2; // 3-bit frequency control for core 2
    reg [2:0] fmem; // 3-bit frequency control for memory
    reg power_save; // Power saving mode indicator


    assign uio_oe = 8'b11111111;  // Assuming uio is always output in this context
    assign perf_req= ui_in[0];
    assign temp_sensor = ui_in[2:1];
    assign battery_level = ui_in[4:3];
    assign workload_core = ui_in[7:5];
    //assign uio_in = 8'b0;

    assign uio_out [0] = power_save;
    assign uio_out [2:1] = vcore1;
    assign uio_out [4:3] = vcore2;
    assign uio_out [6:5] = vmem;
    assign uio_out [7] =  fcore1 [0];
    assign uo_out  [1:0] = fcore1 [2:1];
    assign uo_out  [4:2] = fcore2 [2:0];
    assign uo_out  [7:5] = fmem [2:0];


    // State encoding
   parameter NORMAL             = 3'b000;
parameter PERFORMANCE        = 3'b001;
parameter POWERSAVE          = 3'b010;
parameter THERMAL_MANAGEMENT = 3'b011;
parameter BATTERY_SAVING     = 3'b100;

reg [2:0] state, next_state;

    // State transition logic
  always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= NORMAL;
        else
            state <= next_state;
     end

    // Next state logic and output logic
  always @(negedge clk ) begin
      case (state)
         NORMAL: begin
                  {vcore1, vcore2, vmem} = 6'b010101; // Default voltage levels
                  {fcore1, fcore2, fmem} = 9'b010010010; // Default frequency levels
                  power_save =1'b0;
                  if (perf_req == 1'b1)
                    next_state = PERFORMANCE;
                  else if ((battery_level ==2'b00) || (battery_level ==2'b01) )
                    next_state = BATTERY_SAVING;
                  else if ((temp_sensor  ==2'b10) || (temp_sensor  ==2'b11) )
                    next_state = THERMAL_MANAGEMENT;
                  else if (workload_core == 3'b000)
                    next_state = POWERSAVE;
                  else
                    next_state = NORMAL;
                end
          PERFORMANCE: begin
                         {vcore1, vcore2, vmem} = 6'b111111; // Maximum voltage levels
                         {fcore1, fcore2, fmem} = 9'b111111111; // Maximum frequency levels
                         if (perf_req ==1'b0)
                           next_state = NORMAL;
                         else
                           next_state = PERFORMANCE;
                       end
            POWERSAVE: begin
                         power_save = 1'b1;
                         {vcore1, vcore2, vmem} = 6'b010101; // Reduced voltage levels
                         {fcore1, fcore2, fmem} = 9'b001000000; // Reduced frequency levels
                         if (workload_core == 3'b111)
                           next_state = NORMAL;
                         else
                           next_state = POWERSAVE;
                       end
          THERMAL_MANAGEMENT: begin
                                power_save = 1'b0;
                                {vcore1, vcore2, vmem} = 6'b101010; // Moderate voltage levels
                                {fcore1, fcore2, fmem} = 9'b011011011; // Moderate frequency levels
                                if (temp_sensor == 2'b01 || temp_sensor == 2'b00 )
                                  next_state = NORMAL;
                                else
                                  next_state = THERMAL_MANAGEMENT;
                               end
             BATTERY_SAVING: begin
                               power_save = 1'b1;
                               {vcore1, vcore2, vmem} = 6'b000000; // Minimum voltage levels
                               {fcore1, fcore2, fmem} = 9'b000000000; // Minimum frequency levels
                               if (battery_level == 2'b10  || battery_level == 2'b11)
                                 next_state = NORMAL;
                               else
                                 next_state = BATTERY_SAVING;
                             end
            default: next_state = NORMAL;
        endcase
    end
endmodule
