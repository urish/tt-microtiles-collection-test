# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):

    # Set the clock period to 40 us (25 MHz)
    clock = Clock(dut.clk, 40, units="ns")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    # Basic check for valid vga sync signals
    dut._log.info("Waiting for hsync and vsync to be both zero")
    for i in range(420000):
        await ClockCycles(dut.clk, 1)
        hsync = dut.uo_out[7].value.integer
        vsync = dut.uo_out[3].value.integer
        if hsync == 0 and vsync == 0:
            break
    else:
        assert False, "hsync and vsync are never both zero"

    dut._log.info("Waiting for hsync and vsync to be both one")
    for i in range(420000):
        await ClockCycles(dut.clk, 1)
        hsync = dut.uo_out[7].value.integer
        vsync = dut.uo_out[3].value.integer
        if hsync == 1 and vsync == 1:
            break
    else:
        assert False, "hsync and vsync are never both one"

    dut._log.info("Verifying hsync and vsync data")
    for i in range(525):
        hsync_row = []
        vsync_row = []
        dut._log.info(f"Line {i}")
        for j in range(800):
            assert dut.uo_out.value.is_resolvable
            assert dut.uio_out.value.is_resolvable
            assert dut.uio_oe.value.integer == 0xff
            hsync_row.append(dut.uo_out[7].value.integer)
            vsync_row.append(dut.uo_out[3].value.integer)
            await ClockCycles(dut.clk, 1)
        assert hsync_row == [1] * 96 + [0] * 704, "Unexpected hsync data"
        if i == 0:
            assert vsync_row == [1] * 800, "Unexpected vsync data in first line"
        elif i == 1:
            assert vsync_row == [1] * 144 + [0] * 656, "Unexpected vsync data in second line"
        elif i == 524:
            assert vsync_row == [0] * 144 + [1] * 656, "Unexpected vsync data in last line"
        else:
            assert vsync_row == [0] * 800, "Unexpected vsync data"

