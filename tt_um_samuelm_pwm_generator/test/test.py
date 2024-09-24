
# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: MIT
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")
    # Set the clock period to 20 ns ( 50 MHz)
    clock = Clock(dut.clk, 20, units="ns")
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
	
    await testing(dut, 55, 160,   3, 224)
    await testing(dut, 50, 160,   2, 224)
    await testing(dut, 83, 160, 100, 224)
    await testing(dut, 98, 160, 100, 224)
    await testing(dut, 99, 160, 100, 224)
    await testing(dut, 50, 160, 232, 227)	# per = 1000
    await testing(dut, 12, 160, 208, 231)	# per = 2000
    await testing(dut,  1, 160, 184, 235)	# per = 3000
    await testing(dut, 47, 160, 160, 239)	# per = 4000
    await testing(dut, 76, 160, 255, 239)	# per = 4095
    await ClockCycles(dut.clk, 1000)
    await testing(dut, 50, 160,  10, 224)
    await testing(dut, 30, 160,  33, 224)
    await testing(dut, 50, 160,  70, 224)
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await testing(dut, 83, 160,  45, 224)
    await testing(dut, 25, 160,   5, 224)
    await testing(dut, 79, 160, 200, 224)
    await testing(dut, 60, 160, 255, 224)
    await testing(dut, 50, 128, 232, 227)	# per = 1000
    await testing(dut, 50, 160, 232, 227)	# per = 1000
    await testing(dut, 12, 160, 208, 231)	# per = 2000
    await testing(dut, 50, 160,  70, 224)
	

async def testing(dut ,duty_val, duty_uio, period_val, period_uio):

    # Set the input values for duty cycles
    dut.ui_in.value = duty_val	# duty 99%
    dut.uio_in.value = duty_uio  # uio_in = [1, 0, 1, 0, 0, 0, 0, 0] -- 160
	
    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 2)
    duty = int(dut.ui_in.value)	# store duty cycle value 

    # Set the input values for period
    dut.ui_in.value = period_val      	# period = 100 ==> fq = 500 kHz --100
    dut.uio_in.value = period_uio     	# uio_in = [1, 1, 1, 0, 0, 0, 0, 0] -- 224

    await ClockCycles(dut.clk, 2)
    period = int(dut.ui_in.value)
    uio_val = int(dut.uio_in.value)

    # verify if the uio_val has last 4 bits( bits used to set period greater than 255)
    uio_bin = bin(uio_val)
    new_val = 0
    val = uio_bin[len(uio_bin)-4:len(uio_bin)]

    for i in range(0,len(val)):
        new_val = new_val + int(val[i])*2**i

    if(new_val == 0):
        period_good = period
    else: 
        period_new = str(bin(uio_val))[6:10] + str(bin(period))[2:10]
        period_gt255  = 0
        l = len(period_new) - 1

        for i in range(0,len(period_new)):
            period_gt255 = period_gt255 + int(period_new[l-i])*2**i

        period_good = period_gt255

    t_on = int((duty*period_good)/100)
    no_of_cycles = period_good

    await ClockCycles(dut.clk,3 * period_good)

    val = []
    
    for i in range(no_of_cycles):
        await ClockCycles(dut.clk, 1)
        val.append(int(dut.uo_out.value))

    # assert val.count(1) == t_on

