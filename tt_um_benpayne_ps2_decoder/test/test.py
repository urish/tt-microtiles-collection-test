# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Edge, First
from cocotb.clock import Clock, Timer

async def send_bit(ps2_clk, ps2_data, bit):
    ps2_data.value = bit
    ps2_clk.value = 1
    await Timer(50, units="us")
    ps2_clk.value = 0
    await Timer(50, units="us")


async def send_bits(ps2_clk, ps2_data, value, bit_count=8, parity_valid=True, stop_valid=True):
    await send_bit(ps2_clk, ps2_data, 0)  # start bit
    parity = 0
    for i in range(bit_count):
        bit = (value >> (i)) & 1
        parity ^= bit
        await send_bit(ps2_clk, ps2_data, bit)
    if parity_valid:
        await send_bit(ps2_clk, ps2_data, not parity)
    else:
        await send_bit(ps2_clk, ps2_data, parity)
    if stop_valid:
        await send_bit(ps2_clk, ps2_data, 1)  # stop bit
    ps2_clk.value = 1


async def read_byte(dut):
    await Timer(40, units="ns")
    assert dut.uio_oe.value == 0x00, "uio_oe must not be set before a read"
    dut.cs.value = 1
    # wait 3 clock to ensure that cs doesn't double trigger and read multiple bytes. only one byte per rising edge.
    await Timer(120, units="ns")
    assert dut.uio_oe.value == 0xFF, "uio_oe must be set when reading data"
    dut.cs.value = 0
    return dut.uio_out.value


@cocotb.test()
async def ps2_decode_test(dut):
    """Test getting one byte from keyboard."""

    dut.clear_int.value = 0
    dut.cs.value = 0
    dut.rst_n.value = 0
    await Timer(1, units="us")
    dut.rst_n.value = 1

    assert dut.interupt == 0, f"Interupt not clear after reset"

    #cocotb.start_saving_waves()
    cocotb.start_soon(Clock(dut.clk, 40, units="ns").start())

    dut.ps2_clk.value = 1
    dut.ps2_data.value = 1
    
    await Timer(1, units="us")

    cocotb.start_soon(send_bits(dut.ps2_clk, dut.ps2_data, 0xC2))

    # wait for rising edge of valid and check data
    await RisingEdge(dut.valid)

    await Timer(80, units="ns")

    # wait enough time for the valid signal to go low and validate
    assert dut.valid == 0, "Valid not cleared properly"
    assert dut.interupt == 1, f"Interupt not clear after reset"
    assert dut.data_rdy == 1, f"data ready not set after valid"

    value = await read_byte(dut)
    assert value == 0xC2, f"Expected 0xC2, got {value}"

    await Timer(100, units="us")

    dut.clear_int.value = 1
    await Timer(80, units="ns")
    dut.clear_int.value = 0
    await Timer(40, units="ns")
    assert dut.interupt == 0, f"Interupt not clear after reset"

    assert dut.data_rdy == 0, f"data ready not cleared after read"


@cocotb.test()
async def ps2_decode_second_test(dut):
    """Test another byte."""

    #cocotb.start_saving_waves()
    cocotb.start_soon(Clock(dut.clk, 40, units="ns").start())

    dut.ps2_clk.value = 1
    dut.ps2_data.value = 1

    await Timer(1, units="us")

    cocotb.start_soon(send_bits(dut.ps2_clk, dut.ps2_data, 0xF0))

    # wait for rising edge of valid and check data
    await RisingEdge(dut.valid)

    await Timer(80, units="ns")

    # wait enough time for the valid signal to go low and validate
    assert dut.valid == 0, "Valid not cleared properly"
    assert dut.interupt == 1, f"Interupt not clear after reset"
    assert dut.data_rdy == 1, f"data ready not set after valid"

    value = await read_byte(dut)
    assert value == 0xF0, f"Expected 0xC2, got {value}"

    await Timer(100, units="us")

    # clear interupt
    dut.clear_int.value = 1
    await Timer(80, units="ns")
    dut.clear_int.value = 0
    await Timer(40, units="ns")
    assert dut.interupt == 0, f"Interupt not clear after reset"


@cocotb.test()
async def ps2_decode_partial_test(dut):
    """Test the a failed transmit."""

    #cocotb.start_saving_waves()
    cocotb.start_soon(Clock(dut.clk, 40, units="ns").start())

    dut.ps2_clk.value = 1
    dut.ps2_data.value = 1

    await Timer(1, units="us")

    cocotb.start_soon(send_bits(dut.ps2_clk, dut.ps2_data, 0xF0, bit_count=5, parity_valid=False, stop_valid=False))

    # wait for rising edge of valid and check data
    to = Timer(1.5, units='ms')
    res = await First(RisingEdge(dut.valid), to)

    print(f"res: {res}")

    assert isinstance(res, Timer) , "Expected timeout got rising edge"


async def send_two_bytes(ps2_clk, ps2_data, value1, value2):
    await send_bits(ps2_clk, ps2_data, value1)
    await Timer(100, units="us")
    await send_bits(ps2_clk, ps2_data, value2)

@cocotb.test()
async def ps2_decode_two_bytes_test(dut):
    """Test receiveing two keycodes."""

    #cocotb.start_saving_waves()
    cocotb.start_soon(Clock(dut.clk, 40, units="ns").start())

    dut.ps2_clk.value = 1
    dut.ps2_data.value = 1

    await Timer(1, units="us")

    cocotb.start_soon(send_two_bytes(dut.ps2_clk, dut.ps2_data, 0xF0, 0x15))

    # wait for rising edge of valid and check data
    await RisingEdge(dut.valid)
    await RisingEdge(dut.valid)

    await Timer(80, units="ns")

    # wait enough time for the valid signal to go low and validate
    assert dut.valid == 0, "Valid not cleared properly"
    assert dut.interupt == 1, f"Interupt not clear after reset"
    assert dut.data_rdy == 1, f"data ready not set after valid"

    value = await read_byte(dut)
    assert value == 0xF0, f"Expected 0xF0, got {value.hex()}"

    value = await read_byte(dut)
    assert value == 0x15, f"Expected 0x15, got {value.hex()}"

    await Timer(100, units="us")

    # clear interupt
    dut.clear_int.value = 1
    await Timer(80, units="ns")
    dut.clear_int.value = 0
    await Timer(40, units="ns")
    assert dut.interupt == 0, f"Interupt not clear after reset"


@cocotb.test()
async def ps2_decode_two_bytes_int_clear_test(dut):
    """Test receiveing two keycodes."""

    #cocotb.start_saving_waves()
    cocotb.start_soon(Clock(dut.clk, 40, units="ns").start())

    dut.ps2_clk.value = 1
    dut.ps2_data.value = 1

    await Timer(1, units="us")

    assert dut.interupt == 0, f"Interupt not clear before test"

    cocotb.start_soon(send_two_bytes(dut.ps2_clk, dut.ps2_data, 0xF1, 0x16))

    # wait for rising edge of valid and check data
    await RisingEdge(dut.interupt)
    await Timer(1, units="us")

    value = await read_byte(dut)
    assert value == 0xF1, f"Expected 0xF1, got {value.hex()}"

    assert dut.data_rdy == 0, f"data ready not cleared after read"
    assert dut.interupt == 1, f"Interupt not set after read"

    # clear interupt
    dut.clear_int.value = 1
    await Timer(80, units="ns")
    dut.clear_int.value = 0
    await Timer(40, units="ns")
    assert dut.interupt == 0, f"Interupt not clear after reset"

    # wait for rising edge of valid and check data
    await RisingEdge(dut.interupt)

    await Timer(1, units="us")

    value = await read_byte(dut)
    assert value == 0x16, f"Expected 0x16, got {value.hex()}"

    assert dut.data_rdy == 0, f"data ready not cleared after read"
    assert dut.interupt == 1, f"Interupt not set after read"

    # clear interupt
    dut.clear_int.value = 1
    await Timer(80, units="ns")
    dut.clear_int.value = 0
    await Timer(40, units="ns")
    assert dut.interupt == 0, f"Interupt not clear after reset"
