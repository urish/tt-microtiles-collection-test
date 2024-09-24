# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2024 Tiny Tapeout
# Author: Uri Shaked

import yaml
import os

info_yaml_path = os.path.join(os.path.dirname(__file__), "../info.yaml")
with open(info_yaml_path, "r") as stream:
    try:
        info = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

sources = info["project"]["source_files"]
top_module = info["project"]["top_module"]
result = []

for source in sources:
    source_path = os.path.join(os.path.dirname(__file__), "../src/" + source)
    with open(source_path, "r") as f:
        code = (
            f.read()
            .replace(top_module, "tt_um_vga_example")
            # Workaround until the VGA Playground supports inverted sync signals
            .replace("  parameter H_SYNC_INV = 1;", "  parameter H_SYNC_INV = 0;")
            .replace("  parameter V_SYNC_INV = 1;", "  parameter V_SYNC_INV = 0;")
        )
    result.append(f"// == {source} ==\n\n")
    result.append(code + "\n\n")

print("".join(result))
