import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

CMD_SHIFT_CFG = 0;
CMD_RUN = 1;

ROWS = 7;
COLS = 6;

RST = 1
NRST = 0

IN_BELOW = 0
IN_ABOVE = 1
IN_LEFT  = 2
IN_COL0  = 3
IN_TOPROW  = 3

async def do_input_cycle(dut, rst, io_in, cmd, silent=False):
    await Timer(1, units='us')

    dut.rst.value = rst;
    dut.io_in.value = io_in;
    dut.cmd.value = cmd;
    dut.clk.value = 0;

    if not silent:
        dut._log.info("sending rst={} in={} cmd={}".format(rst, io_in, cmd));
    await Timer(2, units='us');
    dut.clk.value = 1;
    await Timer(3, units='us');
    dut.clk.value = 0;
    await Timer(4, units='us');

    val = dut.io_out.value;
    if not silent:
        dut._log.info("clock out {}".format(val));
    return val // 16;

async def do_reset(dut):
    dut._log.info("RESET")
    await do_input_cycle(dut, RST, 3, CMD_RUN);
    for i in range(10):
        # write some random cmd values, they should be ignored.
        # output is not guaranteed on the first cycle, but are afterwards.
        assert(await do_input_cycle(dut, RST, 3, CMD_RUN) == 0);

def assert_equal_array(a1, a2):
    a1str = ",".join([str(x) for x in a1])
    a2str = ",".join([str(x) for x in a2])
    assert a1str == a2str, "Expected equals [{}] != [{}]".format(a1str, a2str);

async def push_config_bits(dut, mux, cfg, silent=False):
    for r in range(ROWS - 2, -1, -1):
        for c in range(COLS - 1, -1, -1):
            await do_input_cycle(dut, NRST, cfg[r][c], CMD_SHIFT_CFG);
            await do_input_cycle(dut, NRST, mux[r][c], CMD_SHIFT_CFG);

# Make a spiraling mux across rows from 0,0 to R-1,0 => R-1,1 => 0,1
# If COLS is odd, the spiral will reach the other corner on the output.
def make_zigzag_mux():
    mux = make_cfg_matrix(0);
    for c in range(COLS):
        rows = range(ROWS - 1) if (c % 2 == 0) else range(ROWS - 2, -1, -1);
        d = (IN_BELOW * 4 + IN_BELOW) if  c % 2 == 0 else IN_ABOVE*4 + IN_ABOVE;
        first = True;
        for r in rows:
            print("Pushingg r={} c={} f={}".format(r, c, first));
            mux[r][c] = (IN_LEFT*4 + IN_LEFT) if first and c !=0 else d;
            first = False
    return mux;

def make_cfg_matrix(x):
    v = [];
    for r in range(ROWS - 1):
        v.append([x] * COLS);
    return v;

async def push_zigzag_config(dut, silent=False):
    return await push_config_bits(dut, make_zigzag_mux(), make_cfg_matrix(0), silent);

# @cocotb.test()
async def test_zigzag_dff(dut):
    await do_reset(dut);

    dut._log.info("Pushing zig zag config");
    await push_zigzag_config(dut, silent = False)
    
    dut.rst.value = 0;
    dut.clk.value = 0;
    dut.cmd.value = CMD_RUN;
    await Timer(1, units='us')

    val = dut.io_out.value.integer % 16;
    # needed if we want the values kept inside
    dut.io_in.value = val;

    dut._log.info("Getting values out");

    v = [val];
    while len(v) < 2*(ROWS - 1) * COLS:
        val = await do_input_cycle(dut, NRST, len(v) % 16, CMD_RUN, silent = True);
        v.append(val);
        # needed if we want the values kept inside
        # dut.io_in.value = val;

    # one big flip flop chain of 12 DFFs
    expected = [0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,7,8,9]
    assert_equal_array(v, expected);

@cocotb.test()
async def test_cfg0_isdff(dut):
    await do_reset(dut);

    cells = (ROWS-1)*COLS;

    cmd = CMD_SHIFT_CFG;
    dut._log.info("START test_cfg0_isdff")

    cfg = []
    cfg_back = []
    zeros_back = []
    # push bits into cells.. 2 registers per cell.
    for i in range(cells):
        dut._log.info("flopping in i={}".format(i));

        val = (7 + i) % 11
        cfg.append(val);
        val = await do_input_cycle(dut, NRST, val, cmd);

        if (i < cells - 1):
            zeros_back.append(val);
        else:
            cfg_back.append(val);
        
    assert zeros_back == [0] * (cells-1)

    # make sure we get back the same sequence when we shift out.
    # the first value was already shifted out above
    cfg_back = [cfg[0]]
    for i in range(len(cfg) - 1):
        cfg_back.append(await do_input_cycle(dut, NRST, 0, cmd));
    assert_equal_array(cfg, cfg_back);

    # at the end, now we're getting the zeros we just pushed.
    assert(await do_input_cycle(dut, NRST, 0, cmd) == 0);

# TODO(emilian): Make this work.
# @cocotb.test()
async def test_cfg02_bigloop_mux(dut):
    dut.rst.value = 1
    dut.io_in.value = 2;
    dut.cmd.value = 0;

    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("reset")
    await Timer(1, units='us')
    dut.rst.value = 1
    await ClockCycles(dut.clk, 10)
    await Timer(1, units='us')
    dut.rst.value = 0
    await Timer(1, units='us')

    await Timer(1, units='us')
    dut._log.info("pushing {}".format(7))
    dut.io_in.value = 7;
    await Timer(1, units='us')
    await ClockCycles(dut.clk, 1)
    val = dut.io_out.value;
    dut._log.info("clock out {}".format(val));
    assert int(val) == 0;

    for r in range(ROWS - 1):
        for c in range(COLS):
            # 10 routes both inputs from left, 0 from a lower row
            val = 10 if c == COLS - 1  else 0;
            dut._log.info("pushing {}".format(val))
            await Timer(1, units='us')
            dut.io_in.value = val;
            await Timer(1, units='us')

            await ClockCycles(dut.clk, 1)
            val = dut.io_out.value;
            dut._log.info("clock out {}".format(val));
            assert int(val) == 0;

            val = 0;  # cfg
            dut._log.info("pushing {}".format(val))
            await Timer(1, units='us')
            dut.io_in.value = val;
            await Timer(1, units='us')

            await ClockCycles(dut.clk, 1)
            val = dut.io_out.value;
            dut._log.info("clock out {} at {} {}".format(val, r, c));
            if (r == ROWS - 2 and c == COLS - 1):
                assert int(val) == 7 << 4;
            else:
                assert int(val) == 0;

    # switch to execution
    dut.cmd.value = 1;
        
    dut._log.info("dff test")
    for i in range(40):
        dut._log.info("pushing {}".format(i % 8))

        await Timer(1, units='us')
        dut.io_in.value = (i % 8);
        await Timer(1, units='us')

        await ClockCycles(dut.clk, 1)
        dut._log.info("clock out {}".format(dut.io_out.value))
