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

    # ADD function test A
    # Set the input values you want to test
    dut.ui_in.value = int("00000000",2)
    dut.uio_in.value = int("00000000",2)

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 10)

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    assert dut.uo_out.value == int("11000000",2)
    assert dut.uio_out.value == int("00000000",2)
    
    # AND function test A
    dut.ui_in.value = int("00000000",2)
    dut.uio_in.value = int("00010000",2)
    await ClockCycles(dut.clk, 10)
    assert dut.uo_out.value == int("11000000",2)
    assert dut.uio_out.value == int("00000000",2)

    # AND function test B
    #dut.ui_in.value = int("11111111",2)
    #dut.uio_in.value = int("00010000",2)
    #await ClockCycles(dut.clk, 10)
    #assert dut.uo_out.value == int("01001111",2)
    #assert dut.uio_out.value == int("10000000",2)

    #await ClockCycles(dut.clk, 10)
    # AND function test C
    #dut.ui_in.value = int("00000000",2)
    #dut.uio_in.value = int("00010000",2)
    #await ClockCycles(dut.clk, 10)
    #assert dut.uo_out.value == int("01000101",2)
    #assert dut.uio_out.value == int("00000000",2)

    # AND function test D
    #dut.ui_in.value = int("10101010",2)
    #dut.uio_in.value = int("00010000",2)
    #await ClockCycles(dut.clk, 10)
    #assert dut.uo_out.value == int("01001010",2)
    #assert dut.uio_out.value == int("00000000",2)

    # OR test
    # XOR test
    # PASSA and PASSB tests
    # SHR test
    # SHL test

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
