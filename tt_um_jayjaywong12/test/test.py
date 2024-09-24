# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
import random
from random import randint

OP_READ = 0
OP_WRITE = 1
OP_RUN = 2

OP_SHIFT = 6

UIO_DATA_MASK = 0xF

UIO_STATE_SHIFT = 4
UIO_STATE_MASK = 0x3

STATE_RESET = 0
STATE_RUNNING = 1
STATE_ACCUMULATING = 3
STATE_DONE = 2


def generate_random_vec():
    l = []
    for _ in range(16):
        l.append(randint(0, (2**4)-1))
    return l

def calculate_expected(veclength, vec1, vec2, orig_acc):
    if veclength == 0: veclength = 16
    for i in range(veclength):
        orig_acc += vec1[i] * vec2[i]
    return orig_acc & 0xFF

async def set_value_at(dut, addr, value, check=False):
        # Write the value
    dut.ui_in.value = addr | OP_WRITE << OP_SHIFT
    dut.uio_in.value = value 

    await ClockCycles(dut.clk, 1)

    if check:
        # Read the value back
        dut.ui_in.value = addr | OP_READ << OP_SHIFT
        
        await ClockCycles(dut.clk, 1)

        assert (dut.uio_oe.value & UIO_DATA_MASK) == 0xF
        assert (dut.uio_out.value & UIO_DATA_MASK) == value

async def set_veclength(dut, veclength):
    assert veclength < 16
    await set_value_at(dut, 0, veclength)

async def set_vec(dut, vec, vec_idx):
    assert vec_idx < 2
    for i in range(16):
        await set_value_at(dut, 1 + i + vec_idx * 16, vec[i])

set_vec1 = lambda dut, vec: set_vec(dut, vec, 0)
set_vec2 = lambda dut, vec: set_vec(dut, vec, 1)

async def set_acc(dut, val):
    assert val < 256
    await set_value_at(dut, 1 + 16 * 2, val & 0xF)
    await set_value_at(dut, 1 + 16 * 2 + 1, (val & 0xF0) >> 4)

def get_state(dut):
    return (dut.uio_out.value & (UIO_STATE_MASK << UIO_STATE_SHIFT)) >> UIO_STATE_SHIFT 

def get_value(dut):
    return dut.uo_out.value

async def run(dut):
    dut.ui_in.value = OP_RUN << OP_SHIFT
    await ClockCycles(dut.clk, 2)

    assert get_state(dut) == STATE_RUNNING
    await ClockCycles(dut.clk, 1)
    assert get_state(dut) == STATE_ACCUMULATING
    await ClockCycles(dut.clk, 1)
    assert get_state(dut) == STATE_DONE

    return get_value(dut)

@cocotb.test()
async def test_mem(dut):
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

    # Set the input values you want to test
    for addr in range(0, 32):
        for test_value in range(0,16):
            await set_value_at(dut, addr, test_value, check=True)

@cocotb.test()
async def test_sm(dut):
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

    def get_state(dut):
       return (dut.uio_out.value & (UIO_STATE_MASK << UIO_STATE_SHIFT)) >> UIO_STATE_SHIFT 

    assert (dut.uio_oe.value & (UIO_STATE_MASK << UIO_STATE_SHIFT)) >> UIO_STATE_SHIFT == UIO_STATE_MASK
    assert get_state(dut) == STATE_RESET

    # Set op running
    dut.ui_in.value = OP_RUN << OP_SHIFT
    await ClockCycles(dut.clk, 2)

    assert get_state(dut) == STATE_RUNNING
    await ClockCycles(dut.clk, 1)
    assert get_state(dut) == STATE_ACCUMULATING
    await ClockCycles(dut.clk, 1)
    assert get_state(dut) == STATE_DONE

@cocotb.test()
async def test_out(dut):
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

    value = randint(0, 255)
    dut._log.info(f"{value=}")
    await set_acc(dut, value)
    await ClockCycles(dut.clk, 1)
    assert get_value(dut) == value


@cocotb.test()
async def test_vadd(dut):
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


    # 100 random iterations
    for _ in range(1):
        for veclength in range(15):
            # Reset between runs
            dut.rst_n.value = 0
            await ClockCycles(dut.clk, 1)
            dut.rst_n.value = 1

            vec1 = generate_random_vec()
            vec2 = generate_random_vec()
            orig_acc = randint(0,(2**8)-1)
            await set_veclength(dut, veclength)
            await set_vec1(dut, vec1)
            await set_vec2(dut, vec2)
            await set_acc(dut, orig_acc)
            output = await run(dut)
            expected = calculate_expected(veclength, vec1, vec2, orig_acc)
            dut._log.info(f"{veclength=} {vec1=} {vec2=} {expected=} {orig_acc=}")
            assert output == expected