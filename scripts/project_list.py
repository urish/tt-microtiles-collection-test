#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2024, Tiny Tapeout LTD
# Author: Uri Shaked

import json
import os

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), os.path.pardir))


def main():
    shuttle_index = json.load(open("shuttle_index.json"))
    for project in shuttle_index["projects"]:
        macro = project["macro"]
        skip_reason = None

        if macro == "tt_um_chip_rom":
            skip_reason = "chip ROM"
        elif "analog_pins" in project:
            skip_reason = "Analog project"
        elif not os.path.isfile(os.path.join(ROOT, macro, "src/config.json")):
            skip_reason = "No config.json"

        if skip_reason:
            print(f"          #- {macro} # skip: {skip_reason}")
        else:
            print(f"          - {macro}")


if __name__ == "__main__":
    main()
