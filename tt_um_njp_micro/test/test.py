# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: MIT

# My imported code
import cocotb
import random
from cocotb.clock import Clock
from cocotb.triggers import Timer
   
@cocotb.test()
async def micro_random_test(dut):
    dut._log.info("Start")
   
    # generate a clock
   
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
   
    # Keep testing the module by changing the input values, waiting for
    # sufficient clock cycles for the program to run, and asserting the
    # expected output values.
   
    for i in range(1000):
       
        # Reset
        dut._log.info("Reset")
        dut.rst_n.value = 0

        AB = random.randint(0, 255)
        dut.ui_in.value = AB

        A = AB % 16
        B = AB >> 4

        await Timer(200, units="ns")

        dut.rst_n.value = 1

        await Timer(1200, units="ns")
       
        dut._log.info("Test multiplication")
       
        assert dut.uo_out.value == A*B, "Randomised test failed with: {A} * {B} = {X}".format(A=dut.inputA.value, B=dut.inputB.value, X=dut.uo_out.value)
       
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
