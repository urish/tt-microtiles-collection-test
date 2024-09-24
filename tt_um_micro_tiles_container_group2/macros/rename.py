# SPDX-License-Identifier: Apache-2.0
# Author: Uri Shaked

# This script prepares three more copies of the tt_um_micro_test project, so we can easily test the container.

import klayout.db as pya

KLAYOUT = pya.Layout()

with open(f"tt_um_micro_test.lef", "r") as f:
    lef_data = f.read()
with open(f"tt_um_micro_test.v", "r") as f:
    verilog_data = f.read()

KLAYOUT.read("tt_um_micro_test.gds")
top_cell = KLAYOUT.top_cell()
assert top_cell.name == "tt_um_micro_test"

for i in range(2, 5):
    top_cell.name = f"tt_um_micro_stub_{i}"
    KLAYOUT.write(f"tt_um_micro_stub_{i}.gds")

    with open(f"tt_um_micro_stub_{i}.lef", "w") as f:
        f.write(lef_data.replace("tt_um_micro_test", f"tt_um_micro_stub_{i}"))

    with open(f"tt_um_micro_stub_{i}.v", "w") as f:
        f.write(verilog_data.replace("tt_um_micro_test", f"tt_um_micro_stub_{i}"))
