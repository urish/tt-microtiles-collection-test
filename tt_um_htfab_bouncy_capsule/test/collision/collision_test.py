import cocotb
from cocotb.triggers import Timer

from math import sqrt, sin, cos, pi, floor, ceil
import itertools

splits = [(3, 0, 0), (2, 1, 0), (2, 0, 1), (1, 2, 0), (1, 1, 1), (1, 0, 2), (0, 3, 0), (0, 2, 1), (0, 1, 2), (0, 0, 3)]
signals = ('vx', 'vy', 'w', 'imp', 'phi_rot', 'vs', 'vm', 'ws', 'wm', 'vsn', 'vmn', 'wsn', 'wmn', 'impn', 'vxn', 'vyn', 'wn', 'vxt', 'vyt', 'wt', 'impact')


def collision_response(vs, v, ws, w, phi, rd):
    theta = 1.61
    ve = 2 * v + 1
    we = 2 * w + 1
    vq = -sqrt(ve) if vs else sqrt(ve)
    wq = -sqrt(we/theta) if ws else sqrt(we/theta)
    pr = (phi/4 + 1/8) * pi
    cp = cos(pr)
    j = 2 * (vq + wq*cp) / (1 + cp**2 / theta)
    j = max(j, 0)
    vqo = vq - j
    wqo = wq - j*cp/theta
    veo = vqo**2
    weo = wqo**2 * theta
    assert abs(ve+we-veo-weo) < 1e-6, "Conservation of energy"
    vo = (veo-1)/2
    wo = (weo-1)/2
    vos = 1 if vqo < 0 else 0
    wos = 1 if wqo < 0 else 0
    assert abs(v+w-vo-wo) < 1e-6
    if vo < 0:
        vr = 0
    elif vo > v+w:
        vr = v+w
    elif rd:
        vr = int(floor(vo))
    else:
        vr = int(ceil(vo))
    wr = v+w - vr
    impact = min(max(round(0.647 * j), 1 if j > 1e-6 else 0), 3)
    return (vos, vr, wos, wr, impact)


@cocotb.test()
async def collision_test(dut):

    async def delay():
        await Timer(1, units='ns')

    async def tick():
        dut.clk.value = 0
        await delay()
        dut.clk.value = 1
        await delay()

    async def init():
        dut.clk.value = 0
        dut.rst.value = 1
        dut.update.value = 0
        dut.rotate.value = 0
        dut.mirror.value = 0
        dut.init_vx.value = 2
        dut.init_vy.value = 1
        dut.init_w.value = 0
        dut.phi.value = 1
        dut.round_dir.value = 0
        await tick()
        dut.rst.value = 0
        await tick()

    async def testcase(rot, mir, vxs, vx, vys, vy, ws, w, phi, rd):
        dut.init_vx.value = vxs << 2 | vx
        dut.init_vy.value = vys << 2 | vy
        dut.init_w.value = ws << 2 | w
        dut.rst.value = 1
        await tick()
        dut.rst.value = 0
        await tick()
        dut.update.value = 1
        dut.rotate.value = rot
        dut.mirror.value = mir
        dut.phi.value = phi
        dut.round_dir.value = rd
        await delay()
        sig = {name: dut._id(name, extended=False).value for name in signals}
        await tick()
        dut.update.value = 0
        await tick()
        vxt = int(dut.vxt.value)
        vyt = int(dut.vyt.value)
        wt = int(dut.wt.value)
        impact = int(dut.impact.value)
        qmap = {8: (0, 0), 14: (0, 1), 18: (0, 2), 21: (0, 3), 56: (1, 0), 50: (1, 1), 46: (1, 2), 43: (1, 3)}
        vxos, vxo = qmap[vxt]
        vyos, vyo = qmap[vyt]
        wos, wo = qmap[wt]
        return (vxos, vxo, vyos, vyo, wos, wo, impact, sig)

    await init()

    logmap = {}
    submap = {}
    for run in range(10):
        for vx, vy, w in splits:
            for vxs, vys, ws, rot, mir, rd in itertools.product(range(2), repeat=6):
                for phi in range(4):
                    params = (rot, mir, vxs, vx, vys, vy, ws, w, phi, rd)
                    *outputs, sig = await testcase(*params)
                    outputs = tuple(outputs)
                    if params in logmap:
                        assert logmap[params] == outputs
                    else:
                        logmap[params] = outputs
                        vxos, vxo, vyos, vyo, wos, wo, impact = outputs
                        vs = (1-vxs if mir else vxs) if rot else (1-vys if mir else vys)
                        v = vx if rot else vy
                        phr = (phi + 2) % 4 if rot else phi
                        vos = (1-vxos if mir else vxos) if rot else (1-vyos if mir else vyos)
                        vo = vxo if rot else vyo
                        subparams = (vs, v, ws, w, phr, rd)
                        suboutputs = (vos, vo, wos, wo, impact)
                        if subparams in submap:
                            assert submap[subparams] == suboutputs
                        else:
                            submap[subparams] = suboutputs
                            target = collision_response(*subparams)
                            if vo + wo != v + w or suboutputs != target:
                                print(subparams, '=>', suboutputs, flush=True)
                                print(params, '=>', outputs, flush=True)
                                for name, value in sig.items():
                                    print(name, ':', value, flush=True)
                            assert vo + wo == v + w
                            assert suboutputs == target

