# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2024 Uri Shaked

from PIL import Image, ImageDraw

debug = False  # Set to True to save the images to disk

module = [
    "/*",
    " * Copyright (c) 2024 Uri Shaked",
    " * SPDX-License-Identifier: Apache-2.0",
    " */",
    "",
]

for i in range(1, 12):
    img = Image.new("L", (64, 64), "white")
    num = 2**i

    font_size = 48 if num < 100 else 36 if num < 1000 else 28

    draw = ImageDraw.Draw(img)
    draw.text(
        (32, 32),
        str(num),
        fill="black",
        align="center",
        font_size=font_size,
        anchor="mm",
    )

    if debug:
        img.save(f"glyph_{num}.bmp")

    pix = bytearray(64 * 64 // 8)

    for y in range(img.height):
        for x in range(img.width):
            color = img.getpixel((x, y))
            if color < 128:
                pix[y * 8 + x // 8] |= 1 << (x % 8)

    module.append(f"module glyph_{num} (")
    module.append("    input wire [5:0] x,")
    module.append("    input wire [5:0] y,")
    module.append("    output wire pixel")
    module.append(");")
    module.append("")
    module.append("  reg [7:0] mem[511:0];")
    module.append("  initial begin")
    for i, byte in enumerate(pix):
        module.append(f"    mem[{i}] = 8'h{byte:02x};")
    module.append("  end")
    module.append("")
    module.append("  wire [8:0] addr = {y[5:0], x[5:3]};")
    module.append("  assign pixel = mem[addr][x&7];")
    module.append("")
    module.append("endmodule")
    module.append("")

with open("../src/glyph_rom.v", "w") as f:
    f.write("\n".join(module))
