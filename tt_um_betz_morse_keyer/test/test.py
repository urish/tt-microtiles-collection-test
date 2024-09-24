# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 83.33 ns (12 MHz)
    clock = Clock(dut.clk, 83.33, units="ns")
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
    dut.ui_in.value = 0x43  # Dip switch settings - these generally don't change (22 WPM, Iambic-B inputs)
    dut.uio_in.value = 0x00 # 0x01 = dit, 0x02 = dah, 0x00 = neither, 0x03 = both

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 1)

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    assert dut.uo_out.value == 0x00 # On startup, the display should be blank
    assert dut.uio_oe.value == 0x3C # This should never change
    assert dut.uio_out.value == 0x00 # No signals present yet

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
    dut.uio_in.value = 0x02 # Send a dah first
    await ClockCycles(dut.clk,25000)
    dut.uio_in.value = 0x03 # Press the dit too (start iambic behavior)
    await ClockCycles(dut.clk,25000)
    
    assert dut.uo_out.value == 0x00
    assert dut.uio_oe.value == 0x3C
    assert dut.uio_out.value == 0x1C or dut.uio_out.value == 0x3C # Aux outputs should be going now
    
    await ClockCycles(dut.clk,5200000) # Wait until on the second dah pulse
    dut.uio_in.value = 0x00 # Release the inputs
    await ClockCycles(dut.clk,100000)
    
    assert dut.uo_out.value == 0x00
    assert dut.uio_oe.value == 0x3C
    assert dut.uio_out.value == 0x10 or dut.uio_out.value == 0x30 # Morse should keep playing, but the paddle auxilliary outputs should be inactive
    
    await ClockCycles(dut.clk,10000000) # Wait for morse pattern to stop and display to activate
    
    assert dut.uo_out.value == 0x58     # 7-segment display segments D, E, G for the letter "c" = -.-.
    assert dut.uio_oe.value == 0x3C
    assert dut.uio_out.value == 0x00    # Buzzer and auxilliary outputs should be silent
        
    
