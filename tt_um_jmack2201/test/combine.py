#!/usr/bin/env python3

import os

if os.path.isfile("vga_test.v"):
    os.system("rm vga_test.v;touch vga_test.v")

all_v = [v_file for v_file in os.listdir(".") if ".v" in v_file]
display = ["params.v","tt_um_jmack2201.v", "demoscene_wrapper.v", "hvsync_generator.v", "pixel_color.v", "sprite_rom0.v"]

for verilog_file in display:
    with open("../src/"+verilog_file,"r") as fp:
        if verilog_file == "tt_um_jmack2201.v":
            v_contents = fp.read().replace("tt_um_jmack2201","tt_um_vga_example") + "\n"
        else:
            v_contents = fp.read() + "\n"
    with open("vga_test.v","a") as fp1:
        fp1.write(v_contents)