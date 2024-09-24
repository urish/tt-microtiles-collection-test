# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 1 us (1 MHz)
    clock = Clock(dut.clk, 1, units="us")
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

    # Set the input values you want to test
    dut.ui_in.value = 1

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, (1 << 10))
    dut.ui_in.value = 0

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, (1 << 10))
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, (1 << 10))
    dut.rst_n.value = 1
    dut.ui_in.value = 1
    await ClockCycles(dut.clk, (1 << 10))

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    assert dut.uio_out.value == 0x03
    assert dut.uo_out.value == 0xEA

    dut.rst_n.value = 0
    dut.ui_in.value = 0xfe

    await ClockCycles(dut.clk, (1 << 2))

    assert dut.uo_out.value == 49

    dut.rst_n.value = 1
    dut.ui_in.value = 0xff

    await ClockCycles(dut.clk, (1 << 8))

    assert dut.uo_out.value == 0xFB
    assert dut.uio_out.value == 0x2C


    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
