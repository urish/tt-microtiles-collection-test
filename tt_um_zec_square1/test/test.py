# SPDX-FileCopyrightText: © 2024 Tiny Tapeout; © 2024 Zachary Catlin
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

VSYNC_MASK = 0x08
HSYNC_MASK = 0x80
RGB_MASK = 0x77

CLOCKS_IN_LINE = 800
LINES_IN_FRAME = 525

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 1 us (1 MHz)
    clock = Clock(dut.clk, 1, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0

    await ClockCycles(dut.clk, 10)

    dut._log.info("Make sure outputs are at reset values");
    assert dut.uo_out.value == 0b10001000
    assert dut.uio_out.value == 0

    dut.rst_n.value = 1
    dut._log.info("Test project behavior")

    time = 0
    old_out = 0x00
    last_vsync_start = None
    frame_no = 0

    # skip forward to the first VSync
    while last_vsync_start is None:
      await ClockCycles(dut.clk, 1)
      time += 1
      new_out = dut.uo_out.value

      if ((new_out & VSYNC_MASK) == 0) and ((old_out & VSYNC_MASK) != 0):
        dut._log.info(f"Found VSync; start of frame {frame_no}")
        last_vsync_start = time

      old_out = new_out


    last_hsync_start = None
    old_vsync = ((old_out & VSYNC_MASK) != 0)
    old_hsync = ((old_out & HSYNC_MASK) != 0)
    last_vsync_end, last_hsync_end = None, None

    # step through a few video frames,
    # making sure the appropriate invariants are maintained for
    # 640 x 480 video at 60 Hz (non-interlaced)
    for i in range(1400000): # a little over 3 frames
      await ClockCycles(dut.clk, 1)
      time += 1
      new_out = dut.uo_out.value

      new_vsync = ((new_out & VSYNC_MASK) != 0)
      new_hsync = ((new_out & HSYNC_MASK) != 0)

      # start of VSync pulse; check pulse-to-pulse timing
      if old_vsync and not new_vsync:
        assert (time - last_vsync_start) == (CLOCKS_IN_LINE * LINES_IN_FRAME)
        last_vsync_start = time
        frame_no += 1
        dut._log.info(f"VSync; start of frame {frame_no}")

      # end of VSync pulse; check pulse width
      if new_vsync and not old_vsync:
        assert (time - last_vsync_start) == (CLOCKS_IN_LINE * 2)
        last_vsync_end = time

      # start of HSync pulse;
      # check HSync-to-HSync and VSync-to-HSync timing
      if old_hsync and not new_hsync:
        if last_hsync_start is not None:
          assert (time - last_hsync_start) == CLOCKS_IN_LINE
          assert ((time - last_vsync_start) % CLOCKS_IN_LINE) == 656
        last_hsync_start = time

      # end of HSync pulse; check pulse width
      if new_hsync and not old_hsync:
        assert (time - last_hsync_start) == 96
        last_hsync_end = time

      # only have RGB output during the addressable portion of a frame
      assert ((new_out & RGB_MASK) == 0) or (
        ((time - last_hsync_end) >= 48) and
        ((time - last_hsync_end) < 688) and
        ((time - last_vsync_end) >= (CLOCKS_IN_LINE * (25 + 8))) and
        ((time - last_vsync_end) < (CLOCKS_IN_LINE * (25 + 8 + 480)))
      )

      old_out, old_vsync, old_hsync = new_out, new_vsync, new_hsync



    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
