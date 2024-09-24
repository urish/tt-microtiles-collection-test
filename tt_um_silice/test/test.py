# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 40 ns (25 MHz)
    clock = Clock(dut.clk, 40, units="ns")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project")

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 1)

    # prev_vs = '0'
    # frames = 0
    # ticks = 0
    # while frames < 2:
    #     ticks = ticks + 1
    #     # wait one cycle
    #     await ClockCycles(dut.clk, 1)
    #     # check vertical sync
    #     if dut.uo_out.value.binstr[7-3] == '1' and prev_vs == '0':
    #         print("vsynch on ",ticks)
    #     if dut.uo_out.value.binstr[7-3] == '0' and prev_vs == '1':
    #         print("vsynch off ",ticks)
    #         frames = frames + 1
    #     prev_vs = dut.uo_out.value.binstr[7-3]
