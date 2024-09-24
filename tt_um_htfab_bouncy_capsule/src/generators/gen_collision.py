#!/usr/bin/env python3

from math import sqrt, sin, cos, pi, floor, ceil
import itertools

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

cmap = {}
for v, w, phi in itertools.product(range(4), repeat=3):
    for vs, ws, rd in itertools.product(range(2), repeat=3):
        inp = f'{vs:01b}_{v:02b}_{ws:01b}_{w:02b}_{phi:02b}_{rd:01b}'
        if v + w > 3:
            out = 'x_xx_x_xx_xx'
        else:
            vos, vr, wos, wr, impact = collision_response(vs, v, ws, w, phi, rd)
            out = f'{vos:01b}_{vr:02b}_{wos:01b}_{wr:02b}_{impact:02b}'
        cmap[inp] = out

f = open('../coll_table.v', 'w')

f.write(f"""`default_nettype none

module coll_table(
    input wire [8:0] in,
    output reg [7:0] out
);

always @(*) begin
    case(in)
""")

for i, j in sorted(cmap.items()):
  f.write(f"        9'b{i}: out = 8'b{j};\n")

f.write("""    endcase
end

endmodule
""")

f.close()
