
# SPDX-FileCopyrightText: Copyright 2024 Darryl L. Miles
# SPDX-License-Identifier: Apache-2.0

import sys
import random

import cocotb
from cocotb.clock import Clock
from cocotb.binary import BinaryValue
from cocotb.triggers import ClockCycles

from cocotb_stuff.cocotbutil import *

DEBUG_LEVEL = 1

MODE_IDLE = (0x00) << 1
MODE_ADDR = (0x01) << 1
MODE_READ = (0x02) << 1
MODE_WRITE = (0x03) << 1
MODE_MASK = (0x03) << 1


def bus_mode(ui_in: int, mode: int) -> int:
    return (ui_in & ~MODE_MASK) | mode


async def bus_read(dut, ui_in: int, raddr: int) -> int:
    saved_ui_in = ui_in

    dut.ui_in.value = bus_mode(ui_in, MODE_ADDR)
    dut.uio_in.value = raddr
    await ClockCycles(dut.clk, 1)

    dut.ui_in.value = bus_mode(ui_in, MODE_READ)
    await ClockCycles(dut.clk, 1)
    rdata = dut.uio_out.value

    dut.ui_in.value = bus_mode(saved_ui_in, MODE_IDLE) # restore

    return rdata


async def bus_write(dut, ui_in: int, waddr: int, wdata: int) -> int:
    saved_ui_in = ui_in

    dut.ui_in.value = bus_mode(ui_in, MODE_ADDR)
    dut.uio_in.value = waddr
    await ClockCycles(dut.clk, 1)

    dut.ui_in.value = bus_mode(ui_in, MODE_WRITE)
    dut.uio_in.value = wdata
    await ClockCycles(dut.clk, 1)

    dut.ui_in.value = bus_mode(saved_ui_in, MODE_IDLE) # restore

    return wdata


def binary_value(v) -> str:
    return f"{str(v)}"



@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    await ClockCycles(dut.clk, 2)       # show X

    debug(dut, 'RESET')

    # ena=0 state
    dut.ena.value = 0
    dut.rst_n.value = 0
    dut.clk.value = 0
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    await ClockCycles(dut.clk, 2)       # show muted inputs ena=0

    dut._log.info("ena (active)")
    dut.ena.value = 1                   # ena=1
    await ClockCycles(dut.clk, 2)

    dut._log.info("reset (inactive)")
    dut.rst_n.value = 1                 # leave reset
    await ClockCycles(dut.clk, 32)



    debug(dut, 'START')

    await ClockCycles(dut.clk, 16)

    ui_in = 0
    uio_in = 0

    dut.ui_in.value = ui_in
    dut.uio_in.value = uio_in
    await ClockCycles(dut.clk, 1)

    ui_in = bus_mode(ui_in, MODE_READ)

    for addr in range(0, 15+1):
        d = await bus_read(dut, ui_in, addr)
        print(f"READ  {addr:#04x} = {binary_value(d)}")

    await ClockCycles(dut.clk, 16)

    for addr in range(0, 15+1):
        d = await bus_write(dut, ui_in, addr, 0xff)
        print(f"WRITE {addr:#04x} = {binary_value(d)}")

    await ClockCycles(dut.clk, 16)

    for addr in range(0, 15+1):
        d = await bus_read(dut, ui_in, addr)
        print(f"READ  {addr:#04x} = {binary_value(d)}")

    await ClockCycles(dut.clk, 16)

    for addr in range(0, 15+1):
        v = 0xff if(addr != 15) else 0x7f # don't cause resetCommandStrobe
        d = await bus_write(dut, ui_in, addr, 0xff)
        print(f"WRITE {addr:#04x} = {binary_value(d)}")

    await ClockCycles(dut.clk, 16)

    for addr in range(0, 15+1):
        d = await bus_read(dut, ui_in, addr)
        print(f"READ  {addr:#04x} = {binary_value(d)}")

    await ClockCycles(dut.clk, 16)


    debug(dut, 'END')

    await ClockCycles(dut.clk, 16)
