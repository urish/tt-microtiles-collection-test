import cocotb
from cocotb.triggers import Timer
import itertools


def nand(a, b):
    return ((a&b)^1,)

def u21(a, b, c, d):
    return ((a&~b)^c^d,)

def u31(a, b, c, d, e, f):
    return ((((a^~b)&c)|(d^e))^((d|~a)&b)^f,)

def u22(a, b, c, d, e, f):
    return ((((a&~b)^c^d)&(c|e|a))^((b^a^f)|(d&~c)),
            (((a&~b)^c^d)&(c|e|~a))^((b^a)|(d&~c)|e))

def u41(a, b, c, d, e, f, g, h, i, j):
    return (((((a|b)&(c|~d))^(e&f)^(g&h))&(((f^d)|(i^~h))^(g|b)^(~h|b)))^
            ((((e|~g)^j^f)&(e|~g)&(e^~b))|((a^b)&~j&~c)|(j&~i)|h|d)^
            ((((a^d)&c&~f)^(e|~g)^(h&~b))&((a&~b)|j|g)&(g|f)&~e&i)^
            (((j&~g)|(a^~b))&((i&d)|~a|~f))^((~c|i)&(i|b))^((j|f)&~h&a),)


async def run_testcase(in_pins, out_pins, func, dut):
    for in_values in itertools.product((0, 1), repeat=len(in_pins)):
        for p, v in zip(in_pins, in_values):
            p.value = v
        await Timer(20, units='ns')
        out_values = func(*in_values)
        for p, v in zip(out_pins, out_values):
            assert p.value == v
        assert dut.uio_out.value == 0
        assert dut.uio_oe.value == 0


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    dut.clk.value = 0
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    dut.rst_n.value = 1

    inputs = [dut.ui_in[i] for i in range(8)] + [dut.uio_in[i] for i in range(8)]
    outputs = [dut.uo_out[i] for i in range(8)]

    await run_testcase(inputs[0:4], outputs[0:1], u21, dut)
    await run_testcase(inputs[0:6], outputs[1:2], u31, dut)
    await run_testcase(inputs[0:6], outputs[2:4], u22, dut)
    await run_testcase(inputs[0:10], outputs[4:5], u41, dut)
    await run_testcase(inputs[4:6], outputs[5:6], nand, dut)
    await run_testcase(inputs[6:10], outputs[6:7], u21, dut)
    await run_testcase(inputs[10:16], outputs[7:8], u31, dut)

