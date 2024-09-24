import cocotb
from cocotb.triggers import Timer

import numpy as np
import struct
import wave

@cocotb.test()
async def resonator_test(dut):

    async def delay():
        await Timer(1, units='ns')

    async def tick():
        dut.clk.value = 0
        await delay()
        dut.clk.value = 1
        await delay()

    async def init():
        dut.clk.value = 0
        dut.reset.value = 1
        dut.trigger.value = 0
        dut.update.value = 0
        dut.tension.value = 0
        await tick()
        dut.reset.value = 0
        await tick()

    tf = open("resonator_test.out", "w")

    wf = wave.open("resonator_test.wav", "w")
    wf.setnchannels(1)
    wf.setsampwidth(2)
    wf.setframerate(44100)

    dut.tension.value = 5
    dut.trigger.value = 3
    await tick()
    dut.trigger.value = 0
    await tick()
    for i in range(10000):
        dut.update.value = 1
        await tick()
        dut.update.value = 0
        for j in range(20):
            await tick()
        print(dut.v.value.signed_integer, dut.x.value.signed_integer, dut.xn.value.signed_integer, dut.xn.value.signed_integer, file=tf, flush=True)
        wf.writeframesraw(struct.pack('<h', dut.sample.value.signed_integer << 4))

    tf.close()
    wf.close()

