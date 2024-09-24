# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0
use_pillow = True
if use_pillow:
    from PIL import Image
else:
    import json
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 40 ns (25 MHz)
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
    for framenum in range(1):
        dut._log.info(f"Rendering frame {framenum}.")
        frame = []
        for i in range(525):
            row = []
            for j in range(800):
                await ClockCycles(dut.clk, 1)
                try:
                    data = int(dut.uo_out)
                except Exception:
                    dut._log.info(dut.uo_out.value)
                    raise
                row.append(data)
            frame.append(row)
        if use_pillow:
            b = bytearray()
            for row in frame:
                for pixel in row:
                    b.append(pixel)
            im = Image.frombytes(mode="L", size=(800, 525), data=b)
            palette = bytearray()
            for i in range(256):
                r,g,b = getcol(i)
                palette.append(r)
                palette.append(g)
                palette.append(b)
            im.putpalette(palette)
            im.save(f"display{framenum}.png")
        else:
            with open("dataout.json", "w", encoding="utf-8") as f:
                json.dump(frame, f)

    # await ClockCycles(dut.clk, 10000)

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    # assert dut.uo_out.value == 50

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.

def getcol(i):
    r = 0
    g = 0
    b = 0
    if (i & 0b00000001 != 0):
        r += 170
    if (i & 0b00000010 != 0):
        g += 170
    if (i & 0b00000100 != 0):
        b += 170
    if (i & 0b00010000 != 0):
        r += 85
    if (i & 0b00100000 != 0):
        g += 85
    if (i & 0b01000000 != 0):
        b += 85
    if (i & 0b10001000 != 0b10001000):
        r = r // 2
        g = g // 2
        b = b // 2
        if (i & 0b00001000 == 0):
            r += 85
        if (i & 0b10000000 == 0):
            b += 85
    return (r,g,b)
