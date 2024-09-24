# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, FallingEdge
from typing import List

CMD_READ = 1
CMD_WRITE = 2
CMD_SET_ADDR = 3
CMD_FORCE_MOVE = 4

MAP_VALUE = {
    0: 0,
    2: 1,
    4: 2,
    8: 3,
    16: 4,
    32: 5,
    64: 6,
    128: 7,
    256: 8,
    512: 9,
    1024: 10,
    2048: 11,
    4096: 12,
    8192: 13,
    16384: 14,
    32768: 15,
}

MAP_VALUE_INV = {v: k for k, v in MAP_VALUE.items()}


class GameDriver:
    def __init__(self, dut):
        clock = Clock(dut.clk, 10, units="us")
        cocotb.start_soon(clock.start())
        self._dut = dut
        self._clock = clock

    async def reset(self):
        self._dut._log.info("Reset")
        self._dut.ena.value = 1
        self._dut.ui_in.value = 0
        self._dut.uio_in.value = 0
        self._dut.rst_n.value = 0
        await ClockCycles(self._dut.clk, 10)
        self._dut.rst_n.value = 1
        self._dut.ui_in.value |= 0x80  # Enable debug mode
        await self.move_up()  # Press the up key to start the game

    async def debug_cmd(self, cmd: int, data: int):
        self._dut.uio_in.value = ((data & 0xF) << 4) | (cmd & 0xF)
        await ClockCycles(self._dut.clk, 1)  # Wait for the next clock cycle
        self._dut.uio_in.value = 0
        await FallingEdge(self._dut.clk)  # Wait for output data to become valid
        return (self._dut.uio_out.value >> 4) & 0xF

    async def set(
        self, col0: List[int], col1: List[int], col2: List[int], col3: List[int]
    ):
        for col in [col0, col1, col2, col3]:
            assert len(col) == 4  # 4x4 grid
        all_values = col0 + col1 + col2 + col3
        await self.debug_cmd(CMD_SET_ADDR, 0)
        for value in all_values:
            await self.debug_cmd(CMD_WRITE, MAP_VALUE[value])

    async def read_grid(self) -> List[int]:
        result = []
        await self.debug_cmd(CMD_SET_ADDR, 0)
        for _ in range(4):
            col = []
            for _ in range(4):
                value = await self.debug_cmd(CMD_READ, 0)
                col.append(MAP_VALUE_INV[value])
            result.append(col)
        return result

    async def _move(self, direction: int):
        await self.debug_cmd(CMD_FORCE_MOVE, direction)
        await ClockCycles(self._dut.clk, 100)  # Ensure the move is done

    async def move_up(self):
        await self._move(0b0001)

    async def move_down(self):
        await self._move(0b0010)

    async def move_left(self):
        await self._move(0b0100)

    async def move_right(self):
        await self._move(0b1000)


@cocotb.test()
async def test_debug_read_write(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 2, 0, 0],
        [4, 4, 4, 4],
        [2, 0, 2, 2],
        [8, 8, 8, 8],
    )

    expected = [
        [2, 2, 0, 0],
        [4, 4, 4, 4],
        [2, 0, 2, 2],
        [8, 8, 8, 8],
    ]
    assert await game.read_grid() == expected


@cocotb.test()
async def test_move_left(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 2, 0, 4],
        [4, 4, 4, 4],
        [2, 0, 2, 2],
        [8, 8, 8, 8],
    )

    await game.move_left()

    expected = [
        [4, 4, 0, 0],
        [8, 8, 0, 0],
        [4, 2, 0, 0],
        [16, 16, 0, 0],
    ]
    assert await game.read_grid() == expected


@cocotb.test()
async def test_move_up(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 4, 2, 8],
        [2, 4, 0, 8],
        [4, 0, 2, 16],
        [4, 0, 0, 16],
    )

    await game.move_up()

    expected = [
        [4, 8, 4, 16],
        [8, 0, 0, 32],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
    ]
    assert await game.read_grid() == expected


@cocotb.test()
async def test_move_down(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 4, 2, 2],
        [4, 4, 0, 2],
        [2, 0, 2, 2],
        [2, 4, 2, 0],
    )

    await game.move_down()

    expected = [
        [0, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 4, 2, 2],
        [4, 8, 4, 4],
    ]
    assert await game.read_grid() == expected


async def test_move_right(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 4, 2, 2],
        [4, 4, 4, 2],
        [2, 2, 2, 2],
        [2, 4, 2, 4],
    )

    await game.move_right()

    expected = [
        [0, 2, 4, 4],
        [0, 4, 8, 4],
        [0, 0, 4, 4],
        [0, 2, 4, 4],
    ]
    assert await game.read_grid() == expected


@cocotb.test()
async def test_move_right_empty(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
    )

    await game.move_right()

    expected = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
    ]
    assert await game.read_grid() == expected


@cocotb.test()
async def test_merge_offsets(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 2, 0, 0],
        [2, 0, 2, 0],
        [2, 0, 0, 2],
        [0, 2, 0, 2],
    )

    await game.move_left()

    expected = [
        [4, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0],
    ]
    assert await game.read_grid() == expected

    await game.set(
        [2, 2, 2, 2],
        [0, 0, 2, 2],
        [2, 2, 0, 2],
        [0, 2, 2, 2],
    )

    await game.move_left()

    expected = [
        [4, 4, 0, 0],
        [4, 0, 0, 0],
        [4, 2, 0, 0],
        [4, 2, 0, 0],
    ]
    assert await game.read_grid() == expected


@cocotb.test()
async def test_multiple_merges(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 2, 4, 8],
        [2, 2, 4, 8],
        [2, 2, 4, 8],
        [2, 2, 4, 8],
    )

    await game.move_left()

    expected = [
        [4, 4, 8, 0],
        [4, 4, 8, 0],
        [4, 4, 8, 0],
        [4, 4, 8, 0],
    ]
    assert await game.read_grid() == expected

    await game.move_left()

    expected = [
        [8, 8, 0, 0],
        [8, 8, 0, 0],
        [8, 8, 0, 0],
        [8, 8, 0, 0],
    ]
    assert await game.read_grid() == expected

    await game.move_up()

    expected = [
        [16, 16, 0, 0],
        [16, 16, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
    ]
    assert await game.read_grid() == expected

    await game.move_right()

    expected = [
        [0, 0, 0, 32],
        [0, 0, 0, 32],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
    ]
    assert await game.read_grid() == expected

    await game.move_down()

    expected = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 64],
    ]
    assert await game.read_grid() == expected

    await game.move_right()
    # Should not change the grid
    assert await game.read_grid() == expected

    await game.move_up()

    expected = [
        [0, 0, 0, 64],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
    ]
    assert await game.read_grid() == expected


@cocotb.test()
async def test_no_move_when_blocked(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 4, 2, 4],
        [4, 2, 4, 2],
        [2, 4, 2, 4],
        [4, 2, 4, 2],
    )

    await game.move_left()

    # The grid should remain unchanged because no merges or shifts can happen
    expected = [
        [2, 4, 2, 4],
        [4, 2, 4, 2],
        [2, 4, 2, 4],
        [4, 2, 4, 2],
    ]
    assert await game.read_grid() == expected


@cocotb.test()
async def test_alternating_merges(dut):
    game = GameDriver(dut)
    await game.reset()

    await game.set(
        [2, 2, 4, 4],
        [2, 4, 4, 8],
        [0, 2, 2, 2],
        [8, 8, 16, 16],
    )

    await game.move_left()

    expected = [
        [4, 8, 0, 0],
        [2, 8, 8, 0],
        [4, 2, 0, 0],
        [16, 32, 0, 0],
    ]
    assert await game.read_grid() == expected
