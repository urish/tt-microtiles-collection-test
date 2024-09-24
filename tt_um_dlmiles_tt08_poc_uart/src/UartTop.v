// Generator : SpinalHDL dev    git head : ???
// Component : UartTop

`ifdef TIMESCALE
`timescale 1ns/1ps
`endif

module UartTop (
  input               ena /* verilator public */ ,
  output reg [7:0]    uo_out /* verilator public */ ,
  input      [7:0]    ui_in /* verilator public */ ,
  output reg [7:0]    uio_out /* verilator public */ ,
  input      [7:0]    uio_in /* verilator public */ ,
  output reg [7:0]    uio_oe /* verilator public */ ,
`ifdef SIMULATION_Z
  input               simulation_z /* verilator public */ ,
`endif
  input               rst_n,
  input               clk
);

  wire                uartArea_uart_io_comm_rxd;
  wire                uartArea_uart_io_comm_cts;
  wire                uartArea_uart_io_comm_dsr;
  wire                uartArea_uart_io_comm_dcd;
  wire                uartArea_uart_io_comm_ri;
  wire       [7:0]    uartArea_uart_io_bus_dataIn;
  wire       [1:0]    uartArea_uart_io_bus_mode;
  wire                uartArea_uart_io_comm_txd;
  wire                uartArea_uart_io_comm_rts;
  wire                uartArea_uart_io_comm_dtr;
  wire       [7:0]    uartArea_uart_io_bus_dataOut;
  wire       [7:0]    uartArea_uart_io_bus_dataOe;
  wire                uartArea_uart_io_bus_resetCommandStrobe;
  wire                uartArea_uart_io_int_txint;
  wire                uartArea_uart_io_int_rxint;
  wire                uartArea_uart_io_txctrl_gatedTxdStopBitSupport;
  wire                uartArea_oneHalfStopUnit_io_dataOut;
  wire                uartArea_oneHalfStopUnit_io_active;
  wire                resetCommandUnit_1_io_resetOut;
  reg                 syncReset;
  wire                resetOut;
  wire                resetCommandStrobe;

  UartDevice uartArea_uart (
    .io_comm_txd                      (uartArea_uart_io_comm_txd                     ), //o
    .io_comm_rxd                      (uartArea_uart_io_comm_rxd                     ), //i
    .io_comm_rts                      (uartArea_uart_io_comm_rts                     ), //o
    .io_comm_cts                      (uartArea_uart_io_comm_cts                     ), //i
    .io_comm_dtr                      (uartArea_uart_io_comm_dtr                     ), //o
    .io_comm_dsr                      (uartArea_uart_io_comm_dsr                     ), //i
    .io_comm_dcd                      (uartArea_uart_io_comm_dcd                     ), //i
    .io_comm_ri                       (uartArea_uart_io_comm_ri                      ), //i
    .io_bus_dataIn                    (uartArea_uart_io_bus_dataIn[7:0]              ), //i
    .io_bus_dataOut                   (uartArea_uart_io_bus_dataOut[7:0]             ), //o
    .io_bus_dataOe                    (uartArea_uart_io_bus_dataOe[7:0]              ), //o
    .io_bus_mode                      (uartArea_uart_io_bus_mode[1:0]                ), //i
    .io_bus_resetCommandStrobe        (uartArea_uart_io_bus_resetCommandStrobe       ), //o
    .io_int_txint                     (uartArea_uart_io_int_txint                    ), //o
    .io_int_rxint                     (uartArea_uart_io_int_rxint                    ), //o
    .io_txctrl_gatedTxdStopBitSupport (uartArea_uart_io_txctrl_gatedTxdStopBitSupport), //o
    .resetOut                         (resetOut                                      ), //i
    .clk                              (clk                                           )  //i
  );
  OneHalfStopUnit uartArea_oneHalfStopUnit (
    .io_trigger (uartArea_uart_io_txctrl_gatedTxdStopBitSupport), //i
    .io_dataIn  (uartArea_uart_io_comm_txd                     ), //i
    .io_dataOut (uartArea_oneHalfStopUnit_io_dataOut           ), //o
    .io_active  (uartArea_oneHalfStopUnit_io_active            ), //o
    .resetOut   (resetOut                                      ), //i
    .clk        (clk                                           )  //i
  );
  ResetCommandUnit resetCommandUnit_1 (
    .io_trigger  (resetCommandStrobe            ), //i
    .io_resetIn  (syncReset                     ), //i
    .io_resetOut (resetCommandUnit_1_io_resetOut), //o
    .rst_n       (rst_n                         ), //i
    .clk         (clk                           )  //i
  );
  always @(*) begin
    uo_out = 8'bxxxxxxxx;
    uo_out[5] = uartArea_uart_io_comm_rts;
    uo_out[3] = uartArea_uart_io_comm_dtr;
    uo_out[7] = uartArea_uart_io_int_rxint;
    uo_out[6] = uartArea_uart_io_int_txint;
    uo_out[4] = uartArea_oneHalfStopUnit_io_dataOut;
  end

  always @(*) begin
    uio_out = 8'bxxxxxxxx;
    uio_out[7 : 0] = uartArea_uart_io_bus_dataOut;
  end

  always @(*) begin
    uio_oe = 8'bxxxxxxxx;
    uio_oe = uartArea_uart_io_bus_dataOe;
  end

  assign uartArea_uart_io_bus_dataIn = uio_in[7 : 0];
  assign uartArea_uart_io_bus_mode = ui_in[2 : 1];
  assign uartArea_uart_io_comm_rxd = ui_in[3];
  assign uartArea_uart_io_comm_cts = ui_in[6];
  assign uartArea_uart_io_comm_dsr = ui_in[4];
  assign uartArea_uart_io_comm_dcd = ui_in[5];
  assign uartArea_uart_io_comm_ri = ui_in[7];
  assign resetCommandStrobe = uartArea_uart_io_bus_resetCommandStrobe;
  assign resetOut = resetCommandUnit_1_io_resetOut;
  always @(posedge clk) begin
    syncReset <= rst_n;
  end


endmodule

module ResetCommandUnit (
  input               io_trigger,
  input               io_resetIn,
  output              io_resetOut,
  input               rst_n,
  input               clk
);

  wire                async_area_io_q;
  wire                ourReset;
  reg                 ff;
  wire                posedgeDetStrobe;
  wire                srResetPriority;
  reg                 reg1;
  reg                 reg2;

  RegAsync async (
    .area_io_s (srResetPriority), //i
    .area_io_r (ourReset       ), //i
    .area_io_q (async_area_io_q), //o
    .rst_n     (rst_n          ), //i
    .clk       (clk            )  //i
  );
  assign posedgeDetStrobe = ((! ff) && io_trigger);
  assign srResetPriority = ((! ourReset) && posedgeDetStrobe);
  assign ourReset = reg2;
  assign io_resetOut = (io_resetIn || (! ourReset));
  always @(posedge clk) begin
    ff <= io_trigger;
    reg1 <= async_area_io_q;
    reg2 <= reg1;
  end


endmodule

module OneHalfStopUnit (
  input               io_trigger,
  input               io_dataIn,
  output              io_dataOut,
  output              io_active,
  input               resetOut,
  input               clk
);

  wire                negEdgeDelay1_area_io_q;
  wire                negEdgeDelay2_area_io_q;
  reg                 triggerDelay1;
  reg                 triggerDelay2;
  wire                dataModuled;
  wire                muxActive;

  RegNeg negEdgeDelay1 (
    .area_io_en (1'b1                   ), //i
    .area_io_d  (io_trigger             ), //i
    .area_io_q  (negEdgeDelay1_area_io_q), //o
    .resetOut   (resetOut               ), //i
    .clk        (clk                    )  //i
  );
  RegNeg negEdgeDelay2 (
    .area_io_en (1'b1                   ), //i
    .area_io_d  (negEdgeDelay1_area_io_q), //i
    .area_io_q  (negEdgeDelay2_area_io_q), //o
    .resetOut   (resetOut               ), //i
    .clk        (clk                    )  //i
  );
  assign dataModuled = (io_dataIn && triggerDelay2);
  assign muxActive = (triggerDelay2 || negEdgeDelay2_area_io_q);
  assign io_dataOut = (muxActive ? dataModuled : io_dataIn);
  assign io_active = muxActive;
  always @(posedge clk) begin
    triggerDelay1 <= io_trigger;
    triggerDelay2 <= triggerDelay1;
  end


endmodule

module UartDevice (
  output              io_comm_txd,
  input               io_comm_rxd,
  output              io_comm_rts,
  input               io_comm_cts,
  output              io_comm_dtr,
  input               io_comm_dsr,
  input               io_comm_dcd,
  input               io_comm_ri,
  input      [7:0]    io_bus_dataIn,
  output     [7:0]    io_bus_dataOut,
  output     [7:0]    io_bus_dataOe,
  input      [1:0]    io_bus_mode,
  output              io_bus_resetCommandStrobe,
  output              io_int_txint,
  output              io_int_rxint,
  output              io_txctrl_gatedTxdStopBitSupport,
  input               resetOut,
  input               clk
);

  wire       [7:0]    regCtrl_io_dataOut;
  wire       [8:0]    regCtrl_io_txFifo_inPayload;
  wire                regCtrl_io_txFifo_inValid;
  wire                regCtrl_io_rxFifo_outReady;
  wire                regCtrl_io_fifoReset;
  wire       [2:0]    regCtrl_io_fifoMode;
  wire       [1:0]    regCtrl_io_fctlMode;
  wire                regCtrl_io_rtsSignal;
  wire       [7:0]    regCtrl_io_baudDivisor;
  wire       [2:0]    regCtrl_io_baudPrescaler;
  wire                regCtrl_io_phyInverted;
  wire       [2:0]    regCtrl_io_phyFilterMode;
  wire       [6:0]    regCtrl_io_regInterruptControl;
  wire       [6:0]    regCtrl_io_regInterruptStatus;
  wire       [2:0]    regCtrl_io_dataLenMode;
  wire       [1:0]    regCtrl_io_stopBitMode;
  wire                regCtrl_io_parityEnable;
  wire       [1:0]    regCtrl_io_parityMode;
  wire                regCtrl_io_resetCommandStrobe;
  wire       [7:0]    busCtrl_io_dataOut;
  wire       [7:0]    busCtrl_io_dataOe;
  wire                busCtrl_io_writeEnable;
  wire                busCtrl_io_readEnable;
  wire       [7:0]    busCtrl_io_regAddr;
  wire                uartClocking_1_io_samplerTick;
  wire                uartClocking_1_io_bitTick;
  wire                commFilter_io_phy_txd;
  wire                commFilter_io_phy_rts;
  wire                commFilter_io_phy_dtr;
  wire                commFilter_io_ttl_rxd;
  wire                commFilter_io_ttl_cts;
  wire                commFilter_io_ttl_dsr;
  wire                commFilter_io_ttl_dcd;
  wire                commFilter_io_ttl_ri;
  wire       [3:0]    sharedFifo_io_rxMaxCount;
  wire       [3:0]    sharedFifo_io_rxStartIndex;
  wire       [3:0]    sharedFifo_io_rxEndIndex;
  wire       [8:0]    sharedFifo_io_rxFifoRdData;
  wire       [3:0]    sharedFifo_io_txMaxCount;
  wire       [3:0]    sharedFifo_io_txStartIndex;
  wire       [3:0]    sharedFifo_io_txEndIndex;
  wire       [8:0]    sharedFifo_io_txFifoRdData;
  wire                txFifo_io_fifoIn_inReady;
  wire                txFifo_io_state_empty;
  wire                txFifo_io_state_fullinone;
  wire                txFifo_io_state_full;
  wire       [3:0]    txFifo_io_fifoRdAddr;
  wire       [8:0]    txFifo_io_fifoWrData;
  wire       [3:0]    txFifo_io_fifoWrAddr;
  wire                txFifo_io_fifoWrEn;
  wire       [8:0]    txFifo_io_fifoOut_outPayload;
  wire                txFifo_io_fifoOut_outValid;
  wire                rxFifo_io_fifoIn_inReady;
  wire                rxFifo_io_state_empty;
  wire                rxFifo_io_state_fullinone;
  wire                rxFifo_io_state_full;
  wire       [3:0]    rxFifo_io_fifoRdAddr;
  wire       [8:0]    rxFifo_io_fifoWrData;
  wire       [3:0]    rxFifo_io_fifoWrAddr;
  wire                rxFifo_io_fifoWrEn;
  wire       [8:0]    rxFifo_io_fifoOut_outPayload;
  wire                rxFifo_io_fifoOut_outValid;
  wire                uartFlowControl_1_io_rtsOut;
  wire                uartInterruptControl_1_io_txint;
  wire                uartInterruptControl_1_io_rxint;

  UartRegisterCtrl regCtrl (
    .io_addr                  (busCtrl_io_regAddr[7:0]            ), //i
    .io_dataIn                (io_bus_dataIn[7:0]                 ), //i
    .io_dataOut               (regCtrl_io_dataOut[7:0]            ), //o
    .io_writeEnable           (busCtrl_io_writeEnable             ), //i
    .io_readEnable            (busCtrl_io_readEnable              ), //i
    .io_txFifoState_empty     (txFifo_io_state_empty              ), //i
    .io_txFifoState_fullinone (txFifo_io_state_fullinone          ), //i
    .io_txFifoState_full      (txFifo_io_state_full               ), //i
    .io_txFifo_inPayload      (regCtrl_io_txFifo_inPayload[8:0]   ), //o
    .io_txFifo_inValid        (regCtrl_io_txFifo_inValid          ), //o
    .io_txFifo_inReady        (txFifo_io_fifoIn_inReady           ), //i
    .io_rxFifoState_empty     (rxFifo_io_state_empty              ), //i
    .io_rxFifoState_fullinone (rxFifo_io_state_fullinone          ), //i
    .io_rxFifoState_full      (rxFifo_io_state_full               ), //i
    .io_rxFifo_outPayload     (rxFifo_io_fifoOut_outPayload[8:0]  ), //i
    .io_rxFifo_outValid       (rxFifo_io_fifoOut_outValid         ), //i
    .io_rxFifo_outReady       (regCtrl_io_rxFifo_outReady         ), //o
    .io_fifoReset             (regCtrl_io_fifoReset               ), //o
    .io_fifoMode              (regCtrl_io_fifoMode[2:0]           ), //o
    .io_txBusySignal          (1'b0                               ), //i
    .io_rxOverrunSignal       (1'b0                               ), //i
    .io_dcdSignal             (commFilter_io_ttl_dcd              ), //i
    .io_riSignal              (commFilter_io_ttl_ri               ), //i
    .io_dsrSignal             (commFilter_io_ttl_dsr              ), //i
    .io_ctsSignal             (commFilter_io_ttl_cts              ), //i
    .io_fctlMode              (regCtrl_io_fctlMode[1:0]           ), //o
    .io_rtsSignal             (regCtrl_io_rtsSignal               ), //o
    .io_baudDivisor           (regCtrl_io_baudDivisor[7:0]        ), //o
    .io_baudPrescaler         (regCtrl_io_baudPrescaler[2:0]      ), //o
    .io_phyInverted           (regCtrl_io_phyInverted             ), //o
    .io_phyFilterMode         (regCtrl_io_phyFilterMode[2:0]      ), //o
    .io_regInterruptControl   (regCtrl_io_regInterruptControl[6:0]), //o
    .io_regInterruptStatus    (regCtrl_io_regInterruptStatus[6:0] ), //o
    .io_dataLenMode           (regCtrl_io_dataLenMode[2:0]        ), //o
    .io_stopBitMode           (regCtrl_io_stopBitMode[1:0]        ), //o
    .io_parityEnable          (regCtrl_io_parityEnable            ), //o
    .io_parityMode            (regCtrl_io_parityMode[1:0]         ), //o
    .io_resetCommandStrobe    (regCtrl_io_resetCommandStrobe      ), //o
    .clk                      (clk                                ), //i
    .resetOut                 (resetOut                           )  //i
  );
  UartBusCtrl busCtrl (
    .io_dataIn      (io_bus_dataIn[7:0]     ), //i
    .io_dataOut     (busCtrl_io_dataOut[7:0]), //o
    .io_dataOe      (busCtrl_io_dataOe[7:0] ), //o
    .io_mode        (io_bus_mode[1:0]       ), //i
    .io_writeEnable (busCtrl_io_writeEnable ), //o
    .io_readEnable  (busCtrl_io_readEnable  ), //o
    .io_readData    (regCtrl_io_dataOut[7:0]), //i
    .io_regAddr     (busCtrl_io_regAddr[7:0]), //o
    .clk            (clk                    ), //i
    .resetOut       (resetOut               )  //i
  );
  UartClocking uartClocking_1 (
    .io_prescaler     (regCtrl_io_baudPrescaler[2:0]), //i
    .io_divisor       (regCtrl_io_baudDivisor[7:0]  ), //i
    .io_phyFilterMode (regCtrl_io_phyFilterMode[2:0]), //i
    .io_samplerReset  (1'b0                         ), //i
    .io_samplerTick   (uartClocking_1_io_samplerTick), //o
    .io_bitTick       (uartClocking_1_io_bitTick    ), //o
    .clk              (clk                          ), //i
    .resetOut         (resetOut                     )  //i
  );
  UartCommFilter commFilter (
    .io_phyFilterMode (regCtrl_io_phyFilterMode[2:0]), //i
    .io_phyInverted   (regCtrl_io_phyInverted       ), //i
    .io_bitTick       (uartClocking_1_io_bitTick    ), //i
    .io_samplerTick   (uartClocking_1_io_samplerTick), //i
    .io_phy_txd       (commFilter_io_phy_txd        ), //o
    .io_phy_rxd       (io_comm_rxd                  ), //i
    .io_phy_rts       (commFilter_io_phy_rts        ), //o
    .io_phy_cts       (io_comm_cts                  ), //i
    .io_phy_dtr       (commFilter_io_phy_dtr        ), //o
    .io_phy_dsr       (io_comm_dsr                  ), //i
    .io_phy_dcd       (io_comm_dcd                  ), //i
    .io_phy_ri        (io_comm_ri                   ), //i
    .io_ttl_txd       (1'bx                         ), //i
    .io_ttl_rxd       (commFilter_io_ttl_rxd        ), //o
    .io_ttl_rts       (uartFlowControl_1_io_rtsOut  ), //i
    .io_ttl_cts       (commFilter_io_ttl_cts        ), //o
    .io_ttl_dtr       (1'bx                         ), //i
    .io_ttl_dsr       (commFilter_io_ttl_dsr        ), //o
    .io_ttl_dcd       (commFilter_io_ttl_dcd        ), //o
    .io_ttl_ri        (commFilter_io_ttl_ri         ), //o
    .clk              (clk                          ), //i
    .resetOut         (resetOut                     )  //i
  );
  UartSharedFifo sharedFifo (
    .io_fifoMode     (3'b000                         ), //i
    .io_rxMaxCount   (sharedFifo_io_rxMaxCount[3:0]  ), //o
    .io_rxStartIndex (sharedFifo_io_rxStartIndex[3:0]), //o
    .io_rxEndIndex   (sharedFifo_io_rxEndIndex[3:0]  ), //o
    .io_rxFifoRdData (sharedFifo_io_rxFifoRdData[8:0]), //o
    .io_rxFifoRdAddr (rxFifo_io_fifoRdAddr[3:0]      ), //i
    .io_rxFifoWrData (rxFifo_io_fifoWrData[8:0]      ), //i
    .io_rxFifoWrAddr (rxFifo_io_fifoWrAddr[3:0]      ), //i
    .io_rxFifoWrEn   (rxFifo_io_fifoWrEn             ), //i
    .io_txMaxCount   (sharedFifo_io_txMaxCount[3:0]  ), //o
    .io_txStartIndex (sharedFifo_io_txStartIndex[3:0]), //o
    .io_txEndIndex   (sharedFifo_io_txEndIndex[3:0]  ), //o
    .io_txFifoRdData (sharedFifo_io_txFifoRdData[8:0]), //o
    .io_txFifoRdAddr (txFifo_io_fifoRdAddr[3:0]      ), //i
    .io_txFifoWrData (txFifo_io_fifoWrData[8:0]      ), //i
    .io_txFifoWrAddr (txFifo_io_fifoWrAddr[3:0]      ), //i
    .io_txFifoWrEn   (txFifo_io_fifoWrEn             ), //i
    .clk             (clk                            ), //i
    .resetOut        (resetOut                       )  //i
  );
  UartGenericFifo txFifo (
    .io_fifoIn_inPayload   (regCtrl_io_txFifo_inPayload[8:0] ), //i
    .io_fifoIn_inValid     (regCtrl_io_txFifo_inValid        ), //i
    .io_fifoIn_inReady     (txFifo_io_fifoIn_inReady         ), //o
    .io_state_empty        (txFifo_io_state_empty            ), //o
    .io_state_fullinone    (txFifo_io_state_fullinone        ), //o
    .io_state_full         (txFifo_io_state_full             ), //o
    .io_fifoReset          (regCtrl_io_fifoReset             ), //i
    .io_fifoRdData         (sharedFifo_io_txFifoRdData[8:0]  ), //i
    .io_fifoRdAddr         (txFifo_io_fifoRdAddr[3:0]        ), //o
    .io_fifoWrData         (txFifo_io_fifoWrData[8:0]        ), //o
    .io_fifoWrAddr         (txFifo_io_fifoWrAddr[3:0]        ), //o
    .io_fifoWrEn           (txFifo_io_fifoWrEn               ), //o
    .io_startIndex         (sharedFifo_io_txStartIndex[3:0]  ), //i
    .io_endIndex           (sharedFifo_io_txEndIndex[3:0]    ), //i
    .io_maxCount           (sharedFifo_io_txMaxCount[3:0]    ), //i
    .io_fifoOut_outPayload (txFifo_io_fifoOut_outPayload[8:0]), //o
    .io_fifoOut_outValid   (txFifo_io_fifoOut_outValid       ), //o
    .io_fifoOut_outReady   (1'b0                             ), //i
    .resetOut              (resetOut                         ), //i
    .clk                   (clk                              )  //i
  );
  UartGenericFifo rxFifo (
    .io_fifoIn_inPayload   (9'h000                           ), //i
    .io_fifoIn_inValid     (1'b0                             ), //i
    .io_fifoIn_inReady     (rxFifo_io_fifoIn_inReady         ), //o
    .io_state_empty        (rxFifo_io_state_empty            ), //o
    .io_state_fullinone    (rxFifo_io_state_fullinone        ), //o
    .io_state_full         (rxFifo_io_state_full             ), //o
    .io_fifoReset          (regCtrl_io_fifoReset             ), //i
    .io_fifoRdData         (sharedFifo_io_rxFifoRdData[8:0]  ), //i
    .io_fifoRdAddr         (rxFifo_io_fifoRdAddr[3:0]        ), //o
    .io_fifoWrData         (rxFifo_io_fifoWrData[8:0]        ), //o
    .io_fifoWrAddr         (rxFifo_io_fifoWrAddr[3:0]        ), //o
    .io_fifoWrEn           (rxFifo_io_fifoWrEn               ), //o
    .io_startIndex         (sharedFifo_io_rxStartIndex[3:0]  ), //i
    .io_endIndex           (sharedFifo_io_rxEndIndex[3:0]    ), //i
    .io_maxCount           (sharedFifo_io_rxMaxCount[3:0]    ), //i
    .io_fifoOut_outPayload (rxFifo_io_fifoOut_outPayload[8:0]), //o
    .io_fifoOut_outValid   (rxFifo_io_fifoOut_outValid       ), //o
    .io_fifoOut_outReady   (regCtrl_io_rxFifo_outReady       ), //i
    .resetOut              (resetOut                         ), //i
    .clk                   (clk                              )  //i
  );
  UartFlowControl uartFlowControl_1 (
    .io_fctlMode              (regCtrl_io_fctlMode[1:0]   ), //i
    .io_rxFifoState_empty     (rxFifo_io_state_empty      ), //i
    .io_rxFifoState_fullinone (rxFifo_io_state_fullinone  ), //i
    .io_rxFifoState_full      (rxFifo_io_state_full       ), //i
    .io_rtsSignal             (regCtrl_io_rtsSignal       ), //i
    .io_rtsOut                (uartFlowControl_1_io_rtsOut)  //o
  );
  UartInterruptControl uartInterruptControl_1 (
    .io_regInterruptControl (regCtrl_io_regInterruptControl[6:0]), //i
    .io_regInterruptStatus  (regCtrl_io_regInterruptStatus[6:0] ), //i
    .io_txint               (uartInterruptControl_1_io_txint    ), //o
    .io_rxint               (uartInterruptControl_1_io_rxint    )  //o
  );
  assign io_bus_resetCommandStrobe = regCtrl_io_resetCommandStrobe;
  assign io_bus_dataOe = busCtrl_io_dataOe;
  assign io_bus_dataOut = busCtrl_io_dataOut;
  assign io_comm_txd = commFilter_io_phy_txd;
  assign io_comm_rts = commFilter_io_phy_rts;
  assign io_comm_dtr = commFilter_io_phy_dtr;
  assign io_int_txint = uartInterruptControl_1_io_txint;
  assign io_int_rxint = uartInterruptControl_1_io_rxint;
  assign io_txctrl_gatedTxdStopBitSupport = 1'bx;

endmodule

module RegAsync (
  input               area_io_s,
  input               area_io_r,
  output reg          area_io_q,
  input               rst_n,
  input               clk
);

  wire                when_RegAsync_l34;

  assign when_RegAsync_l34 = (! rst_n);
  always @(negedge clk) begin
    if(!rst_n) begin
      area_io_q <= 1'b0;
    end else begin
      if(when_RegAsync_l34) begin
        area_io_q <= 1'b0;
      end else begin
        if(area_io_r) begin
          area_io_q <= 1'b0;
        end else begin
          if(area_io_s) begin
            area_io_q <= 1'b1;
          end else begin
            area_io_q <= 1'b0;
          end
        end
      end
    end
  end


endmodule

//RegNeg_1 replaced by RegNeg

module RegNeg (
  input               area_io_en,
  input               area_io_d,
  output reg          area_io_q,
  input               resetOut,
  input               clk
);

  wire                area_initState;
  wire                when_RegNeg_l44;

  assign area_initState = 1'b0;
  assign when_RegNeg_l44 = (! resetOut);
  always @(negedge clk) begin
    if(!resetOut) begin
      area_io_q <= area_initState;
    end else begin
      if(when_RegNeg_l44) begin
        area_io_q <= area_initState;
      end else begin
        if(area_io_en) begin
          area_io_q <= area_io_d;
        end
      end
    end
  end


endmodule

module UartInterruptControl (
  input      [6:0]    io_regInterruptControl,
  input      [6:0]    io_regInterruptStatus,
  output              io_txint,
  output              io_rxint
);


  assign io_rxint = 1'bx;
  assign io_txint = 1'bx;

endmodule

module UartFlowControl (
  input      [1:0]    io_fctlMode,
  input               io_rxFifoState_empty,
  input               io_rxFifoState_fullinone,
  input               io_rxFifoState_full,
  input               io_rtsSignal,
  output              io_rtsOut
);


  assign io_rtsOut = io_rtsSignal;

endmodule

//UartGenericFifo_1 replaced by UartGenericFifo

module UartGenericFifo (
  input      [8:0]    io_fifoIn_inPayload,
  input               io_fifoIn_inValid,
  output              io_fifoIn_inReady,
  output              io_state_empty,
  output              io_state_fullinone,
  output              io_state_full,
  input               io_fifoReset,
  input      [8:0]    io_fifoRdData,
  output     [3:0]    io_fifoRdAddr,
  output     [8:0]    io_fifoWrData,
  output     [3:0]    io_fifoWrAddr,
  output reg          io_fifoWrEn,
  input      [3:0]    io_startIndex,
  input      [3:0]    io_endIndex,
  input      [3:0]    io_maxCount,
  output     [8:0]    io_fifoOut_outPayload,
  output              io_fifoOut_outValid,
  input               io_fifoOut_outReady,
  input               resetOut,
  input               clk
);

  wire       [3:0]    _zz_io_state_fullinone;
  reg        [3:0]    count;
  reg        [3:0]    removeIndex;
  reg        [3:0]    insertIndex;
  reg                 carryIn;
  wire       [3:0]    removeMinusInsert;
  wire       [3:0]    insertMinusRemove;
  wire       [3:0]    count22;
  wire       [3:0]    count2;
  reg                 countUp;
  reg                 countDown;
  wire                when_UartDevice_l482;
  wire                when_UartDevice_l489;
  wire                when_UartDevice_l493;
  wire                when_UartDevice_l500;
  wire                when_UartDevice_l503;
  wire                when_UartDevice_l510;
  wire                empty;

  assign _zz_io_state_fullinone = (io_maxCount - 4'b0001);
  always @(*) begin
    io_fifoWrEn = 1'b0;
    if(!when_UartDevice_l482) begin
      if(when_UartDevice_l489) begin
        io_fifoWrEn = 1'b1;
      end
    end
  end

  assign removeMinusInsert = (removeIndex - insertIndex);
  assign insertMinusRemove = (insertIndex - removeIndex);
  assign count22 = (removeMinusInsert[3] ? insertMinusRemove : removeMinusInsert);
  assign count2 = (carryIn ? io_maxCount : count22);
  always @(*) begin
    countUp = 1'b0;
    if(!when_UartDevice_l482) begin
      if(when_UartDevice_l489) begin
        countUp = 1'b1;
      end
    end
  end

  always @(*) begin
    countDown = 1'b0;
    if(!when_UartDevice_l482) begin
      if(when_UartDevice_l500) begin
        countDown = 1'b1;
      end
    end
  end

  assign when_UartDevice_l482 = ((! resetOut) || io_fifoReset);
  assign when_UartDevice_l489 = (io_fifoIn_inReady && io_fifoIn_inValid);
  assign when_UartDevice_l493 = (insertIndex != io_endIndex);
  assign when_UartDevice_l500 = (io_fifoOut_outReady && io_fifoOut_outValid);
  assign when_UartDevice_l503 = (removeIndex != io_endIndex);
  assign when_UartDevice_l510 = (countUp && countDown);
  assign empty = (count == 4'b0000);
  assign io_fifoOut_outPayload = io_fifoRdData;
  assign io_fifoOut_outValid = (! empty);
  assign io_fifoRdAddr = removeIndex;
  assign io_fifoWrAddr = insertIndex;
  assign io_fifoWrData = io_fifoIn_inPayload;
  assign io_state_empty = empty;
  assign io_state_fullinone = (count == _zz_io_state_fullinone);
  assign io_state_full = (count == io_maxCount);
  assign io_fifoIn_inReady = (! io_state_full);
  always @(posedge clk) begin
    if(when_UartDevice_l482) begin
      insertIndex <= 4'b0000;
      removeIndex <= 4'b0000;
      count <= 4'b0000;
      carryIn <= 1'b0;
    end else begin
      if(when_UartDevice_l489) begin
        if(when_UartDevice_l493) begin
          insertIndex <= (insertIndex + 4'b0001);
        end else begin
          insertIndex <= io_startIndex;
          carryIn <= (! carryIn);
        end
      end
      if(when_UartDevice_l500) begin
        if(when_UartDevice_l503) begin
          removeIndex <= (removeIndex + 4'b0001);
        end else begin
          removeIndex <= io_startIndex;
          carryIn <= (! carryIn);
        end
      end
      if(!when_UartDevice_l510) begin
        if(countUp) begin
          count <= (count + 4'b0001);
        end else begin
          if(countDown) begin
            count <= (count - 4'b0001);
          end
        end
      end
    end
  end


endmodule

module UartSharedFifo (
  input      [2:0]    io_fifoMode,
  output     [3:0]    io_rxMaxCount,
  output     [3:0]    io_rxStartIndex,
  output     [3:0]    io_rxEndIndex,
  output     [8:0]    io_rxFifoRdData,
  input      [3:0]    io_rxFifoRdAddr,
  input      [8:0]    io_rxFifoWrData,
  input      [3:0]    io_rxFifoWrAddr,
  input               io_rxFifoWrEn,
  output     [3:0]    io_txMaxCount,
  output     [3:0]    io_txStartIndex,
  output     [3:0]    io_txEndIndex,
  output     [8:0]    io_txFifoRdData,
  input      [3:0]    io_txFifoRdAddr,
  input      [8:0]    io_txFifoWrData,
  input      [3:0]    io_txFifoWrAddr,
  input               io_txFifoWrEn,
  input               clk,
  input               resetOut
);

  wire       [2:0]    _zz_rxEndIndex_0_1;
  wire       [3:0]    _zz_rxEndIndex_1_1;
  wire       [3:0]    _zz_rxEndIndex_2_1;
  wire       [3:0]    _zz_rxEndIndex_3_1;
  wire       [3:0]    _zz_rxEndIndex_4_1;
  wire       [1:0]    _zz_rxEndIndex_5_1;
  wire       [0:0]    _zz_rxEndIndex_6_1;
  wire       [3:0]    _zz_rxMaxCount_0_1;
  wire       [3:0]    _zz_rxMaxCount_1_1;
  wire       [3:0]    _zz_rxMaxCount_2_1;
  wire       [3:0]    _zz_rxMaxCount_3_1;
  wire       [3:0]    _zz_rxMaxCount_4_1;
  wire       [2:0]    _zz_rxMaxCount_5_1;
  wire       [1:0]    _zz_rxMaxCount_6_1;
  wire       [0:0]    _zz_rxMaxCount_7_1;
  wire       [2:0]    _zz_txEndIndex_0_1;
  wire       [0:0]    _zz_txEndIndex_2_1;
  wire       [1:0]    _zz_txEndIndex_3_1;
  wire       [2:0]    _zz_txEndIndex_4_1;
  wire       [3:0]    _zz_txEndIndex_5_1;
  wire       [3:0]    _zz_txEndIndex_6_1;
  wire       [3:0]    _zz_txEndIndex_7_1;
  wire       [3:0]    _zz_txMaxCount_0_1;
  wire       [0:0]    _zz_txMaxCount_1_1;
  wire       [1:0]    _zz_txMaxCount_2_1;
  wire       [2:0]    _zz_txMaxCount_3_1;
  wire       [2:0]    _zz_txMaxCount_4_1;
  wire       [3:0]    _zz_txMaxCount_5_1;
  wire       [3:0]    _zz_txMaxCount_6_1;
  wire       [3:0]    _zz_txMaxCount_7_1;
  reg        [8:0]    fifoRegs_0;
  reg        [8:0]    fifoRegs_1;
  reg        [8:0]    fifoRegs_2;
  reg        [8:0]    fifoRegs_3;
  reg        [8:0]    fifoRegs_4;
  reg        [8:0]    fifoRegs_5;
  reg        [8:0]    fifoRegs_6;
  reg        [8:0]    fifoRegs_7;
  reg        [8:0]    fifoRegs_8;
  reg        [8:0]    fifoRegs_9;
  reg        [8:0]    fifoRegs_10;
  reg        [8:0]    fifoRegs_11;
  reg        [8:0]    fifoRegs_12;
  reg        [8:0]    fifoRegs_13;
  reg        [8:0]    fifoRegs_14;
  reg        [8:0]    fifoRegs_15;
  wire       [8:0]    rxFifoWr_0;
  wire       [8:0]    rxFifoWr_1;
  wire       [8:0]    rxFifoWr_2;
  wire       [8:0]    rxFifoWr_3;
  wire       [8:0]    rxFifoWr_4;
  wire       [8:0]    rxFifoWr_5;
  wire       [8:0]    rxFifoWr_6;
  wire       [8:0]    rxFifoWr_7;
  wire       [8:0]    rxFifoWr_8;
  wire       [8:0]    rxFifoWr_9;
  wire       [8:0]    rxFifoWr_10;
  wire       [8:0]    rxFifoWr_11;
  wire       [8:0]    rxFifoWr_12;
  wire       [8:0]    rxFifoWr_13;
  wire       [8:0]    rxFifoWr_14;
  wire       [8:0]    rxFifoWr_15;
  wire       [8:0]    txFifoWr_0;
  wire       [8:0]    txFifoWr_1;
  wire       [8:0]    txFifoWr_2;
  wire       [8:0]    txFifoWr_3;
  wire       [8:0]    txFifoWr_4;
  wire       [8:0]    txFifoWr_5;
  wire       [8:0]    txFifoWr_6;
  wire       [8:0]    txFifoWr_7;
  wire       [8:0]    txFifoWr_8;
  wire       [8:0]    txFifoWr_9;
  wire       [8:0]    txFifoWr_10;
  wire       [8:0]    txFifoWr_11;
  wire       [8:0]    txFifoWr_12;
  wire       [8:0]    txFifoWr_13;
  wire       [8:0]    txFifoWr_14;
  wire       [8:0]    txFifoWr_15;
  wire       [8:0]    rxFifoRd_0;
  wire       [8:0]    rxFifoRd_1;
  wire       [8:0]    rxFifoRd_2;
  wire       [8:0]    rxFifoRd_3;
  wire       [8:0]    rxFifoRd_4;
  wire       [8:0]    rxFifoRd_5;
  wire       [8:0]    rxFifoRd_6;
  wire       [8:0]    rxFifoRd_7;
  wire       [8:0]    rxFifoRd_8;
  wire       [8:0]    rxFifoRd_9;
  wire       [8:0]    rxFifoRd_10;
  wire       [8:0]    rxFifoRd_11;
  wire       [8:0]    rxFifoRd_12;
  wire       [8:0]    rxFifoRd_13;
  wire       [8:0]    rxFifoRd_14;
  wire       [8:0]    rxFifoRd_15;
  wire       [8:0]    txFifoRd_0;
  wire       [8:0]    txFifoRd_1;
  wire       [8:0]    txFifoRd_2;
  wire       [8:0]    txFifoRd_3;
  wire       [8:0]    txFifoRd_4;
  wire       [8:0]    txFifoRd_5;
  wire       [8:0]    txFifoRd_6;
  wire       [8:0]    txFifoRd_7;
  wire       [8:0]    txFifoRd_8;
  wire       [8:0]    txFifoRd_9;
  wire       [8:0]    txFifoRd_10;
  wire       [8:0]    txFifoRd_11;
  wire       [8:0]    txFifoRd_12;
  wire       [8:0]    txFifoRd_13;
  wire       [8:0]    txFifoRd_14;
  wire       [8:0]    txFifoRd_15;
  wire                fifoMode_0;
  wire                fifoMode_1;
  wire                fifoMode_2;
  wire                fifoMode_3;
  wire                fifoMode_4;
  wire                fifoMode_5;
  wire                fifoMode_6;
  wire                fifoMode_7;
  wire                fifoMode_8;
  wire                fifoMode_9;
  wire                fifoMode_10;
  wire                fifoMode_11;
  wire                fifoMode_12;
  wire                fifoMode_13;
  wire                fifoMode_14;
  wire                fifoMode_15;
  wire       [15:0]   _zz_fifoMode_0;
  wire       [15:0]   _zz_fifoMode_0_1;
  wire       [15:0]   _zz_fifoMode_0_2;
  wire       [15:0]   _zz_fifoMode_0_3;
  wire       [15:0]   _zz_fifoMode_0_4;
  wire       [15:0]   _zz_fifoMode_0_5;
  wire       [15:0]   _zz_fifoMode_0_6;
  wire       [15:0]   _zz_fifoMode_0_7;
  reg                 _zz_fifoMode_0_8;
  reg                 _zz_fifoMode_1;
  reg                 _zz_fifoMode_2;
  reg                 _zz_fifoMode_3;
  reg                 _zz_fifoMode_4;
  reg                 _zz_fifoMode_5;
  reg                 _zz_fifoMode_6;
  reg                 _zz_fifoMode_7;
  reg                 _zz_fifoMode_8;
  reg                 _zz_fifoMode_9;
  reg                 _zz_fifoMode_10;
  reg                 _zz_fifoMode_11;
  reg                 _zz_fifoMode_12;
  reg                 _zz_fifoMode_13;
  reg                 _zz_fifoMode_14;
  reg                 _zz_fifoMode_15;
  wire                rxFifoWrAddrOH_0;
  wire                rxFifoWrAddrOH_1;
  wire                rxFifoWrAddrOH_2;
  wire                rxFifoWrAddrOH_3;
  wire                rxFifoWrAddrOH_4;
  wire                rxFifoWrAddrOH_5;
  wire                rxFifoWrAddrOH_6;
  wire                rxFifoWrAddrOH_7;
  wire                rxFifoWrAddrOH_8;
  wire                rxFifoWrAddrOH_9;
  wire                rxFifoWrAddrOH_10;
  wire                rxFifoWrAddrOH_11;
  wire                rxFifoWrAddrOH_12;
  wire                rxFifoWrAddrOH_13;
  wire                rxFifoWrAddrOH_14;
  wire                rxFifoWrAddrOH_15;
  wire                txFifoWrAddrOH_0;
  wire                txFifoWrAddrOH_1;
  wire                txFifoWrAddrOH_2;
  wire                txFifoWrAddrOH_3;
  wire                txFifoWrAddrOH_4;
  wire                txFifoWrAddrOH_5;
  wire                txFifoWrAddrOH_6;
  wire                txFifoWrAddrOH_7;
  wire                txFifoWrAddrOH_8;
  wire                txFifoWrAddrOH_9;
  wire                txFifoWrAddrOH_10;
  wire                txFifoWrAddrOH_11;
  wire                txFifoWrAddrOH_12;
  wire                txFifoWrAddrOH_13;
  wire                txFifoWrAddrOH_14;
  wire                txFifoWrAddrOH_15;
  wire                rxFifoWrEn_0;
  wire                rxFifoWrEn_1;
  wire                rxFifoWrEn_2;
  wire                rxFifoWrEn_3;
  wire                rxFifoWrEn_4;
  wire                rxFifoWrEn_5;
  wire                rxFifoWrEn_6;
  wire                rxFifoWrEn_7;
  wire                rxFifoWrEn_8;
  wire                rxFifoWrEn_9;
  wire                rxFifoWrEn_10;
  wire                rxFifoWrEn_11;
  wire                rxFifoWrEn_12;
  wire                rxFifoWrEn_13;
  wire                rxFifoWrEn_14;
  wire                rxFifoWrEn_15;
  wire                txFifoWrEn_0;
  wire                txFifoWrEn_1;
  wire                txFifoWrEn_2;
  wire                txFifoWrEn_3;
  wire                txFifoWrEn_4;
  wire                txFifoWrEn_5;
  wire                txFifoWrEn_6;
  wire                txFifoWrEn_7;
  wire                txFifoWrEn_8;
  wire                txFifoWrEn_9;
  wire                txFifoWrEn_10;
  wire                txFifoWrEn_11;
  wire                txFifoWrEn_12;
  wire                txFifoWrEn_13;
  wire                txFifoWrEn_14;
  wire                txFifoWrEn_15;
  wire                fifoWrEn_0;
  wire                fifoWrEn_1;
  wire                fifoWrEn_2;
  wire                fifoWrEn_3;
  wire                fifoWrEn_4;
  wire                fifoWrEn_5;
  wire                fifoWrEn_6;
  wire                fifoWrEn_7;
  wire                fifoWrEn_8;
  wire                fifoWrEn_9;
  wire                fifoWrEn_10;
  wire                fifoWrEn_11;
  wire                fifoWrEn_12;
  wire                fifoWrEn_13;
  wire                fifoWrEn_14;
  wire                fifoWrEn_15;
  wire       [8:0]    fifoWrData_0;
  wire       [8:0]    fifoWrData_1;
  wire       [8:0]    fifoWrData_2;
  wire       [8:0]    fifoWrData_3;
  wire       [8:0]    fifoWrData_4;
  wire       [8:0]    fifoWrData_5;
  wire       [8:0]    fifoWrData_6;
  wire       [8:0]    fifoWrData_7;
  wire       [8:0]    fifoWrData_8;
  wire       [8:0]    fifoWrData_9;
  wire       [8:0]    fifoWrData_10;
  wire       [8:0]    fifoWrData_11;
  wire       [8:0]    fifoWrData_12;
  wire       [8:0]    fifoWrData_13;
  wire       [8:0]    fifoWrData_14;
  wire       [8:0]    fifoWrData_15;
  reg        [8:0]    _zz_io_rxFifoRdData;
  reg        [8:0]    _zz_io_txFifoRdData;
  wire       [3:0]    rxStartIndex_0_1;
  wire       [3:0]    rxStartIndex_1_1;
  wire       [3:0]    rxStartIndex_2_1;
  wire       [3:0]    rxStartIndex_3_1;
  wire       [3:0]    rxStartIndex_4_1;
  wire       [3:0]    rxStartIndex_5_1;
  wire       [3:0]    rxStartIndex_6_1;
  wire       [3:0]    rxStartIndex_7_1;
  reg        [3:0]    _zz_io_rxStartIndex;
  wire       [3:0]    rxEndIndex_0_1;
  wire       [3:0]    rxEndIndex_1_1;
  wire       [3:0]    rxEndIndex_2_1;
  wire       [3:0]    rxEndIndex_3_1;
  wire       [3:0]    rxEndIndex_4_1;
  wire       [3:0]    rxEndIndex_5_1;
  wire       [3:0]    rxEndIndex_6_1;
  wire       [3:0]    rxEndIndex_7_1;
  reg        [3:0]    _zz_io_rxEndIndex;
  wire       [3:0]    rxMaxCount_0_1;
  wire       [3:0]    rxMaxCount_1_1;
  wire       [3:0]    rxMaxCount_2_1;
  wire       [3:0]    rxMaxCount_3_1;
  wire       [3:0]    rxMaxCount_4_1;
  wire       [3:0]    rxMaxCount_5_1;
  wire       [3:0]    rxMaxCount_6_1;
  wire       [3:0]    rxMaxCount_7_1;
  reg        [3:0]    _zz_io_rxMaxCount;
  wire       [3:0]    txStartIndex_0_1;
  wire       [3:0]    txStartIndex_1_1;
  wire       [3:0]    txStartIndex_2_1;
  wire       [3:0]    txStartIndex_3_1;
  wire       [3:0]    txStartIndex_4_1;
  wire       [3:0]    txStartIndex_5_1;
  wire       [3:0]    txStartIndex_6_1;
  wire       [3:0]    txStartIndex_7_1;
  reg        [3:0]    _zz_io_txStartIndex;
  wire       [3:0]    txEndIndex_0_1;
  wire       [3:0]    txEndIndex_1_1;
  wire       [3:0]    txEndIndex_2_1;
  wire       [3:0]    txEndIndex_3_1;
  wire       [3:0]    txEndIndex_4_1;
  wire       [3:0]    txEndIndex_5_1;
  wire       [3:0]    txEndIndex_6_1;
  wire       [3:0]    txEndIndex_7_1;
  reg        [3:0]    _zz_io_txEndIndex;
  wire       [3:0]    txMaxCount_0_1;
  wire       [3:0]    txMaxCount_1_1;
  wire       [3:0]    txMaxCount_2_1;
  wire       [3:0]    txMaxCount_3_1;
  wire       [3:0]    txMaxCount_4_1;
  wire       [3:0]    txMaxCount_5_1;
  wire       [3:0]    txMaxCount_6_1;
  wire       [3:0]    txMaxCount_7_1;
  reg        [3:0]    _zz_io_txMaxCount;

  assign _zz_rxEndIndex_0_1 = 3'b111;
  assign _zz_rxEndIndex_1_1 = 4'b1110;
  assign _zz_rxEndIndex_2_1 = 4'b1101;
  assign _zz_rxEndIndex_3_1 = 4'b1011;
  assign _zz_rxEndIndex_4_1 = 4'b1001;
  assign _zz_rxEndIndex_5_1 = 2'b11;
  assign _zz_rxEndIndex_6_1 = 1'b1;
  assign _zz_rxMaxCount_0_1 = 4'b1000;
  assign _zz_rxMaxCount_1_1 = 4'b1111;
  assign _zz_rxMaxCount_2_1 = 4'b1110;
  assign _zz_rxMaxCount_3_1 = 4'b1100;
  assign _zz_rxMaxCount_4_1 = 4'b1010;
  assign _zz_rxMaxCount_5_1 = 3'b100;
  assign _zz_rxMaxCount_6_1 = 2'b10;
  assign _zz_rxMaxCount_7_1 = 1'b1;
  assign _zz_txEndIndex_0_1 = 3'b111;
  assign _zz_txEndIndex_2_1 = 1'b1;
  assign _zz_txEndIndex_3_1 = 2'b11;
  assign _zz_txEndIndex_4_1 = 3'b101;
  assign _zz_txEndIndex_5_1 = 4'b1011;
  assign _zz_txEndIndex_6_1 = 4'b1101;
  assign _zz_txEndIndex_7_1 = 4'b1110;
  assign _zz_txMaxCount_0_1 = 4'b1000;
  assign _zz_txMaxCount_1_1 = 1'b1;
  assign _zz_txMaxCount_2_1 = 2'b10;
  assign _zz_txMaxCount_3_1 = 3'b100;
  assign _zz_txMaxCount_4_1 = 3'b110;
  assign _zz_txMaxCount_5_1 = 4'b1100;
  assign _zz_txMaxCount_6_1 = 4'b1110;
  assign _zz_txMaxCount_7_1 = 4'b1111;
  assign _zz_fifoMode_0 = 16'hff00;
  assign _zz_fifoMode_0_1 = 16'h8000;
  assign _zz_fifoMode_0_2 = 16'hc000;
  assign _zz_fifoMode_0_3 = 16'hf000;
  assign _zz_fifoMode_0_4 = 16'hfc00;
  assign _zz_fifoMode_0_5 = 16'hfff0;
  assign _zz_fifoMode_0_6 = 16'hfffc;
  assign _zz_fifoMode_0_7 = 16'hfffe;
  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_0_8 = _zz_fifoMode_0[0];
      end
      3'b001 : begin
        _zz_fifoMode_0_8 = _zz_fifoMode_0_1[0];
      end
      3'b010 : begin
        _zz_fifoMode_0_8 = _zz_fifoMode_0_2[0];
      end
      3'b011 : begin
        _zz_fifoMode_0_8 = _zz_fifoMode_0_3[0];
      end
      3'b100 : begin
        _zz_fifoMode_0_8 = _zz_fifoMode_0_4[0];
      end
      3'b101 : begin
        _zz_fifoMode_0_8 = _zz_fifoMode_0_5[0];
      end
      3'b110 : begin
        _zz_fifoMode_0_8 = _zz_fifoMode_0_6[0];
      end
      default : begin
        _zz_fifoMode_0_8 = _zz_fifoMode_0_7[0];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_1 = _zz_fifoMode_0[1];
      end
      3'b001 : begin
        _zz_fifoMode_1 = _zz_fifoMode_0_1[1];
      end
      3'b010 : begin
        _zz_fifoMode_1 = _zz_fifoMode_0_2[1];
      end
      3'b011 : begin
        _zz_fifoMode_1 = _zz_fifoMode_0_3[1];
      end
      3'b100 : begin
        _zz_fifoMode_1 = _zz_fifoMode_0_4[1];
      end
      3'b101 : begin
        _zz_fifoMode_1 = _zz_fifoMode_0_5[1];
      end
      3'b110 : begin
        _zz_fifoMode_1 = _zz_fifoMode_0_6[1];
      end
      default : begin
        _zz_fifoMode_1 = _zz_fifoMode_0_7[1];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_2 = _zz_fifoMode_0[2];
      end
      3'b001 : begin
        _zz_fifoMode_2 = _zz_fifoMode_0_1[2];
      end
      3'b010 : begin
        _zz_fifoMode_2 = _zz_fifoMode_0_2[2];
      end
      3'b011 : begin
        _zz_fifoMode_2 = _zz_fifoMode_0_3[2];
      end
      3'b100 : begin
        _zz_fifoMode_2 = _zz_fifoMode_0_4[2];
      end
      3'b101 : begin
        _zz_fifoMode_2 = _zz_fifoMode_0_5[2];
      end
      3'b110 : begin
        _zz_fifoMode_2 = _zz_fifoMode_0_6[2];
      end
      default : begin
        _zz_fifoMode_2 = _zz_fifoMode_0_7[2];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_3 = _zz_fifoMode_0[3];
      end
      3'b001 : begin
        _zz_fifoMode_3 = _zz_fifoMode_0_1[3];
      end
      3'b010 : begin
        _zz_fifoMode_3 = _zz_fifoMode_0_2[3];
      end
      3'b011 : begin
        _zz_fifoMode_3 = _zz_fifoMode_0_3[3];
      end
      3'b100 : begin
        _zz_fifoMode_3 = _zz_fifoMode_0_4[3];
      end
      3'b101 : begin
        _zz_fifoMode_3 = _zz_fifoMode_0_5[3];
      end
      3'b110 : begin
        _zz_fifoMode_3 = _zz_fifoMode_0_6[3];
      end
      default : begin
        _zz_fifoMode_3 = _zz_fifoMode_0_7[3];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_4 = _zz_fifoMode_0[4];
      end
      3'b001 : begin
        _zz_fifoMode_4 = _zz_fifoMode_0_1[4];
      end
      3'b010 : begin
        _zz_fifoMode_4 = _zz_fifoMode_0_2[4];
      end
      3'b011 : begin
        _zz_fifoMode_4 = _zz_fifoMode_0_3[4];
      end
      3'b100 : begin
        _zz_fifoMode_4 = _zz_fifoMode_0_4[4];
      end
      3'b101 : begin
        _zz_fifoMode_4 = _zz_fifoMode_0_5[4];
      end
      3'b110 : begin
        _zz_fifoMode_4 = _zz_fifoMode_0_6[4];
      end
      default : begin
        _zz_fifoMode_4 = _zz_fifoMode_0_7[4];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_5 = _zz_fifoMode_0[5];
      end
      3'b001 : begin
        _zz_fifoMode_5 = _zz_fifoMode_0_1[5];
      end
      3'b010 : begin
        _zz_fifoMode_5 = _zz_fifoMode_0_2[5];
      end
      3'b011 : begin
        _zz_fifoMode_5 = _zz_fifoMode_0_3[5];
      end
      3'b100 : begin
        _zz_fifoMode_5 = _zz_fifoMode_0_4[5];
      end
      3'b101 : begin
        _zz_fifoMode_5 = _zz_fifoMode_0_5[5];
      end
      3'b110 : begin
        _zz_fifoMode_5 = _zz_fifoMode_0_6[5];
      end
      default : begin
        _zz_fifoMode_5 = _zz_fifoMode_0_7[5];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_6 = _zz_fifoMode_0[6];
      end
      3'b001 : begin
        _zz_fifoMode_6 = _zz_fifoMode_0_1[6];
      end
      3'b010 : begin
        _zz_fifoMode_6 = _zz_fifoMode_0_2[6];
      end
      3'b011 : begin
        _zz_fifoMode_6 = _zz_fifoMode_0_3[6];
      end
      3'b100 : begin
        _zz_fifoMode_6 = _zz_fifoMode_0_4[6];
      end
      3'b101 : begin
        _zz_fifoMode_6 = _zz_fifoMode_0_5[6];
      end
      3'b110 : begin
        _zz_fifoMode_6 = _zz_fifoMode_0_6[6];
      end
      default : begin
        _zz_fifoMode_6 = _zz_fifoMode_0_7[6];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_7 = _zz_fifoMode_0[7];
      end
      3'b001 : begin
        _zz_fifoMode_7 = _zz_fifoMode_0_1[7];
      end
      3'b010 : begin
        _zz_fifoMode_7 = _zz_fifoMode_0_2[7];
      end
      3'b011 : begin
        _zz_fifoMode_7 = _zz_fifoMode_0_3[7];
      end
      3'b100 : begin
        _zz_fifoMode_7 = _zz_fifoMode_0_4[7];
      end
      3'b101 : begin
        _zz_fifoMode_7 = _zz_fifoMode_0_5[7];
      end
      3'b110 : begin
        _zz_fifoMode_7 = _zz_fifoMode_0_6[7];
      end
      default : begin
        _zz_fifoMode_7 = _zz_fifoMode_0_7[7];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_8 = _zz_fifoMode_0[8];
      end
      3'b001 : begin
        _zz_fifoMode_8 = _zz_fifoMode_0_1[8];
      end
      3'b010 : begin
        _zz_fifoMode_8 = _zz_fifoMode_0_2[8];
      end
      3'b011 : begin
        _zz_fifoMode_8 = _zz_fifoMode_0_3[8];
      end
      3'b100 : begin
        _zz_fifoMode_8 = _zz_fifoMode_0_4[8];
      end
      3'b101 : begin
        _zz_fifoMode_8 = _zz_fifoMode_0_5[8];
      end
      3'b110 : begin
        _zz_fifoMode_8 = _zz_fifoMode_0_6[8];
      end
      default : begin
        _zz_fifoMode_8 = _zz_fifoMode_0_7[8];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_9 = _zz_fifoMode_0[9];
      end
      3'b001 : begin
        _zz_fifoMode_9 = _zz_fifoMode_0_1[9];
      end
      3'b010 : begin
        _zz_fifoMode_9 = _zz_fifoMode_0_2[9];
      end
      3'b011 : begin
        _zz_fifoMode_9 = _zz_fifoMode_0_3[9];
      end
      3'b100 : begin
        _zz_fifoMode_9 = _zz_fifoMode_0_4[9];
      end
      3'b101 : begin
        _zz_fifoMode_9 = _zz_fifoMode_0_5[9];
      end
      3'b110 : begin
        _zz_fifoMode_9 = _zz_fifoMode_0_6[9];
      end
      default : begin
        _zz_fifoMode_9 = _zz_fifoMode_0_7[9];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_10 = _zz_fifoMode_0[10];
      end
      3'b001 : begin
        _zz_fifoMode_10 = _zz_fifoMode_0_1[10];
      end
      3'b010 : begin
        _zz_fifoMode_10 = _zz_fifoMode_0_2[10];
      end
      3'b011 : begin
        _zz_fifoMode_10 = _zz_fifoMode_0_3[10];
      end
      3'b100 : begin
        _zz_fifoMode_10 = _zz_fifoMode_0_4[10];
      end
      3'b101 : begin
        _zz_fifoMode_10 = _zz_fifoMode_0_5[10];
      end
      3'b110 : begin
        _zz_fifoMode_10 = _zz_fifoMode_0_6[10];
      end
      default : begin
        _zz_fifoMode_10 = _zz_fifoMode_0_7[10];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_11 = _zz_fifoMode_0[11];
      end
      3'b001 : begin
        _zz_fifoMode_11 = _zz_fifoMode_0_1[11];
      end
      3'b010 : begin
        _zz_fifoMode_11 = _zz_fifoMode_0_2[11];
      end
      3'b011 : begin
        _zz_fifoMode_11 = _zz_fifoMode_0_3[11];
      end
      3'b100 : begin
        _zz_fifoMode_11 = _zz_fifoMode_0_4[11];
      end
      3'b101 : begin
        _zz_fifoMode_11 = _zz_fifoMode_0_5[11];
      end
      3'b110 : begin
        _zz_fifoMode_11 = _zz_fifoMode_0_6[11];
      end
      default : begin
        _zz_fifoMode_11 = _zz_fifoMode_0_7[11];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_12 = _zz_fifoMode_0[12];
      end
      3'b001 : begin
        _zz_fifoMode_12 = _zz_fifoMode_0_1[12];
      end
      3'b010 : begin
        _zz_fifoMode_12 = _zz_fifoMode_0_2[12];
      end
      3'b011 : begin
        _zz_fifoMode_12 = _zz_fifoMode_0_3[12];
      end
      3'b100 : begin
        _zz_fifoMode_12 = _zz_fifoMode_0_4[12];
      end
      3'b101 : begin
        _zz_fifoMode_12 = _zz_fifoMode_0_5[12];
      end
      3'b110 : begin
        _zz_fifoMode_12 = _zz_fifoMode_0_6[12];
      end
      default : begin
        _zz_fifoMode_12 = _zz_fifoMode_0_7[12];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_13 = _zz_fifoMode_0[13];
      end
      3'b001 : begin
        _zz_fifoMode_13 = _zz_fifoMode_0_1[13];
      end
      3'b010 : begin
        _zz_fifoMode_13 = _zz_fifoMode_0_2[13];
      end
      3'b011 : begin
        _zz_fifoMode_13 = _zz_fifoMode_0_3[13];
      end
      3'b100 : begin
        _zz_fifoMode_13 = _zz_fifoMode_0_4[13];
      end
      3'b101 : begin
        _zz_fifoMode_13 = _zz_fifoMode_0_5[13];
      end
      3'b110 : begin
        _zz_fifoMode_13 = _zz_fifoMode_0_6[13];
      end
      default : begin
        _zz_fifoMode_13 = _zz_fifoMode_0_7[13];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_14 = _zz_fifoMode_0[14];
      end
      3'b001 : begin
        _zz_fifoMode_14 = _zz_fifoMode_0_1[14];
      end
      3'b010 : begin
        _zz_fifoMode_14 = _zz_fifoMode_0_2[14];
      end
      3'b011 : begin
        _zz_fifoMode_14 = _zz_fifoMode_0_3[14];
      end
      3'b100 : begin
        _zz_fifoMode_14 = _zz_fifoMode_0_4[14];
      end
      3'b101 : begin
        _zz_fifoMode_14 = _zz_fifoMode_0_5[14];
      end
      3'b110 : begin
        _zz_fifoMode_14 = _zz_fifoMode_0_6[14];
      end
      default : begin
        _zz_fifoMode_14 = _zz_fifoMode_0_7[14];
      end
    endcase
  end

  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_fifoMode_15 = _zz_fifoMode_0[15];
      end
      3'b001 : begin
        _zz_fifoMode_15 = _zz_fifoMode_0_1[15];
      end
      3'b010 : begin
        _zz_fifoMode_15 = _zz_fifoMode_0_2[15];
      end
      3'b011 : begin
        _zz_fifoMode_15 = _zz_fifoMode_0_3[15];
      end
      3'b100 : begin
        _zz_fifoMode_15 = _zz_fifoMode_0_4[15];
      end
      3'b101 : begin
        _zz_fifoMode_15 = _zz_fifoMode_0_5[15];
      end
      3'b110 : begin
        _zz_fifoMode_15 = _zz_fifoMode_0_6[15];
      end
      default : begin
        _zz_fifoMode_15 = _zz_fifoMode_0_7[15];
      end
    endcase
  end

  assign fifoMode_0 = _zz_fifoMode_0_8;
  assign fifoMode_1 = _zz_fifoMode_1;
  assign fifoMode_2 = _zz_fifoMode_2;
  assign fifoMode_3 = _zz_fifoMode_3;
  assign fifoMode_4 = _zz_fifoMode_4;
  assign fifoMode_5 = _zz_fifoMode_5;
  assign fifoMode_6 = _zz_fifoMode_6;
  assign fifoMode_7 = _zz_fifoMode_7;
  assign fifoMode_8 = _zz_fifoMode_8;
  assign fifoMode_9 = _zz_fifoMode_9;
  assign fifoMode_10 = _zz_fifoMode_10;
  assign fifoMode_11 = _zz_fifoMode_11;
  assign fifoMode_12 = _zz_fifoMode_12;
  assign fifoMode_13 = _zz_fifoMode_13;
  assign fifoMode_14 = _zz_fifoMode_14;
  assign fifoMode_15 = _zz_fifoMode_15;
  assign rxFifoWrAddrOH_0 = (io_rxFifoWrAddr == 4'b0000);
  assign rxFifoWrAddrOH_1 = (io_rxFifoWrAddr == 4'b0001);
  assign rxFifoWrAddrOH_2 = (io_rxFifoWrAddr == 4'b0010);
  assign rxFifoWrAddrOH_3 = (io_rxFifoWrAddr == 4'b0011);
  assign rxFifoWrAddrOH_4 = (io_rxFifoWrAddr == 4'b0100);
  assign rxFifoWrAddrOH_5 = (io_rxFifoWrAddr == 4'b0101);
  assign rxFifoWrAddrOH_6 = (io_rxFifoWrAddr == 4'b0110);
  assign rxFifoWrAddrOH_7 = (io_rxFifoWrAddr == 4'b0111);
  assign rxFifoWrAddrOH_8 = (io_rxFifoWrAddr == 4'b1000);
  assign rxFifoWrAddrOH_9 = (io_rxFifoWrAddr == 4'b1001);
  assign rxFifoWrAddrOH_10 = (io_rxFifoWrAddr == 4'b1010);
  assign rxFifoWrAddrOH_11 = (io_rxFifoWrAddr == 4'b1011);
  assign rxFifoWrAddrOH_12 = (io_rxFifoWrAddr == 4'b1100);
  assign rxFifoWrAddrOH_13 = (io_rxFifoWrAddr == 4'b1101);
  assign rxFifoWrAddrOH_14 = (io_rxFifoWrAddr == 4'b1110);
  assign rxFifoWrAddrOH_15 = 1'b0;
  assign txFifoWrAddrOH_0 = 1'b0;
  assign txFifoWrAddrOH_1 = (io_txFifoWrAddr == 4'b1110);
  assign txFifoWrAddrOH_2 = (io_txFifoWrAddr == 4'b1101);
  assign txFifoWrAddrOH_3 = (io_txFifoWrAddr == 4'b1100);
  assign txFifoWrAddrOH_4 = (io_txFifoWrAddr == 4'b1011);
  assign txFifoWrAddrOH_5 = (io_txFifoWrAddr == 4'b1010);
  assign txFifoWrAddrOH_6 = (io_txFifoWrAddr == 4'b1001);
  assign txFifoWrAddrOH_7 = (io_txFifoWrAddr == 4'b1000);
  assign txFifoWrAddrOH_8 = (io_txFifoWrAddr == 4'b0111);
  assign txFifoWrAddrOH_9 = (io_txFifoWrAddr == 4'b0110);
  assign txFifoWrAddrOH_10 = (io_txFifoWrAddr == 4'b0101);
  assign txFifoWrAddrOH_11 = (io_txFifoWrAddr == 4'b0100);
  assign txFifoWrAddrOH_12 = (io_txFifoWrAddr == 4'b0011);
  assign txFifoWrAddrOH_13 = (io_txFifoWrAddr == 4'b0010);
  assign txFifoWrAddrOH_14 = (io_txFifoWrAddr == 4'b0001);
  assign txFifoWrAddrOH_15 = (io_txFifoWrAddr == 4'b0000);
  assign rxFifoWrEn_0 = ((io_rxFifoWrEn && rxFifoWrAddrOH_0) && (fifoMode_0 == 1'b0));
  assign rxFifoWrEn_1 = ((io_rxFifoWrEn && rxFifoWrAddrOH_1) && (fifoMode_1 == 1'b0));
  assign rxFifoWrEn_2 = ((io_rxFifoWrEn && rxFifoWrAddrOH_2) && (fifoMode_2 == 1'b0));
  assign rxFifoWrEn_3 = ((io_rxFifoWrEn && rxFifoWrAddrOH_3) && (fifoMode_3 == 1'b0));
  assign rxFifoWrEn_4 = ((io_rxFifoWrEn && rxFifoWrAddrOH_4) && (fifoMode_4 == 1'b0));
  assign rxFifoWrEn_5 = ((io_rxFifoWrEn && rxFifoWrAddrOH_5) && (fifoMode_5 == 1'b0));
  assign rxFifoWrEn_6 = ((io_rxFifoWrEn && rxFifoWrAddrOH_6) && (fifoMode_6 == 1'b0));
  assign rxFifoWrEn_7 = ((io_rxFifoWrEn && rxFifoWrAddrOH_7) && (fifoMode_7 == 1'b0));
  assign rxFifoWrEn_8 = ((io_rxFifoWrEn && rxFifoWrAddrOH_8) && (fifoMode_8 == 1'b0));
  assign rxFifoWrEn_9 = ((io_rxFifoWrEn && rxFifoWrAddrOH_9) && (fifoMode_9 == 1'b0));
  assign rxFifoWrEn_10 = ((io_rxFifoWrEn && rxFifoWrAddrOH_10) && (fifoMode_10 == 1'b0));
  assign rxFifoWrEn_11 = ((io_rxFifoWrEn && rxFifoWrAddrOH_11) && (fifoMode_11 == 1'b0));
  assign rxFifoWrEn_12 = ((io_rxFifoWrEn && rxFifoWrAddrOH_12) && (fifoMode_12 == 1'b0));
  assign rxFifoWrEn_13 = ((io_rxFifoWrEn && rxFifoWrAddrOH_13) && (fifoMode_13 == 1'b0));
  assign rxFifoWrEn_14 = ((io_rxFifoWrEn && rxFifoWrAddrOH_14) && (fifoMode_14 == 1'b0));
  assign rxFifoWrEn_15 = ((io_rxFifoWrEn && rxFifoWrAddrOH_15) && (fifoMode_15 == 1'b0));
  assign txFifoWrEn_0 = ((io_txFifoWrEn && txFifoWrAddrOH_0) && (fifoMode_0 == 1'b1));
  assign txFifoWrEn_1 = ((io_txFifoWrEn && txFifoWrAddrOH_1) && (fifoMode_1 == 1'b1));
  assign txFifoWrEn_2 = ((io_txFifoWrEn && txFifoWrAddrOH_2) && (fifoMode_2 == 1'b1));
  assign txFifoWrEn_3 = ((io_txFifoWrEn && txFifoWrAddrOH_3) && (fifoMode_3 == 1'b1));
  assign txFifoWrEn_4 = ((io_txFifoWrEn && txFifoWrAddrOH_4) && (fifoMode_4 == 1'b1));
  assign txFifoWrEn_5 = ((io_txFifoWrEn && txFifoWrAddrOH_5) && (fifoMode_5 == 1'b1));
  assign txFifoWrEn_6 = ((io_txFifoWrEn && txFifoWrAddrOH_6) && (fifoMode_6 == 1'b1));
  assign txFifoWrEn_7 = ((io_txFifoWrEn && txFifoWrAddrOH_7) && (fifoMode_7 == 1'b1));
  assign txFifoWrEn_8 = ((io_txFifoWrEn && txFifoWrAddrOH_8) && (fifoMode_8 == 1'b1));
  assign txFifoWrEn_9 = ((io_txFifoWrEn && txFifoWrAddrOH_9) && (fifoMode_9 == 1'b1));
  assign txFifoWrEn_10 = ((io_txFifoWrEn && txFifoWrAddrOH_10) && (fifoMode_10 == 1'b1));
  assign txFifoWrEn_11 = ((io_txFifoWrEn && txFifoWrAddrOH_11) && (fifoMode_11 == 1'b1));
  assign txFifoWrEn_12 = ((io_txFifoWrEn && txFifoWrAddrOH_12) && (fifoMode_12 == 1'b1));
  assign txFifoWrEn_13 = ((io_txFifoWrEn && txFifoWrAddrOH_13) && (fifoMode_13 == 1'b1));
  assign txFifoWrEn_14 = ((io_txFifoWrEn && txFifoWrAddrOH_14) && (fifoMode_14 == 1'b1));
  assign txFifoWrEn_15 = ((io_txFifoWrEn && txFifoWrAddrOH_15) && (fifoMode_15 == 1'b1));
  assign fifoWrEn_0 = (rxFifoWrEn_0 || txFifoWrEn_0);
  assign fifoWrEn_1 = (rxFifoWrEn_1 || txFifoWrEn_1);
  assign fifoWrEn_2 = (rxFifoWrEn_2 || txFifoWrEn_2);
  assign fifoWrEn_3 = (rxFifoWrEn_3 || txFifoWrEn_3);
  assign fifoWrEn_4 = (rxFifoWrEn_4 || txFifoWrEn_4);
  assign fifoWrEn_5 = (rxFifoWrEn_5 || txFifoWrEn_5);
  assign fifoWrEn_6 = (rxFifoWrEn_6 || txFifoWrEn_6);
  assign fifoWrEn_7 = (rxFifoWrEn_7 || txFifoWrEn_7);
  assign fifoWrEn_8 = (rxFifoWrEn_8 || txFifoWrEn_8);
  assign fifoWrEn_9 = (rxFifoWrEn_9 || txFifoWrEn_9);
  assign fifoWrEn_10 = (rxFifoWrEn_10 || txFifoWrEn_10);
  assign fifoWrEn_11 = (rxFifoWrEn_11 || txFifoWrEn_11);
  assign fifoWrEn_12 = (rxFifoWrEn_12 || txFifoWrEn_12);
  assign fifoWrEn_13 = (rxFifoWrEn_13 || txFifoWrEn_13);
  assign fifoWrEn_14 = (rxFifoWrEn_14 || txFifoWrEn_14);
  assign fifoWrEn_15 = (rxFifoWrEn_15 || txFifoWrEn_15);
  assign fifoWrData_0 = (fifoMode_0 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_1 = (fifoMode_1 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_2 = (fifoMode_2 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_3 = (fifoMode_3 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_4 = (fifoMode_4 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_5 = (fifoMode_5 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_6 = (fifoMode_6 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_7 = (fifoMode_7 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_8 = (fifoMode_8 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_9 = (fifoMode_9 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_10 = (fifoMode_10 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_11 = (fifoMode_11 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_12 = (fifoMode_12 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_13 = (fifoMode_13 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_14 = (fifoMode_14 ? io_txFifoWrData : io_rxFifoWrData);
  assign fifoWrData_15 = (fifoMode_15 ? io_txFifoWrData : io_rxFifoWrData);
  always @(*) begin
    case(io_rxFifoRdAddr)
      4'b0000 : begin
        _zz_io_rxFifoRdData = fifoRegs_0;
      end
      4'b0001 : begin
        _zz_io_rxFifoRdData = fifoRegs_1;
      end
      4'b0010 : begin
        _zz_io_rxFifoRdData = fifoRegs_2;
      end
      4'b0011 : begin
        _zz_io_rxFifoRdData = fifoRegs_3;
      end
      4'b0100 : begin
        _zz_io_rxFifoRdData = fifoRegs_4;
      end
      4'b0101 : begin
        _zz_io_rxFifoRdData = fifoRegs_5;
      end
      4'b0110 : begin
        _zz_io_rxFifoRdData = fifoRegs_6;
      end
      4'b0111 : begin
        _zz_io_rxFifoRdData = fifoRegs_7;
      end
      4'b1000 : begin
        _zz_io_rxFifoRdData = fifoRegs_8;
      end
      4'b1001 : begin
        _zz_io_rxFifoRdData = fifoRegs_9;
      end
      4'b1010 : begin
        _zz_io_rxFifoRdData = fifoRegs_10;
      end
      4'b1011 : begin
        _zz_io_rxFifoRdData = fifoRegs_11;
      end
      4'b1100 : begin
        _zz_io_rxFifoRdData = fifoRegs_12;
      end
      4'b1101 : begin
        _zz_io_rxFifoRdData = fifoRegs_13;
      end
      4'b1110 : begin
        _zz_io_rxFifoRdData = fifoRegs_14;
      end
      default : begin
        _zz_io_rxFifoRdData = fifoRegs_0;
      end
    endcase
  end

  assign io_rxFifoRdData = _zz_io_rxFifoRdData;
  always @(*) begin
    case(io_txFifoRdAddr)
      4'b0000 : begin
        _zz_io_txFifoRdData = fifoRegs_15;
      end
      4'b0001 : begin
        _zz_io_txFifoRdData = fifoRegs_14;
      end
      4'b0010 : begin
        _zz_io_txFifoRdData = fifoRegs_13;
      end
      4'b0011 : begin
        _zz_io_txFifoRdData = fifoRegs_12;
      end
      4'b0100 : begin
        _zz_io_txFifoRdData = fifoRegs_11;
      end
      4'b0101 : begin
        _zz_io_txFifoRdData = fifoRegs_10;
      end
      4'b0110 : begin
        _zz_io_txFifoRdData = fifoRegs_9;
      end
      4'b0111 : begin
        _zz_io_txFifoRdData = fifoRegs_8;
      end
      4'b1000 : begin
        _zz_io_txFifoRdData = fifoRegs_7;
      end
      4'b1001 : begin
        _zz_io_txFifoRdData = fifoRegs_6;
      end
      4'b1010 : begin
        _zz_io_txFifoRdData = fifoRegs_5;
      end
      4'b1011 : begin
        _zz_io_txFifoRdData = fifoRegs_4;
      end
      4'b1100 : begin
        _zz_io_txFifoRdData = fifoRegs_3;
      end
      4'b1101 : begin
        _zz_io_txFifoRdData = fifoRegs_2;
      end
      4'b1110 : begin
        _zz_io_txFifoRdData = fifoRegs_1;
      end
      default : begin
        _zz_io_txFifoRdData = fifoRegs_15;
      end
    endcase
  end

  assign io_txFifoRdData = _zz_io_txFifoRdData;
  assign rxStartIndex_0_1 = 4'b0000;
  assign rxStartIndex_1_1 = 4'b0000;
  assign rxStartIndex_2_1 = 4'b0000;
  assign rxStartIndex_3_1 = 4'b0000;
  assign rxStartIndex_4_1 = 4'b0000;
  assign rxStartIndex_5_1 = 4'b0000;
  assign rxStartIndex_6_1 = 4'b0000;
  assign rxStartIndex_7_1 = 4'b0000;
  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_io_rxStartIndex = rxStartIndex_0_1;
      end
      3'b001 : begin
        _zz_io_rxStartIndex = rxStartIndex_1_1;
      end
      3'b010 : begin
        _zz_io_rxStartIndex = rxStartIndex_2_1;
      end
      3'b011 : begin
        _zz_io_rxStartIndex = rxStartIndex_3_1;
      end
      3'b100 : begin
        _zz_io_rxStartIndex = rxStartIndex_4_1;
      end
      3'b101 : begin
        _zz_io_rxStartIndex = rxStartIndex_5_1;
      end
      3'b110 : begin
        _zz_io_rxStartIndex = rxStartIndex_6_1;
      end
      default : begin
        _zz_io_rxStartIndex = rxStartIndex_7_1;
      end
    endcase
  end

  assign io_rxStartIndex = _zz_io_rxStartIndex;
  assign rxEndIndex_0_1 = {1'd0, _zz_rxEndIndex_0_1};
  assign rxEndIndex_1_1 = _zz_rxEndIndex_1_1;
  assign rxEndIndex_2_1 = _zz_rxEndIndex_2_1;
  assign rxEndIndex_3_1 = _zz_rxEndIndex_3_1;
  assign rxEndIndex_4_1 = _zz_rxEndIndex_4_1;
  assign rxEndIndex_5_1 = {2'd0, _zz_rxEndIndex_5_1};
  assign rxEndIndex_6_1 = {3'd0, _zz_rxEndIndex_6_1};
  assign rxEndIndex_7_1 = 4'b0000;
  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_io_rxEndIndex = rxEndIndex_0_1;
      end
      3'b001 : begin
        _zz_io_rxEndIndex = rxEndIndex_1_1;
      end
      3'b010 : begin
        _zz_io_rxEndIndex = rxEndIndex_2_1;
      end
      3'b011 : begin
        _zz_io_rxEndIndex = rxEndIndex_3_1;
      end
      3'b100 : begin
        _zz_io_rxEndIndex = rxEndIndex_4_1;
      end
      3'b101 : begin
        _zz_io_rxEndIndex = rxEndIndex_5_1;
      end
      3'b110 : begin
        _zz_io_rxEndIndex = rxEndIndex_6_1;
      end
      default : begin
        _zz_io_rxEndIndex = rxEndIndex_7_1;
      end
    endcase
  end

  assign io_rxEndIndex = _zz_io_rxEndIndex;
  assign rxMaxCount_0_1 = _zz_rxMaxCount_0_1;
  assign rxMaxCount_1_1 = _zz_rxMaxCount_1_1;
  assign rxMaxCount_2_1 = _zz_rxMaxCount_2_1;
  assign rxMaxCount_3_1 = _zz_rxMaxCount_3_1;
  assign rxMaxCount_4_1 = _zz_rxMaxCount_4_1;
  assign rxMaxCount_5_1 = {1'd0, _zz_rxMaxCount_5_1};
  assign rxMaxCount_6_1 = {2'd0, _zz_rxMaxCount_6_1};
  assign rxMaxCount_7_1 = {3'd0, _zz_rxMaxCount_7_1};
  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_io_rxMaxCount = rxMaxCount_0_1;
      end
      3'b001 : begin
        _zz_io_rxMaxCount = rxMaxCount_1_1;
      end
      3'b010 : begin
        _zz_io_rxMaxCount = rxMaxCount_2_1;
      end
      3'b011 : begin
        _zz_io_rxMaxCount = rxMaxCount_3_1;
      end
      3'b100 : begin
        _zz_io_rxMaxCount = rxMaxCount_4_1;
      end
      3'b101 : begin
        _zz_io_rxMaxCount = rxMaxCount_5_1;
      end
      3'b110 : begin
        _zz_io_rxMaxCount = rxMaxCount_6_1;
      end
      default : begin
        _zz_io_rxMaxCount = rxMaxCount_7_1;
      end
    endcase
  end

  assign io_rxMaxCount = _zz_io_rxMaxCount;
  assign txStartIndex_0_1 = 4'b0000;
  assign txStartIndex_1_1 = 4'b0000;
  assign txStartIndex_2_1 = 4'b0000;
  assign txStartIndex_3_1 = 4'b0000;
  assign txStartIndex_4_1 = 4'b0000;
  assign txStartIndex_5_1 = 4'b0000;
  assign txStartIndex_6_1 = 4'b0000;
  assign txStartIndex_7_1 = 4'b0000;
  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_io_txStartIndex = txStartIndex_0_1;
      end
      3'b001 : begin
        _zz_io_txStartIndex = txStartIndex_1_1;
      end
      3'b010 : begin
        _zz_io_txStartIndex = txStartIndex_2_1;
      end
      3'b011 : begin
        _zz_io_txStartIndex = txStartIndex_3_1;
      end
      3'b100 : begin
        _zz_io_txStartIndex = txStartIndex_4_1;
      end
      3'b101 : begin
        _zz_io_txStartIndex = txStartIndex_5_1;
      end
      3'b110 : begin
        _zz_io_txStartIndex = txStartIndex_6_1;
      end
      default : begin
        _zz_io_txStartIndex = txStartIndex_7_1;
      end
    endcase
  end

  assign io_txStartIndex = _zz_io_txStartIndex;
  assign txEndIndex_0_1 = {1'd0, _zz_txEndIndex_0_1};
  assign txEndIndex_1_1 = 4'b0000;
  assign txEndIndex_2_1 = {3'd0, _zz_txEndIndex_2_1};
  assign txEndIndex_3_1 = {2'd0, _zz_txEndIndex_3_1};
  assign txEndIndex_4_1 = {1'd0, _zz_txEndIndex_4_1};
  assign txEndIndex_5_1 = _zz_txEndIndex_5_1;
  assign txEndIndex_6_1 = _zz_txEndIndex_6_1;
  assign txEndIndex_7_1 = _zz_txEndIndex_7_1;
  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_io_txEndIndex = txEndIndex_0_1;
      end
      3'b001 : begin
        _zz_io_txEndIndex = txEndIndex_1_1;
      end
      3'b010 : begin
        _zz_io_txEndIndex = txEndIndex_2_1;
      end
      3'b011 : begin
        _zz_io_txEndIndex = txEndIndex_3_1;
      end
      3'b100 : begin
        _zz_io_txEndIndex = txEndIndex_4_1;
      end
      3'b101 : begin
        _zz_io_txEndIndex = txEndIndex_5_1;
      end
      3'b110 : begin
        _zz_io_txEndIndex = txEndIndex_6_1;
      end
      default : begin
        _zz_io_txEndIndex = txEndIndex_7_1;
      end
    endcase
  end

  assign io_txEndIndex = _zz_io_txEndIndex;
  assign txMaxCount_0_1 = _zz_txMaxCount_0_1;
  assign txMaxCount_1_1 = {3'd0, _zz_txMaxCount_1_1};
  assign txMaxCount_2_1 = {2'd0, _zz_txMaxCount_2_1};
  assign txMaxCount_3_1 = {1'd0, _zz_txMaxCount_3_1};
  assign txMaxCount_4_1 = {1'd0, _zz_txMaxCount_4_1};
  assign txMaxCount_5_1 = _zz_txMaxCount_5_1;
  assign txMaxCount_6_1 = _zz_txMaxCount_6_1;
  assign txMaxCount_7_1 = _zz_txMaxCount_7_1;
  always @(*) begin
    case(io_fifoMode)
      3'b000 : begin
        _zz_io_txMaxCount = txMaxCount_0_1;
      end
      3'b001 : begin
        _zz_io_txMaxCount = txMaxCount_1_1;
      end
      3'b010 : begin
        _zz_io_txMaxCount = txMaxCount_2_1;
      end
      3'b011 : begin
        _zz_io_txMaxCount = txMaxCount_3_1;
      end
      3'b100 : begin
        _zz_io_txMaxCount = txMaxCount_4_1;
      end
      3'b101 : begin
        _zz_io_txMaxCount = txMaxCount_5_1;
      end
      3'b110 : begin
        _zz_io_txMaxCount = txMaxCount_6_1;
      end
      default : begin
        _zz_io_txMaxCount = txMaxCount_7_1;
      end
    endcase
  end

  assign io_txMaxCount = _zz_io_txMaxCount;
  always @(posedge clk) begin
    if(fifoWrEn_0) begin
      fifoRegs_0 <= fifoWrData_0;
    end
    if(fifoWrEn_1) begin
      fifoRegs_1 <= fifoWrData_1;
    end
    if(fifoWrEn_2) begin
      fifoRegs_2 <= fifoWrData_2;
    end
    if(fifoWrEn_3) begin
      fifoRegs_3 <= fifoWrData_3;
    end
    if(fifoWrEn_4) begin
      fifoRegs_4 <= fifoWrData_4;
    end
    if(fifoWrEn_5) begin
      fifoRegs_5 <= fifoWrData_5;
    end
    if(fifoWrEn_6) begin
      fifoRegs_6 <= fifoWrData_6;
    end
    if(fifoWrEn_7) begin
      fifoRegs_7 <= fifoWrData_7;
    end
    if(fifoWrEn_8) begin
      fifoRegs_8 <= fifoWrData_8;
    end
    if(fifoWrEn_9) begin
      fifoRegs_9 <= fifoWrData_9;
    end
    if(fifoWrEn_10) begin
      fifoRegs_10 <= fifoWrData_10;
    end
    if(fifoWrEn_11) begin
      fifoRegs_11 <= fifoWrData_11;
    end
    if(fifoWrEn_12) begin
      fifoRegs_12 <= fifoWrData_12;
    end
    if(fifoWrEn_13) begin
      fifoRegs_13 <= fifoWrData_13;
    end
    if(fifoWrEn_14) begin
      fifoRegs_14 <= fifoWrData_14;
    end
    if(fifoWrEn_15) begin
      fifoRegs_15 <= fifoWrData_15;
    end
  end


endmodule

module UartCommFilter (
  input      [2:0]    io_phyFilterMode,
  input               io_phyInverted,
  input               io_bitTick,
  input               io_samplerTick,
  output              io_phy_txd,
  input               io_phy_rxd,
  output              io_phy_rts,
  input               io_phy_cts,
  output              io_phy_dtr,
  input               io_phy_dsr,
  input               io_phy_dcd,
  input               io_phy_ri,
  input               io_ttl_txd,
  output              io_ttl_rxd,
  input               io_ttl_rts,
  output              io_ttl_cts,
  input               io_ttl_dtr,
  output              io_ttl_dsr,
  output              io_ttl_dcd,
  output              io_ttl_ri,
  input               clk,
  input               resetOut
);

  wire                ctsFilter_io_a;
  wire                ctsFilter_io_b;
  wire                ctsFilter_io_c;
  wire                dsrFilter_io_a;
  wire                dsrFilter_io_b;
  wire                dsrFilter_io_c;
  wire                dcdFilter_io_a;
  wire                dcdFilter_io_b;
  wire                dcdFilter_io_c;
  wire                riFilter_io_a;
  wire                riFilter_io_b;
  wire                riFilter_io_c;
  wire                rxdMaj3_A;
  wire                rxdMaj3_B;
  wire                rxdMaj3_C;
  wire                rxdMaj5_io_a;
  wire                rxdMaj5_io_b;
  wire                rxdMaj5_io_c;
  wire                rxdMaj5_io_d;
  wire                rxdMaj5_io_e;
  wire                rxdMaj7_io_a;
  wire                rxdMaj7_io_b;
  wire                rxdMaj7_io_c;
  wire                rxdMaj7_io_d;
  wire                rxdMaj7_io_e;
  wire                rxdMaj7_io_f;
  wire                rxdMaj7_io_g;
  wire                rxdAndNor3_io_a;
  wire                rxdAndNor3_io_b;
  wire                rxdAndNor3_io_c;
  wire                rxdAndNor5_io_a;
  wire                rxdAndNor5_io_b;
  wire                rxdAndNor5_io_c;
  wire                rxdAndNor5_io_d;
  wire                rxdAndNor5_io_e;
  wire                rxdAndNor7_io_a;
  wire                rxdAndNor7_io_b;
  wire                rxdAndNor7_io_c;
  wire                rxdAndNor7_io_d;
  wire                rxdAndNor7_io_e;
  wire                rxdAndNor7_io_f;
  wire                rxdAndNor7_io_g;
  wire                ctsFilter_io_o;
  wire                dsrFilter_io_o;
  wire                dcdFilter_io_o;
  wire                riFilter_io_o;
  wire                rxdMaj3_X;
  wire                rxdMaj5_io_o;
  wire                rxdMaj7_io_o;
  wire                rxdAndNor3_io_o;
  wire                rxdAndNor5_io_o;
  wire                rxdAndNor7_io_o;
  wire       [2:0]    _zz__zz_A;
  wire       [2:0]    _zz__zz_io_a_4;
  wire       [2:0]    _zz__zz_io_a_5;
  wire       [2:0]    _zz__zz_io_a_6;
  wire       [2:0]    _zz__zz_io_a_7;
  wire       [2:0]    _zz__zz_io_a_8;
  wire                ctsHistory_0;
  reg                 ctsHistory_1;
  reg                 ctsHistory_2;
  wire       [2:0]    _zz_io_a;
  wire                dsrHistory_0;
  reg                 dsrHistory_1;
  reg                 dsrHistory_2;
  wire       [2:0]    _zz_io_a_1;
  wire                dcdHistory_0;
  reg                 dcdHistory_1;
  reg                 dcdHistory_2;
  wire       [2:0]    _zz_io_a_2;
  wire                riHistory_0;
  reg                 riHistory_1;
  reg                 riHistory_2;
  wire       [2:0]    _zz_io_a_3;
  reg                 rxd1;
  reg                 rxdDff2;
  wire                rxdHistory_0;
  reg                 rxdHistory_1;
  reg                 rxdHistory_2;
  reg                 rxdHistory_3;
  reg                 rxdHistory_4;
  reg                 rxdHistory_5;
  reg                 rxdHistory_6;
  wire       [2:0]    _zz_A;
  wire       [4:0]    _zz_io_a_4;
  wire       [6:0]    _zz_io_a_5;
  wire       [2:0]    _zz_io_a_6;
  wire       [4:0]    _zz_io_a_7;
  wire       [6:0]    _zz_io_a_8;
  reg                 rxd;

  assign _zz__zz_A = {riHistory_2,{riHistory_1,riHistory_0}};
  assign _zz__zz_io_a_4 = {riHistory_2,{riHistory_1,riHistory_0}};
  assign _zz__zz_io_a_5 = {riHistory_2,{riHistory_1,riHistory_0}};
  assign _zz__zz_io_a_6 = {riHistory_2,{riHistory_1,riHistory_0}};
  assign _zz__zz_io_a_7 = {riHistory_2,{riHistory_1,riHistory_0}};
  assign _zz__zz_io_a_8 = {riHistory_2,{riHistory_1,riHistory_0}};
  AndNor3 ctsFilter (
    .io_a     (ctsFilter_io_a), //i
    .io_b     (ctsFilter_io_b), //i
    .io_c     (ctsFilter_io_c), //i
    .io_o     (ctsFilter_io_o), //o
    .clk      (clk           ), //i
    .resetOut (resetOut      )  //i
  );
  AndNor3 dsrFilter (
    .io_a     (dsrFilter_io_a), //i
    .io_b     (dsrFilter_io_b), //i
    .io_c     (dsrFilter_io_c), //i
    .io_o     (dsrFilter_io_o), //o
    .clk      (clk           ), //i
    .resetOut (resetOut      )  //i
  );
  AndNor3 dcdFilter (
    .io_a     (dcdFilter_io_a), //i
    .io_b     (dcdFilter_io_b), //i
    .io_c     (dcdFilter_io_c), //i
    .io_o     (dcdFilter_io_o), //o
    .clk      (clk           ), //i
    .resetOut (resetOut      )  //i
  );
  AndNor3 riFilter (
    .io_a     (riFilter_io_a), //i
    .io_b     (riFilter_io_b), //i
    .io_c     (riFilter_io_c), //i
    .io_o     (riFilter_io_o), //o
    .clk      (clk          ), //i
    .resetOut (resetOut     )  //i
  );
  (* keep , syn_keep *) sky130_fd_sc_hd__maj3 rxdMaj3 (
    .A (rxdMaj3_A), //i
    .B (rxdMaj3_B), //i
    .C (rxdMaj3_C), //i
    .X (rxdMaj3_X)  //o
  );
  MAJ5 rxdMaj5 (
    .io_a       (rxdMaj5_io_a), //i
    .io_b       (rxdMaj5_io_b), //i
    .io_c       (rxdMaj5_io_c), //i
    .io_d       (rxdMaj5_io_d), //i
    .io_e       (rxdMaj5_io_e), //i
    .io_maj3abc (rxdMaj3_X   ), //i
    .io_o       (rxdMaj5_io_o)  //o
  );
  MAJ7 rxdMaj7 (
    .io_a         (rxdMaj7_io_a), //i
    .io_b         (rxdMaj7_io_b), //i
    .io_c         (rxdMaj7_io_c), //i
    .io_d         (rxdMaj7_io_d), //i
    .io_e         (rxdMaj7_io_e), //i
    .io_f         (rxdMaj7_io_f), //i
    .io_g         (rxdMaj7_io_g), //i
    .io_maj5abcde (rxdMaj5_io_o), //i
    .io_o         (rxdMaj7_io_o)  //o
  );
  AndNor3 rxdAndNor3 (
    .io_a     (rxdAndNor3_io_a), //i
    .io_b     (rxdAndNor3_io_b), //i
    .io_c     (rxdAndNor3_io_c), //i
    .io_o     (rxdAndNor3_io_o), //o
    .clk      (clk            ), //i
    .resetOut (resetOut       )  //i
  );
  AndNor5 rxdAndNor5 (
    .io_a     (rxdAndNor5_io_a), //i
    .io_b     (rxdAndNor5_io_b), //i
    .io_c     (rxdAndNor5_io_c), //i
    .io_d     (rxdAndNor5_io_d), //i
    .io_e     (rxdAndNor5_io_e), //i
    .io_o     (rxdAndNor5_io_o), //o
    .clk      (clk            ), //i
    .resetOut (resetOut       )  //i
  );
  AndNor7 rxdAndNor7 (
    .io_a     (rxdAndNor7_io_a), //i
    .io_b     (rxdAndNor7_io_b), //i
    .io_c     (rxdAndNor7_io_c), //i
    .io_d     (rxdAndNor7_io_d), //i
    .io_e     (rxdAndNor7_io_e), //i
    .io_f     (rxdAndNor7_io_f), //i
    .io_g     (rxdAndNor7_io_g), //i
    .io_o     (rxdAndNor7_io_o), //o
    .clk      (clk            ), //i
    .resetOut (resetOut       )  //i
  );
  assign ctsHistory_0 = io_phy_cts;
  assign _zz_io_a = {ctsHistory_2,{ctsHistory_1,ctsHistory_0}};
  assign ctsFilter_io_a = _zz_io_a[0];
  assign ctsFilter_io_b = _zz_io_a[1];
  assign ctsFilter_io_c = _zz_io_a[2];
  assign dsrHistory_0 = io_phy_dsr;
  assign _zz_io_a_1 = {dsrHistory_2,{dsrHistory_1,dsrHistory_0}};
  assign dsrFilter_io_a = _zz_io_a_1[0];
  assign dsrFilter_io_b = _zz_io_a_1[1];
  assign dsrFilter_io_c = _zz_io_a_1[2];
  assign dcdHistory_0 = io_phy_dcd;
  assign _zz_io_a_2 = {dcdHistory_2,{dcdHistory_1,dcdHistory_0}};
  assign dcdFilter_io_a = _zz_io_a_2[0];
  assign dcdFilter_io_b = _zz_io_a_2[1];
  assign dcdFilter_io_c = _zz_io_a_2[2];
  assign riHistory_0 = io_phy_ri;
  assign _zz_io_a_3 = {riHistory_2,{riHistory_1,riHistory_0}};
  assign riFilter_io_a = _zz_io_a_3[0];
  assign riFilter_io_b = _zz_io_a_3[1];
  assign riFilter_io_c = _zz_io_a_3[2];
  assign rxdHistory_0 = rxd1;
  assign _zz_A = _zz__zz_A;
  assign rxdMaj3_A = _zz_A[0];
  assign rxdMaj3_B = _zz_A[1];
  assign rxdMaj3_C = _zz_A[2];
  assign _zz_io_a_4 = {2'd0, _zz__zz_io_a_4};
  assign rxdMaj5_io_a = _zz_io_a_4[0];
  assign rxdMaj5_io_b = _zz_io_a_4[1];
  assign rxdMaj5_io_c = _zz_io_a_4[2];
  assign rxdMaj5_io_d = _zz_io_a_4[3];
  assign rxdMaj5_io_e = _zz_io_a_4[4];
  assign _zz_io_a_5 = {4'd0, _zz__zz_io_a_5};
  assign rxdMaj7_io_a = _zz_io_a_5[0];
  assign rxdMaj7_io_b = _zz_io_a_5[1];
  assign rxdMaj7_io_c = _zz_io_a_5[2];
  assign rxdMaj7_io_d = _zz_io_a_5[3];
  assign rxdMaj7_io_e = _zz_io_a_5[4];
  assign rxdMaj7_io_f = _zz_io_a_5[5];
  assign rxdMaj7_io_g = _zz_io_a_5[6];
  assign _zz_io_a_6 = _zz__zz_io_a_6;
  assign rxdAndNor3_io_a = _zz_io_a_6[0];
  assign rxdAndNor3_io_b = _zz_io_a_6[1];
  assign rxdAndNor3_io_c = _zz_io_a_6[2];
  assign _zz_io_a_7 = {2'd0, _zz__zz_io_a_7};
  assign rxdAndNor5_io_a = _zz_io_a_7[0];
  assign rxdAndNor5_io_b = _zz_io_a_7[1];
  assign rxdAndNor5_io_c = _zz_io_a_7[2];
  assign rxdAndNor5_io_d = _zz_io_a_7[3];
  assign rxdAndNor5_io_e = _zz_io_a_7[4];
  assign _zz_io_a_8 = {4'd0, _zz__zz_io_a_8};
  assign rxdAndNor7_io_a = _zz_io_a_8[0];
  assign rxdAndNor7_io_b = _zz_io_a_8[1];
  assign rxdAndNor7_io_c = _zz_io_a_8[2];
  assign rxdAndNor7_io_d = _zz_io_a_8[3];
  assign rxdAndNor7_io_e = _zz_io_a_8[4];
  assign rxdAndNor7_io_f = _zz_io_a_8[5];
  assign rxdAndNor7_io_g = _zz_io_a_8[6];
  always @(*) begin
    case(io_phyFilterMode)
      3'b000 : begin
        rxd = rxdMaj7_io_o;
      end
      3'b001 : begin
        rxd = rxdMaj5_io_o;
      end
      3'b010 : begin
        rxd = rxdMaj3_X;
      end
      3'b011 : begin
        rxd = rxdDff2;
      end
      3'b100 : begin
        rxd = rxdAndNor7_io_o;
      end
      3'b101 : begin
        rxd = rxdAndNor5_io_o;
      end
      3'b110 : begin
        rxd = rxdAndNor3_io_o;
      end
      default : begin
        rxd = io_phy_rxd;
      end
    endcase
  end

  assign io_phy_txd = (io_ttl_txd ^ io_phyInverted);
  assign io_ttl_rxd = (rxd ^ io_phyInverted);
  assign io_phy_rts = (io_ttl_rts ^ io_phyInverted);
  assign io_ttl_cts = (ctsFilter_io_o ^ io_phyInverted);
  assign io_phy_dtr = (io_ttl_dtr ^ io_phyInverted);
  assign io_ttl_dsr = (dsrFilter_io_o ^ io_phyInverted);
  assign io_ttl_dcd = (dcdFilter_io_o ^ io_phyInverted);
  assign io_ttl_ri = (riFilter_io_o ^ io_phyInverted);
  always @(posedge clk) begin
    if(io_bitTick) begin
      ctsHistory_1 <= ctsHistory_0;
    end
    if(io_bitTick) begin
      ctsHistory_2 <= ctsHistory_1;
    end
    if(io_bitTick) begin
      dsrHistory_1 <= dsrHistory_0;
    end
    if(io_bitTick) begin
      dsrHistory_2 <= dsrHistory_1;
    end
    if(io_bitTick) begin
      dcdHistory_1 <= dcdHistory_0;
    end
    if(io_bitTick) begin
      dcdHistory_2 <= dcdHistory_1;
    end
    if(io_bitTick) begin
      riHistory_1 <= riHistory_0;
    end
    if(io_bitTick) begin
      riHistory_2 <= riHistory_1;
    end
    rxd1 <= io_phy_rxd;
    rxdDff2 <= rxd1;
    if(io_samplerTick) begin
      rxdHistory_1 <= rxdHistory_0;
    end
    if(io_samplerTick) begin
      rxdHistory_2 <= rxdHistory_1;
    end
    if(io_samplerTick) begin
      rxdHistory_3 <= rxdHistory_2;
    end
    if(io_samplerTick) begin
      rxdHistory_4 <= rxdHistory_3;
    end
    if(io_samplerTick) begin
      rxdHistory_5 <= rxdHistory_4;
    end
    if(io_samplerTick) begin
      rxdHistory_6 <= rxdHistory_5;
    end
  end


endmodule

module UartClocking (
  input      [2:0]    io_prescaler,
  input      [7:0]    io_divisor,
  input      [2:0]    io_phyFilterMode,
  input               io_samplerReset,
  output reg          io_samplerTick,
  output reg          io_bitTick,
  input               clk,
  input               resetOut
);

  reg        [7:0]    prescaleCtr;
  reg        [7:0]    divisorCtr;
  reg        [3:0]    bitCtr;
  wire                when_UartClocking_l29;
  wire                _zz_prescaleTick;
  reg                 _zz_prescaleTick_regNext;
  wire                _zz_prescaleTick_1;
  reg                 _zz_prescaleTick_1_regNext;
  wire                _zz_prescaleTick_2;
  reg                 _zz_prescaleTick_2_regNext;
  wire                _zz_prescaleTick_3;
  reg                 _zz_prescaleTick_3_regNext;
  wire                _zz_prescaleTick_4;
  reg                 _zz_prescaleTick_4_regNext;
  wire                _zz_prescaleTick_5;
  reg                 _zz_prescaleTick_5_regNext;
  wire                _zz_prescaleTick_6;
  reg                 _zz_prescaleTick_6_regNext;
  reg                 prescaleTick;
  wire                when_UartClocking_l45;
  wire                when_UartClocking_l57;

  always @(*) begin
    io_samplerTick = 1'b0;
    if(prescaleTick) begin
      if(when_UartClocking_l45) begin
        io_samplerTick = 1'b1;
      end
    end
  end

  always @(*) begin
    io_bitTick = 1'b0;
    if(!io_samplerReset) begin
      if(io_samplerTick) begin
        if(when_UartClocking_l57) begin
          io_bitTick = 1'b1;
        end
      end
    end
  end

  assign when_UartClocking_l29 = 1'b1;
  assign _zz_prescaleTick = prescaleCtr[0];
  assign _zz_prescaleTick_1 = prescaleCtr[1];
  assign _zz_prescaleTick_2 = prescaleCtr[2];
  assign _zz_prescaleTick_3 = prescaleCtr[3];
  assign _zz_prescaleTick_4 = prescaleCtr[4];
  assign _zz_prescaleTick_5 = prescaleCtr[5];
  assign _zz_prescaleTick_6 = prescaleCtr[6];
  always @(*) begin
    case(io_prescaler)
      3'b000 : begin
        prescaleTick = 1'b1;
      end
      3'b001 : begin
        prescaleTick = (_zz_prescaleTick && (! _zz_prescaleTick_regNext));
      end
      3'b010 : begin
        prescaleTick = (_zz_prescaleTick_1 && (! _zz_prescaleTick_1_regNext));
      end
      3'b011 : begin
        prescaleTick = (_zz_prescaleTick_2 && (! _zz_prescaleTick_2_regNext));
      end
      3'b100 : begin
        prescaleTick = (_zz_prescaleTick_3 && (! _zz_prescaleTick_3_regNext));
      end
      3'b101 : begin
        prescaleTick = (_zz_prescaleTick_4 && (! _zz_prescaleTick_4_regNext));
      end
      3'b110 : begin
        prescaleTick = (_zz_prescaleTick_5 && (! _zz_prescaleTick_5_regNext));
      end
      default : begin
        prescaleTick = (_zz_prescaleTick_6 && (! _zz_prescaleTick_6_regNext));
      end
    endcase
  end

  assign when_UartClocking_l45 = (divisorCtr == 8'h00);
  assign when_UartClocking_l57 = (bitCtr == 4'b0000);
  always @(posedge clk) begin
    if(!resetOut) begin
      prescaleCtr <= 8'h00;
      divisorCtr <= 8'h00;
      bitCtr <= 4'b0000;
    end else begin
      if(when_UartClocking_l29) begin
        prescaleCtr <= (prescaleCtr - 8'h01);
      end
      if(prescaleTick) begin
        if(when_UartClocking_l45) begin
          divisorCtr <= io_divisor;
        end else begin
          divisorCtr <= (divisorCtr - 8'h01);
        end
      end
      if(io_samplerReset) begin
        bitCtr <= 4'b0111;
      end else begin
        if(io_samplerTick) begin
          bitCtr <= (bitCtr - 4'b0001);
        end
      end
    end
  end

  always @(posedge clk) begin
    _zz_prescaleTick_regNext <= _zz_prescaleTick;
    _zz_prescaleTick_1_regNext <= _zz_prescaleTick_1;
    _zz_prescaleTick_2_regNext <= _zz_prescaleTick_2;
    _zz_prescaleTick_3_regNext <= _zz_prescaleTick_3;
    _zz_prescaleTick_4_regNext <= _zz_prescaleTick_4;
    _zz_prescaleTick_5_regNext <= _zz_prescaleTick_5;
    _zz_prescaleTick_6_regNext <= _zz_prescaleTick_6;
  end


endmodule

module UartBusCtrl (
  input      [7:0]    io_dataIn,
  output     [7:0]    io_dataOut,
  output     [7:0]    io_dataOe,
  input      [1:0]    io_mode,
  output reg          io_writeEnable,
  output reg          io_readEnable,
  input      [7:0]    io_readData,
  output     [7:0]    io_regAddr,
  input               clk,
  input               resetOut
);

  wire       [4:0]    _zz_regAddr;
  reg                 oe;
  reg                 lastWasWrite;
  reg        [4:0]    regAddr;
  wire                when_UartDevice_l840;
  wire                when_UartDevice_l849;
  wire                when_UartDevice_l842;
  wire                when_UartDevice_l847;

  assign _zz_regAddr = io_dataIn[4:0];
  always @(*) begin
    io_writeEnable = 1'b0;
    if(!when_UartDevice_l840) begin
      if(!when_UartDevice_l842) begin
        if(when_UartDevice_l847) begin
          if(when_UartDevice_l849) begin
            io_writeEnable = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    io_readEnable = 1'b0;
    if(!when_UartDevice_l840) begin
      if(when_UartDevice_l842) begin
        io_readEnable = 1'b1;
      end
    end
  end

  assign when_UartDevice_l840 = (io_mode == 2'b01);
  assign when_UartDevice_l849 = (lastWasWrite == 1'b0);
  assign when_UartDevice_l842 = (io_mode == 2'b10);
  assign when_UartDevice_l847 = (io_mode == 2'b11);
  assign io_dataOut = io_readData;
  assign io_dataOe = (oe ? 8'hff : 8'h00);
  assign io_regAddr = {3'd0, regAddr};
  always @(posedge clk) begin
    if(!resetOut) begin
      oe <= 1'b0;
    end else begin
      oe <= 1'b0;
      if(!when_UartDevice_l840) begin
        if(when_UartDevice_l842) begin
          oe <= 1'b1;
        end
      end
    end
  end

  always @(posedge clk) begin
    lastWasWrite <= 1'b0;
    if(when_UartDevice_l840) begin
      regAddr <= _zz_regAddr;
    end else begin
      if(!when_UartDevice_l842) begin
        if(when_UartDevice_l847) begin
          lastWasWrite <= 1'b1;
        end
      end
    end
  end


endmodule

module UartRegisterCtrl (
  input      [7:0]    io_addr,
  input      [7:0]    io_dataIn,
  output     [7:0]    io_dataOut,
  input               io_writeEnable,
  input               io_readEnable,
  input               io_txFifoState_empty,
  input               io_txFifoState_fullinone,
  input               io_txFifoState_full,
  output     [8:0]    io_txFifo_inPayload,
  output reg          io_txFifo_inValid,
  input               io_txFifo_inReady,
  input               io_rxFifoState_empty,
  input               io_rxFifoState_fullinone,
  input               io_rxFifoState_full,
  input      [8:0]    io_rxFifo_outPayload,
  input               io_rxFifo_outValid,
  output reg          io_rxFifo_outReady,
  output reg          io_fifoReset,
  output reg [2:0]    io_fifoMode,
  input               io_txBusySignal,
  input               io_rxOverrunSignal,
  input               io_dcdSignal,
  input               io_riSignal,
  input               io_dsrSignal,
  input               io_ctsSignal,
  output     [1:0]    io_fctlMode,
  output              io_rtsSignal,
  output     [7:0]    io_baudDivisor,
  output     [2:0]    io_baudPrescaler,
  output              io_phyInverted,
  output     [2:0]    io_phyFilterMode,
  output     [6:0]    io_regInterruptControl,
  output     [6:0]    io_regInterruptStatus,
  output     [2:0]    io_dataLenMode,
  output     [1:0]    io_stopBitMode,
  output              io_parityEnable,
  output     [1:0]    io_parityMode,
  output reg          io_resetCommandStrobe,
  input               clk,
  input               resetOut
);

  wire       [6:0]    _zz_regIntrSta;
  reg        [7:0]    reg007;
  wire       [2:0]    regDataLen;
  wire       [1:0]    regStopBit;
  wire       [2:0]    regParity;
  reg        [6:0]    regIntrCtl;
  reg        [6:0]    regIntrSta;
  reg        [3:0]    regModemCtrlHistory;
  reg        [3:0]    regModemCtrlChanged;
  wire                when_UartDevice_l597;
  wire                when_UartDevice_l600;
  reg                 riSignalNext;
  wire                riSignalRise;
  wire                when_UartDevice_l610;
  wire       [4:0]    regModmCrl;
  wire                recvBreakCondx;
  wire                sendBreakCondx;
  wire                rxEnabled;
  wire                txEnabled;
  wire       [2:0]    regFifoMode;
  reg                 regFifoRxEnable;
  reg                 regFifoTxEnable;
  wire       [7:0]    regBaudDsor;
  wire       [2:0]    regBaudPres;
  wire                regPhyInverted;
  wire       [2:0]    regPhyFilterMode;
  wire       [7:0]    regViewInterruptStatus;
  wire       [7:0]    regViewInterruptControl;
  wire       [7:0]    regViewLineStatus;
  reg        [7:0]    regViewModemStatus;
  reg        [7:0]    regViewLineDispline;
  reg        [7:0]    regViewFifoControl;
  reg        [7:0]    regViewBaudDivisor;
  reg        [7:0]    regViewBaudPrescaler;
  reg        [7:0]    regViewAutoBaud;
  wire                rxFrameError;
  wire                rxParityError;
  reg                 rxOverrunError;
  reg                 txOverrun;
  reg        [0:0]    txHolderBit9;
  reg        [7:0]    rxStatus;
  reg        [7:0]    txStatus;
  reg        [7:0]    rtxStatus;
  reg        [7:0]    regAddrMuxed;
  wire       [7:0]    addr;
  wire                when_UartDevice_l761;
  wire                when_UartDevice_l763;
  wire                when_UartDevice_l770;
  wire                when_UartDevice_l772;
  wire                when_UartDevice_l775;
  wire                when_UartDevice_l776;
  wire                when_UartDevice_l781;
  wire                when_UartDevice_l782;
  wire                when_UartDevice_l784;
  wire                when_UartDevice_l786;
  wire                when_UartDevice_l791;
  wire                when_UartDevice_l793;
  wire                when_UartDevice_l795;
  wire                when_UartDevice_l797;
  wire                when_UartDevice_l802;
  wire                when_UartDevice_l808;
  wire                when_UartDevice_l810;

  assign _zz_regIntrSta = io_dataIn[6:0];
  always @(*) begin
    io_resetCommandStrobe = 1'b0;
    if(io_writeEnable) begin
      if(!when_UartDevice_l761) begin
        if(!when_UartDevice_l763) begin
          if(!when_UartDevice_l770) begin
            if(!when_UartDevice_l772) begin
              if(!when_UartDevice_l775) begin
                if(!when_UartDevice_l776) begin
                  if(!when_UartDevice_l781) begin
                    if(!when_UartDevice_l782) begin
                      if(!when_UartDevice_l784) begin
                        if(!when_UartDevice_l786) begin
                          if(!when_UartDevice_l791) begin
                            if(!when_UartDevice_l793) begin
                              if(!when_UartDevice_l795) begin
                                if(when_UartDevice_l797) begin
                                  io_resetCommandStrobe = io_dataIn[7];
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  assign regDataLen = 3'b000;
  assign io_dataLenMode = regDataLen;
  assign regStopBit = 2'b00;
  assign io_stopBitMode = regStopBit;
  assign regParity = 3'b000;
  assign io_parityEnable = regParity[0];
  assign io_parityMode = regParity[2 : 1];
  assign when_UartDevice_l597 = (io_ctsSignal ^ regModemCtrlHistory[0]);
  assign when_UartDevice_l600 = (io_dsrSignal ^ regModemCtrlHistory[1]);
  assign riSignalRise = (io_riSignal && (! riSignalNext));
  assign when_UartDevice_l610 = (io_dcdSignal ^ regModemCtrlHistory[3]);
  assign regModmCrl = 5'h00;
  assign io_fctlMode = 2'b00;
  assign io_rtsSignal = 1'b0;
  assign io_regInterruptControl = regIntrCtl;
  assign io_regInterruptStatus = regIntrSta;
  assign recvBreakCondx = 1'b0;
  assign sendBreakCondx = 1'b0;
  assign rxEnabled = 1'b0;
  assign txEnabled = 1'b0;
  assign regFifoMode = 3'b000;
  always @(*) begin
    io_fifoMode = regFifoMode;
    if(io_writeEnable) begin
      if(!when_UartDevice_l761) begin
        if(!when_UartDevice_l763) begin
          if(!when_UartDevice_l770) begin
            if(!when_UartDevice_l772) begin
              if(!when_UartDevice_l775) begin
                if(!when_UartDevice_l776) begin
                  if(!when_UartDevice_l781) begin
                    if(!when_UartDevice_l782) begin
                      if(!when_UartDevice_l784) begin
                        if(when_UartDevice_l786) begin
                          io_fifoMode = io_dataIn[2 : 0];
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    io_fifoReset = 1'b0;
    if(io_writeEnable) begin
      if(!when_UartDevice_l761) begin
        if(!when_UartDevice_l763) begin
          if(!when_UartDevice_l770) begin
            if(!when_UartDevice_l772) begin
              if(!when_UartDevice_l775) begin
                if(!when_UartDevice_l776) begin
                  if(!when_UartDevice_l781) begin
                    if(!when_UartDevice_l782) begin
                      if(!when_UartDevice_l784) begin
                        if(when_UartDevice_l786) begin
                          io_fifoReset = 1'b1;
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  assign regBaudDsor = 8'h00;
  assign regBaudPres = 3'b000;
  assign regPhyInverted = 1'b0;
  assign regPhyFilterMode = 3'b000;
  assign io_baudDivisor = regBaudDsor;
  assign io_baudPrescaler = regBaudPres;
  assign io_phyInverted = regPhyInverted;
  assign io_phyFilterMode = regPhyFilterMode;
  assign regViewInterruptStatus = {1'd0, regIntrSta};
  assign regViewInterruptControl = {1'd0, regIntrCtl};
  assign regViewLineStatus[7 : 0] = 8'h00;
  always @(*) begin
    regViewModemStatus[3 : 0] = regModemCtrlChanged;
    regViewModemStatus[4] = io_ctsSignal;
    regViewModemStatus[5] = io_dsrSignal;
    regViewModemStatus[6] = riSignalNext;
    regViewModemStatus[7] = io_dcdSignal;
  end

  always @(*) begin
    regViewLineDispline[2 : 0] = regDataLen;
    regViewLineDispline[4 : 3] = regStopBit;
    regViewLineDispline[7 : 5] = regParity;
    if(io_writeEnable) begin
      if(!when_UartDevice_l761) begin
        if(!when_UartDevice_l763) begin
          if(!when_UartDevice_l770) begin
            if(!when_UartDevice_l772) begin
              if(!when_UartDevice_l775) begin
                if(!when_UartDevice_l776) begin
                  if(!when_UartDevice_l781) begin
                    if(!when_UartDevice_l782) begin
                      if(when_UartDevice_l784) begin
                        regViewLineDispline = io_dataIn;
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    regViewFifoControl[2 : 0] = regFifoMode;
    regViewFifoControl[5 : 3] = 3'b000;
    regViewFifoControl[6 : 6] = regFifoRxEnable;
    regViewFifoControl[7 : 7] = regFifoTxEnable;
  end

  always @(*) begin
    regViewBaudDivisor[7 : 0] = regBaudDsor;
    if(io_writeEnable) begin
      if(!when_UartDevice_l761) begin
        if(!when_UartDevice_l763) begin
          if(!when_UartDevice_l770) begin
            if(!when_UartDevice_l772) begin
              if(!when_UartDevice_l775) begin
                if(!when_UartDevice_l776) begin
                  if(!when_UartDevice_l781) begin
                    if(!when_UartDevice_l782) begin
                      if(!when_UartDevice_l784) begin
                        if(!when_UartDevice_l786) begin
                          if(!when_UartDevice_l791) begin
                            if(!when_UartDevice_l793) begin
                              if(when_UartDevice_l795) begin
                                regViewBaudDivisor = io_dataIn;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    regViewBaudPrescaler[2 : 0] = regBaudPres;
    regViewBaudPrescaler[3 : 3] = regPhyInverted;
    regViewBaudPrescaler[6 : 4] = regPhyFilterMode;
    regViewBaudPrescaler[7 : 7] = 1'b0;
    if(io_writeEnable) begin
      if(!when_UartDevice_l761) begin
        if(!when_UartDevice_l763) begin
          if(!when_UartDevice_l770) begin
            if(!when_UartDevice_l772) begin
              if(!when_UartDevice_l775) begin
                if(!when_UartDevice_l776) begin
                  if(!when_UartDevice_l781) begin
                    if(!when_UartDevice_l782) begin
                      if(!when_UartDevice_l784) begin
                        if(!when_UartDevice_l786) begin
                          if(!when_UartDevice_l791) begin
                            if(!when_UartDevice_l793) begin
                              if(!when_UartDevice_l795) begin
                                if(when_UartDevice_l797) begin
                                  regViewBaudPrescaler = io_dataIn;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    regViewAutoBaud[7 : 0] = 8'h00;
    if(io_writeEnable) begin
      if(!when_UartDevice_l761) begin
        if(!when_UartDevice_l763) begin
          if(!when_UartDevice_l770) begin
            if(!when_UartDevice_l772) begin
              if(!when_UartDevice_l775) begin
                if(!when_UartDevice_l776) begin
                  if(!when_UartDevice_l781) begin
                    if(!when_UartDevice_l782) begin
                      if(!when_UartDevice_l784) begin
                        if(!when_UartDevice_l786) begin
                          if(!when_UartDevice_l791) begin
                            if(when_UartDevice_l793) begin
                              regViewAutoBaud = io_dataIn;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  assign rxFrameError = 1'b0;
  assign rxParityError = 1'b0;
  always @(*) begin
    io_txFifo_inValid = 1'b0;
    if(io_writeEnable) begin
      if(!when_UartDevice_l761) begin
        if(when_UartDevice_l763) begin
          if(io_txFifo_inReady) begin
            io_txFifo_inValid = 1'b1;
          end
        end
      end
    end
  end

  assign io_txFifo_inPayload = {txHolderBit9,io_dataIn};
  always @(*) begin
    io_rxFifo_outReady = 1'b0;
    if(!io_writeEnable) begin
      if(io_readEnable) begin
        if(when_UartDevice_l802) begin
          if(io_rxFifo_outValid) begin
            io_rxFifo_outReady = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    rxStatus[0] = io_rxFifo_outPayload[8];
    rxStatus[1] = io_rxFifoState_full;
    rxStatus[2] = io_rxFifoState_fullinone;
    rxStatus[3] = io_rxFifoState_empty;
    rxStatus[4] = rxFrameError;
    rxStatus[5] = rxParityError;
    rxStatus[6] = rxOverrunError;
    rxStatus[7] = io_rxFifo_outValid;
  end

  always @(*) begin
    txStatus[0] = (! io_txFifoState_full);
    txStatus[1] = io_txFifoState_fullinone;
    txStatus[2] = io_txFifoState_empty;
    txStatus[3] = io_txBusySignal;
    txStatus[6 : 4] = 3'b000;
    txStatus[7] = txOverrun;
  end

  always @(*) begin
    rtxStatus[1 : 0] = 2'b00;
    rtxStatus[2] = recvBreakCondx;
    rtxStatus[3] = sendBreakCondx;
    rtxStatus[4 : 4] = 1'b0;
    rtxStatus[5] = rxOverrunError;
    rtxStatus[6] = rxEnabled;
    rtxStatus[7] = txEnabled;
  end

  always @(*) begin
    case(io_addr)
      8'h00 : begin
        regAddrMuxed = rxStatus;
      end
      8'h01 : begin
        regAddrMuxed = io_rxFifo_outPayload[7:0];
      end
      8'h02 : begin
        regAddrMuxed = regViewInterruptStatus;
      end
      8'h03 : begin
        regAddrMuxed = regViewInterruptControl;
      end
      8'h04 : begin
        regAddrMuxed = txStatus;
      end
      8'h05 : begin
        regAddrMuxed = regViewModemStatus;
      end
      8'h06 : begin
        regAddrMuxed = regViewLineStatus;
      end
      8'h07 : begin
        regAddrMuxed = reg007;
      end
      8'h08 : begin
        regAddrMuxed = regViewLineDispline;
      end
      8'h09 : begin
        regAddrMuxed = io_rxFifo_outPayload[7:0];
      end
      8'h0a : begin
        regAddrMuxed = regViewInterruptStatus;
      end
      8'h0b : begin
        regAddrMuxed = regViewFifoControl;
      end
      8'h0c : begin
        regAddrMuxed = rtxStatus;
      end
      8'h0d : begin
        regAddrMuxed = regViewAutoBaud;
      end
      8'h0e : begin
        regAddrMuxed = regViewBaudDivisor;
      end
      8'h0f : begin
        regAddrMuxed = regViewBaudPrescaler;
      end
      default : begin
        regAddrMuxed = io_rxFifo_outPayload[7:0];
      end
    endcase
  end

  assign io_dataOut = regAddrMuxed;
  assign addr = io_addr;
  assign when_UartDevice_l761 = (addr == 8'h00);
  assign when_UartDevice_l763 = (addr == 8'h01);
  assign when_UartDevice_l770 = (addr == 8'h02);
  assign when_UartDevice_l772 = (addr == 8'h03);
  assign when_UartDevice_l775 = (addr == 8'h04);
  assign when_UartDevice_l776 = (addr == 8'h05);
  assign when_UartDevice_l781 = (addr == 8'h06);
  assign when_UartDevice_l782 = (addr == 8'h07);
  assign when_UartDevice_l784 = (addr == 8'h08);
  assign when_UartDevice_l786 = (addr == 8'h0b);
  assign when_UartDevice_l791 = (addr == 8'h0c);
  assign when_UartDevice_l793 = (addr == 8'h0d);
  assign when_UartDevice_l795 = (addr == 8'h0e);
  assign when_UartDevice_l797 = (addr == 8'h0f);
  assign when_UartDevice_l802 = (addr == 8'h01);
  assign when_UartDevice_l808 = (addr == 8'h02);
  assign when_UartDevice_l810 = (addr == 8'h05);
  always @(posedge clk) begin
    if(!resetOut) begin
      reg007 <= 8'h00;
      regIntrCtl <= 7'h00;
      regIntrSta <= 7'h00;
      regModemCtrlHistory <= 4'b0000;
      regModemCtrlChanged <= 4'b0000;
      regFifoRxEnable <= 1'b0;
      regFifoTxEnable <= 1'b0;
      rxOverrunError <= 1'b0;
      txOverrun <= 1'b0;
    end else begin
      if(when_UartDevice_l597) begin
        regModemCtrlChanged[0] <= 1'b1;
      end
      if(when_UartDevice_l600) begin
        regModemCtrlChanged[1] <= 1'b1;
      end
      if(riSignalRise) begin
        regModemCtrlChanged[2] <= 1'b1;
      end
      if(when_UartDevice_l610) begin
        regModemCtrlChanged[3] <= 1'b1;
      end
      if(io_rxOverrunSignal) begin
        rxOverrunError <= 1'b1;
      end
      if(io_writeEnable) begin
        if(!when_UartDevice_l761) begin
          if(when_UartDevice_l763) begin
            if(!io_txFifo_inReady) begin
              txOverrun <= 1'b1;
            end
          end else begin
            if(when_UartDevice_l770) begin
              regIntrSta <= (regIntrSta & (~ _zz_regIntrSta));
            end else begin
              if(when_UartDevice_l772) begin
                regIntrCtl <= io_dataIn[6:0];
              end else begin
                if(!when_UartDevice_l775) begin
                  if(when_UartDevice_l776) begin
                    regModemCtrlHistory[2] <= (regModemCtrlHistory[2] && (! io_dataIn[6]));
                  end else begin
                    if(!when_UartDevice_l781) begin
                      if(when_UartDevice_l782) begin
                        reg007 <= io_dataIn;
                      end else begin
                        if(!when_UartDevice_l784) begin
                          if(when_UartDevice_l786) begin
                            regFifoRxEnable <= io_dataIn[6];
                            regFifoTxEnable <= io_dataIn[7];
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if(io_readEnable) begin
          if(!when_UartDevice_l802) begin
            if(when_UartDevice_l808) begin
              regIntrSta <= 7'h00;
            end else begin
              if(when_UartDevice_l810) begin
                regModemCtrlHistory[0] <= io_ctsSignal;
                regModemCtrlHistory[1] <= io_dsrSignal;
                regModemCtrlHistory[3] <= io_dcdSignal;
              end
            end
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    riSignalNext <= io_riSignal;
    if(io_writeEnable) begin
      if(when_UartDevice_l761) begin
        txHolderBit9 <= io_dataIn[0 : 0];
      end
    end
  end


endmodule

module AndNor7 (
  input               io_a,
  input               io_b,
  input               io_c,
  input               io_d,
  input               io_e,
  input               io_f,
  input               io_g,
  output              io_o,
  input               clk,
  input               resetOut
);

  reg                 state;
  wire                and7;
  wire                nor7;

  assign and7 = (&{io_g,{io_f,{io_e,{io_d,{io_c,{io_b,io_a}}}}}});
  assign nor7 = (! (|{io_g,{io_f,{io_e,{io_d,{io_c,{io_b,io_a}}}}}}));
  assign io_o = state;
  always @(posedge clk) begin
    if(nor7) begin
      state <= 1'b0;
    end else begin
      if(and7) begin
        state <= 1'b1;
      end
    end
  end


endmodule

module AndNor5 (
  input               io_a,
  input               io_b,
  input               io_c,
  input               io_d,
  input               io_e,
  output              io_o,
  input               clk,
  input               resetOut
);

  reg                 state;
  wire                and5;
  wire                nor5;

  assign and5 = (&{io_e,{io_d,{io_c,{io_b,io_a}}}});
  assign nor5 = (! (|{io_e,{io_d,{io_c,{io_b,io_a}}}}));
  assign io_o = state;
  always @(posedge clk) begin
    if(nor5) begin
      state <= 1'b0;
    end else begin
      if(and5) begin
        state <= 1'b1;
      end
    end
  end


endmodule

//AndNor3_4 replaced by AndNor3

module MAJ7 (
  input               io_a,
  input               io_b,
  input               io_c,
  input               io_d,
  input               io_e,
  input               io_f,
  input               io_g,
  input               io_maj5abcde,
  output              io_o
);

  wire                maj3fg_A;
  wire                maj3fg_B;
  wire                maj3fg_C;
  wire                maj3fg_X;
  wire                or3;
  wire                or2;
  wire       [2:0]    _zz_A;

  (* keep , syn_keep *) sky130_fd_sc_hd__maj3 maj3fg (
    .A (maj3fg_A), //i
    .B (maj3fg_B), //i
    .C (maj3fg_C), //i
    .X (maj3fg_X)  //o
  );
  assign or3 = (|{io_c,{io_b,io_a}});
  assign or2 = (|{io_g,io_f});
  assign _zz_A = {io_d,{io_e,or3}};
  assign maj3fg_A = _zz_A[0];
  assign maj3fg_B = _zz_A[1];
  assign maj3fg_C = _zz_A[2];
  assign io_o = ((io_maj5abcde && or2) || maj3fg_X);

endmodule

module MAJ5 (
  input               io_a,
  input               io_b,
  input               io_c,
  input               io_d,
  input               io_e,
  input               io_maj3abc,
  output              io_o
);

  wire                maj3de_A;
  wire                maj3de_B;
  wire                maj3de_C;
  wire                maj3de_X;
  wire                or3;
  wire                or2;
  wire       [2:0]    _zz_A;

  (* keep , syn_keep *) sky130_fd_sc_hd__maj3 maj3de (
    .A (maj3de_A), //i
    .B (maj3de_B), //i
    .C (maj3de_C), //i
    .X (maj3de_X)  //o
  );
  assign or3 = (|{io_c,{io_b,io_a}});
  assign or2 = (|{io_e,io_d});
  assign _zz_A = {io_d,{io_e,or3}};
  assign maj3de_A = _zz_A[0];
  assign maj3de_B = _zz_A[1];
  assign maj3de_C = _zz_A[2];
  assign io_o = ((io_maj3abc && or2) || maj3de_X);

endmodule

//AndNor3_3 replaced by AndNor3

//AndNor3_2 replaced by AndNor3

//AndNor3_1 replaced by AndNor3

module AndNor3 (
  input               io_a,
  input               io_b,
  input               io_c,
  output              io_o,
  input               clk,
  input               resetOut
);

  reg                 state;
  wire                and3;
  wire                nor3;

  assign and3 = (&{io_c,{io_b,io_a}});
  assign nor3 = (! (|{io_c,{io_b,io_a}}));
  assign io_o = state;
  always @(posedge clk) begin
    if(nor3) begin
      state <= 1'b0;
    end else begin
      if(and3) begin
        state <= 1'b1;
      end
    end
  end


endmodule
