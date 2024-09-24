# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge

def hex_to_bits(hex_constant):
    binary_string = bin(int(hex_constant, 16))[2:]
    binary_string = binary_string.zfill(len(hex_constant) * 4)
    rev_binary_string = binary_string[::-1]
    for bit in rev_binary_string:
        yield int(bit)


class ShiftRegister128:
    def __init__(self):
        self.register = [0] * 128

    def shift_left(self, new_bit=0):
        if new_bit not in [0, 1]:
            raise ValueError("new_bit must be 0 or 1")
        self.register = self.register[1:] + [new_bit]

    def shift_right(self, new_bit=0):
        if new_bit not in [0, 1]:
            raise ValueError("new_bit must be 0 or 1")
        self.register = [new_bit] + self.register[:-1]

    def get_value(self):
        return int("".join(map(str, self.register)), 2)

    def __str__(self):
        return "".join(map(str, self.register))


@cocotb.coroutine
async def store_result(dut, store_result_reg):
    while True:
        await RisingEdge(dut.clk)
        if dut.uo_out.value.is_resolvable and dut.uo_out.value.integer is not None:
            if (dut.uo_out.value.integer >> 7) & 1:
                store_result_reg.shift_right(dut.uo_out.value.integer & 1)
        
@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    store_result_reg = ShiftRegister128()

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    cocotb.start_soon(store_result(dut, store_result_reg))
    
    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    key_vectors = [ "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000"]

    plain_vectors = [ "9f8e9892959afeeea080f1ea63e65b37", 
                      "d5be0328b8f87ffee3ecce3263f6ffc4", 
                      "49b261a460f273fce1209710987477d7", 
                      "4b28f378c35a5b9eac984d34c4de4d6a", 
                      "a6d89b14def82fffd738ce142088b8fd", 
                      "f52491fa7f6c7dd7e4da903cc15a6f1f", 
                      "5f3ab93e6b9c7f9e4754d24eaf2479ee", 
                      "02be0e8e26969ffde6042454e75473ee", 
                      "9bf44dc02af8e7d7b9ceb3ba1950fbec", 
                      "9e6646d808e04f3e85b241aa6334ebbb", 
                      "6410f08a4e4c5fef33c42bfed71cfffe", 
                      "9afcbf48a204f5f2dec2709c10ee55e2", 
                      "997c48caf9047fc9101a1368a4a0fe6f", 
                      "c0c0bc124e5ee5973a64cea8ad0073ff", 
                      "960e35fac5ac74fdf87e75ec42fe4ddf", 
                      "ba5e7a389ff2ef731906f3762570becd"]

    cipher_vectors = ["e0df57e57d292d90fdbab57cfdde08d4",
                      "d9165a86d28b9937cbd2b69142d29997",
                      "17623a525629fcf6fb389d2e2b9632af",
                      "600d82c9f20bf28fc204cc8e559fce6a",
                      "124b23e763e53fd82c42b23c836f7f66",
                      "4dd3e65c1a4045a3bd6749983ba807b1",
                      "561479bd5de510367871dbe91be94329",
                      "3c7fb435022b1704986b199f80aaa5ab",
                      "9c552d1b1cba61a0c1d741a3cf75a6e4",
                      "fe3af9194b3225a04f4183da5d7ce127",
                      "5da257dda331bf741cea3e9ee68e22fc",
                      "92e00628c05e5dbd137acafa4a797316",
                      "2ece9c1e6fd8c36e0641ca0390d43566",
                      "3746698394962e775a299e2885f14eee",
                      "16354f36eb5fb1707d26d8a686c5c8e7",
                      "5e15da4445d0eea480b3958cdd0030f8"]

    # clear registers
    # data_rdy = 3, debug_port=0, data_in=0 for 130 cycles
    dut.ui_in.value = ((3 << 6) + (0 << 5) + 0)
    await ClockCycles(dut.clk, 130)
    
    # data_rdy = 3, debug_port=1, data_in=0 for 130 cycles
    dut.ui_in.value = ((3 << 6) + (1 << 5) + 0)
    await ClockCycles(dut.clk, 130)

    # data_rdy = 3, debug_port=1, data_in=0
    dut.ui_in.value = ((3 << 6) + (0 << 5) + 0)
    
    dut._log.info("Test project behavior")

    for (key, pt, ct) in zip(key_vectors, plain_vectors, cipher_vectors):
        await ClockCycles(dut.clk, 2)
    
        # data_rdy = 0, debug_port =0, data_in = 0 for 2 cycles
        dut.ui_in.value = ((0 << 6) + (0 << 5) + 0)
        await ClockCycles(dut.clk, 2)
        
        # load pt
        for bit in hex_to_bits(pt):
            # data_rdy = 1, debug_port = 0, data_in = bit
            dut.ui_in.value = ((1 << 6) + (0 << 5) + bit)
            await ClockCycles(dut.clk, 1)
        
        # load key
        for bit in hex_to_bits(key):
            # data_rdy = 2, debug_port = 0, data_in = bit
            dut.ui_in.value = ((2 << 6) + (0 << 5) + bit)
            await ClockCycles(dut.clk, 1)

        # data_rdy = 0, debug_port = 0, data_in = 0
        dut.ui_in.value = ((0 << 6) + (0 << 5) + 0)
        await ClockCycles(dut.clk, 1)

        # start encryption
        # data_rdy = 3, debug_port = 0, data_in = 0
        dut.ui_in.value = ((3 << 6) + (0 << 5) + 0)
        await ClockCycles(dut.clk, 64*71)

        print("Key ", key)
        print("PT  ", pt)
        print("CT  ", ct)
        print("OUT ", hex(store_result_reg.get_value()))
        assert(store_result_reg.get_value() == int(ct, 16))

        await ClockCycles(dut.clk, 2)

    
