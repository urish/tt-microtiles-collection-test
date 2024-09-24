# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

global ui_in
ui_in = 0xFF

R_POS = 3
G_POS = 4
B_POS = 5
W_POS = 6
INT_POS = 1
IDX_POS = 2
MODE_POS = 7
PREAMB_POS = 0

PIN_CS = 4
PIN_SCK = 5
PIN_MOSI = 6

async def clear_input(dut, b: int):
        global ui_in
        ui_in &= ~(1 << b)
        dut.ui_in.value = ui_in
        await ClockCycles(dut.clk, 1)

async def set_input(dut, b: int):
    global ui_in
    ui_in |= (1 << b)
    dut.ui_in.value = ui_in
    await ClockCycles(dut.clk, 1)

async def test_colorwheel(dut, idx):
    dataPayload = [0x55, 0xff, 0x24, 0x00, 0xff, 0x00, 0xaa, 0xa4]
    dataPayload[R_POS] = 0x00
    dataPayload[G_POS] = 0x00
    dataPayload[B_POS] = 0x00
    dataPayload[W_POS] = 0x39
    dataPayload[INT_POS] = 0xFF
    dataPayload[IDX_POS] = idx
    dataPayload[MODE_POS] = 0xa4
    dataPayload[PREAMB_POS] = 0x55

    # resulting PWM is 0D, FE, 00, 00

    print(dataPayload)
    for i in range(8):
        await SPI_send(dut, dataPayload[i])

async def test_rgb(dut):
    dataPayload = [0x55, 0xff, 0x24, 0x00, 0xff, 0x00, 0xaa, 0xa4]
    dataPayload[R_POS] = 0x1
    dataPayload[G_POS] = 0xff
    dataPayload[B_POS] = 0x7f
    dataPayload[W_POS] = 0x15
    dataPayload[INT_POS] = 0x00
    dataPayload[IDX_POS] = 0x00
    dataPayload[MODE_POS] = 0x21
    dataPayload[PREAMB_POS] = 0x55

    # resulting PWM is 0D, FE, 00, 00

    print(dataPayload)
    for i in range(8):
        await SPI_send(dut, dataPayload[i])

# Sends DATA of a specific LENGTH through spi. MOSI pin is selected by providing a MASK for ui_in
# MSB first
async def SPI_send(dut, DATA: int):

    dut.ui_in.value = dut.ui_in.value & ~(0x1 << PIN_CS) #CS low
    await ClockCycles(dut.clk, 5)
    # Send SPI data
    for i in range(8):
        #dut._log.info(f"SPI send: {i}")
        if (DATA << i) & 0x80 == 0x80: # Check if highest bit is set      
        # Clear bit 7 in the current value and then set it to the desired value
        # current_value = dut.uo_out.value.integer
            dut.ui_in.value = (dut.ui_in.value) | (0x1 << PIN_MOSI)
            await ClockCycles(dut.clk, 1)
            #dut._log.info(f"DATA: 1")
            #print ((dut.ui_in))
        else:
            dut.ui_in.value = dut.ui_in.value & ~(0x1 << PIN_MOSI)
            await ClockCycles(dut.clk, 1)
            #dut._log.info(f"DATA: 0")
            #print (dut.ui_in)

         
        dut.ui_in.value = (dut.ui_in.value) | (0x1 << PIN_SCK)
        await ClockCycles(dut.clk, 50)
        dut.ui_in.value = dut.ui_in.value & ~(0x1 << PIN_SCK)
        await ClockCycles(dut.clk, 50)
    
    dut.ui_in.value = (dut.ui_in.value) | (0x1 << PIN_CS) #CS high
    await ClockCycles(dut.clk, 5)


@cocotb.test()
async def user_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())


    # Reset
    dut._log.info("Reset")
    dut.ena.value = 0
    dut.rst_n.value = 0
    dut.ui_in.value = 0 # reset 
    await ClockCycles(dut.clk, 10)
    dut.ui_in.value = dut.ui_in.value | (0x1 << 3) # set the test pin
    await ClockCycles(dut.clk, 1000)
    #assert (dut.uo_out.value[7]) == (0)
    dut.ena.value = 1
    dut.ui_in.value = dut.ui_in.value | (0x1 << 3) # set the test pin
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 130) # more than the reset delay count of the clk_prescaler
    dut.ui_in.value = dut.ui_in.value & ~(0x1 << 7) # reset the clock gen
    await ClockCycles(dut.clk, 10)
    dut.ui_in.value = dut.ui_in.value | (0x1 << 7) # activate the clock gen
    await ClockCycles(dut.clk, 10)

    dut.ui_in.value = (dut.ui_in.value) | (0x1 << PIN_CS)
    await ClockCycles(dut.clk, 10)

    await test_colorwheel(dut, 0xb8)
    await ClockCycles(dut.clk, 10000)

    await test_rgb(dut)
    await ClockCycles(dut.clk, 1000)

    await SPI_send(dut, 0x55)
    await ClockCycles(dut.clk, 10)
    await SPI_send(dut, 0xAA)
    await ClockCycles(dut.clk, 10)
    dut.ui_in.value = dut.ui_in.value & ~(0x1 << 3) # reset the test pin
    await ClockCycles(dut.clk, 1000)


    dut._log.info("Test project behavior")



    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 1)

    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 130)
    await test_colorwheel(dut, 0xb8)
    await ClockCycles(dut.clk, 4000)

    for i in range(255):
        await test_colorwheel(dut, i)
        print("\n", i)
        await ClockCycles(dut.clk, 4000)

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    #assert dut.uo_out.value == 50

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
