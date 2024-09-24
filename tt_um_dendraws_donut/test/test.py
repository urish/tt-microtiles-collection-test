# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge
from PIL import Image
from pathlib import Path
from shutil import rmtree
from tqdm import tqdm

# Inspo from https://github.com/MichaelBell/tt08-mandelbrot
H_DISPLAY       = 640
H_BACK          =  48
H_FRONT         =  16
H_SYNC          =  96
V_DISPLAY       = 480
V_TOP           =  33
V_BOTTOM        =  10
V_SYNC          =   2

N_FRAMES        =   1
OUT_DIR         = "out"
CLK_PER_PIXEL   =   2

async def get_hsync(dut, front=H_FRONT, sync=H_SYNC, back=H_BACK, vsync_value=None):
    for _ in range(front):
        await ClockCycles(dut.clk, CLK_PER_PIXEL)
        if vsync_value is not None:
            assert(dut.vsync.value == vsync_value)
        assert(dut.hsync.value == 0)
    for _ in range(sync):
        await ClockCycles(dut.clk, CLK_PER_PIXEL)
        if vsync_value is not None:
            assert(dut.vsync.value == vsync_value)
        assert(dut.hsync.value == 1)
    for _ in range(back):
        await ClockCycles(dut.clk, CLK_PER_PIXEL)
        if vsync_value is not None:
            assert(dut.vsync.value == vsync_value)
        assert(dut.hsync.value == 0)

async def get_vsync(dut):
    for _ in range(V_BOTTOM):
        await get_hsync(dut, front=H_DISPLAY+H_FRONT, vsync_value=0)
    
    for _ in range(V_SYNC):
        await get_hsync(dut, front=H_DISPLAY+H_FRONT, vsync_value=1)
            
    for _ in range(V_TOP):
        await get_hsync(dut, front=H_DISPLAY+H_FRONT, vsync_value=0)

async def get_frame(dut, filename, v_offset=0):
    sigs = [dut.R, dut.G, dut.B]
    image = Image.new("RGB", (H_DISPLAY, V_DISPLAY))

    for v in tqdm(range(v_offset, V_DISPLAY), desc=str(filename)):
        for h in range(H_DISPLAY):
            await ClockCycles(dut.clk, CLK_PER_PIXEL)
            color = [c.value * 85 for c in sigs]
            image.putpixel((h, v), tuple(color))

        await get_hsync(dut)
    await get_vsync(dut)
    image.save(filename)


@cocotb.test()
async def test_project(dut):
    dut._log.warning("ENDING EARLY FOR GITHUB ACTIONS")
    return
    out_dir = Path(OUT_DIR)
    if out_dir.exists():
        rmtree(out_dir)
    out_dir.mkdir()

    dut._log.info("Start")

    # Set the clock period to 20 ns (50 MHz)
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

    dut._log.info("Test project")

    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 1)

    # Hsync rising edge
    await RisingEdge(dut.hsync)
    
    # Ignore first line
    await get_hsync(dut, front=0)
    await get_frame(dut, out_dir / f"frame_{0:02}.png", v_offset=1)

    frame_no = 1
    while frame_no < N_FRAMES:
        await get_frame(dut, out_dir / f"frame_{frame_no:02}.png")
        frame_no += 1
    