# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

# import PIL
# from PIL import Image
# from PIL import ImageChops
import cocotb
import os
import pprint as pp
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge, RisingEdge, ClockCycles
from cocotb.binary import BinaryValue

pprint = pp.PrettyPrinter()

#read in VGA config
# vga_cfg_contents = ""
# with open("../src/vga_cfg.v","r") as fp:
#     vga_cfg_contents = fp.readlines()

# vga_params = [int(param.strip()[:-1].split()[-1]) for param in vga_cfg_contents if param != "\n" and "_S" not in param]

# H_VISIBLE = vga_params[0]
# H_FRONT = vga_params[1]
# H_PULSE = vga_params[2]
# H_BACK = vga_params[3]
# V_VISIBLE = vga_params[4]
# V_FRONT = vga_params[5]
# V_PULSE = vga_params[6]
# V_BACK = vga_params[7]

async def start_clock(dut):
    c = Clock(dut.clk, 39.8, units="ns")
    await c.start()

async def start_test(dut):
    dut._log.info("Starting test...")
    
    dut._log.info("Starting clock...")
    await cocotb.start(start_clock(dut))

    dut._log.info("Reseting design...")
    await reset(dut)

async def reset(dut):
    # Reset
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    await FallingEdge(dut.clk)
    dut.rst_n.value = 1

@cocotb.test()
async def dummy_test(dut):
    await start_test(dut)

    await Timer(1,"us")
