# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge
from cocotb.triggers import FallingEdge


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    clock = Clock(dut.clk, 40, units="ns")
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

    # uio_out[7] = Audio PWM
    # uo_out[0] = R1
    # uo_out[1] = G1
    # uo_out[2] = B1
    # uo_out[3] = VSync
    # uo_out[4] = R0
    # uo_out[5] = G0
    # uo_out[6] = B0
    # uo_out[7] = HSync

    await ClockCycles(dut.clk, 2)

    assert dut.uio_oe.value == 0x80
    assert dut.uo_out[7].value == 1
    assert dut.uo_out[3].value == 1

    await ClockCycles(dut.clk, 420000)
