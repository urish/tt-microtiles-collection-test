# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles




@cocotb.test()
async def test_one(dut):
    dut._log.info("min 1")
  
    # Our example module doesn't use clock and reset, but we show how to use them here anyway.
    clock = Clock(dut.clk, 20, units="us")
    cocotb.start_soon(clock.start())
    dut.rst_n.value = 0
    await ClockCycles(dut.clk,1)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk,2)
    dut.rst_n.value = 0
    dut.ena.value  = 1
    dut.ui_in.value = 0b0000_0001
    await ClockCycles(dut.clk,1)
    dut.ui_in.value  = 0b0000_0000
    await ClockCycles(dut.clk,2)
    dut.ui_in.value  = 0b0000_0001
    await ClockCycles(dut.clk,2)
    dut.ui_in.value = 0b0000_0000
    await ClockCycles(dut.clk,1)
    dut.ui_in.value  = 0b0000_0001
    await ClockCycles(dut.clk,1)
    dut.ui_in.value  = 0b0000_0000
    await ClockCycles(dut.clk,10)
    dut._log.info(dut.uo_out.value)

