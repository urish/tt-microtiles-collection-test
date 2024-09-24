# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import Timer
import random

SR_LEN = 512

@cocotb.test()
async def test_shift_register(dut):
    """Test the shift register."""

    # SR signals
    sr_ctrl = dut.ui_in[1]
    sr_in = dut.ui_in[0]
    sr_out = dut.uo_out[0]

    # Reset
    dut._log.info("Reset")
    sr_ctrl.value = 0 
    sr_in.value = 0
    await Timer(10, units="ns")

    seq = [random.randint(0,1) for i in range(SR_LEN)]

    dut._log.info("Shifting in test sequence...") 

    # shift-in the random sequence
    for i in range(SR_LEN):
        # set SR input
        sr_in.value = seq[i]
        await Timer(10, units="ns")

        # toggle shift control signal
        sr_ctrl.value = 1 - sr_ctrl.value
        await Timer(10, units="ns")

        if i % 16 == 0:
            dut._log.info(i)

    dut._log.info("Shifting out and checking test sequence...") 

    # shift-out the random sequence and check it is correct
    for i in range(SR_LEN):
        assert sr_out.value == seq[i]

        # toggle shift control signal
        sr_ctrl.value = 1 - sr_ctrl.value
        await Timer(10, units="ns")

        if i % 16 == 0:
            dut._log.info(i)

    dut._log.info("Test completed successfully.")
