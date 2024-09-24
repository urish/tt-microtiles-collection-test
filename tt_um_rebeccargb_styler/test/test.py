# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")

    LINE = 0
    CTRL = 1
    BMAP = 2
    ATTR = 4

    async def sty_write(a, d):
        # Set address and data
        dut.ui_in.value = 0xC0 | a
        dut.uio_in.value = d & 0xFF
        await ClockCycles(dut.clk, 1)
        # Enable write
        dut.ui_in.value = 0x40 | a
        await ClockCycles(dut.clk, 1)
        # Disable write
        dut.ui_in.value = 0xC0 | a
        await ClockCycles(dut.clk, 1)

    async def sty_read(a):
        # Enable output
        dut.ui_in.value = 0x80 | a
        await ClockCycles(dut.clk, 1)
        r1 = dut.uo_out.value & 0xFF
        r2 = dut.uio_out.value & 0xFF
        # Disable output
        dut.ui_in.value = 0xC0 | a
        await ClockCycles(dut.clk, 1)
        assert r1 == r2
        return r1

    async def bmp_write(d):
        await sty_write(BMAP, d)
        await sty_write(BMAP + 1, d >> 8)

    async def bmp_read():
        b1 = await sty_read(BMAP)
        b2 = await sty_read(BMAP + 1)
        return b1 | (b2 << 8)

    assert await sty_read(LINE) == 0
    assert await sty_read(CTRL) == 0x3C
    assert await bmp_read() == 0

    await sty_write(LINE, 15)
    await sty_write(CTRL, 0x3F)
    await bmp_write(0xFFFF)

    assert await sty_read(LINE) == 15
    assert await sty_read(CTRL) == 0x3F
    assert await bmp_read() == 0xFFFF

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
