![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg) ![](../../workflows/fpga/badge.svg)

# Tiny Tapeout Wokwi Project Template

- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital and analog designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Wokwi Projects

Edit the [info.yaml](info.yaml) and change the `wokwi_id` to the ID of your Wokwi project. You can find the ID in the URL of your project, it's the big number after `wokwi.com/projects/`.

The GitHub action will automatically fetch the digital netlist from Wokwi and build the ASIC files.

## Enable GitHub actions to build the results page

- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://tinytapeout.com/discord)
- [Build your design locally](https://docs.google.com/document/d/1aUUZ1jthRpg4QURIIyzlOaPWlmQzr-jBn3wZipVUPt4)

## What next?

- [Submit your design to the next shuttle](https://app.tinytapeout.com/).
- Edit [this README](README.md) and explain your design, how it works, and how to test it.
- Share your project on your social network of choice:
  - LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [@TinyTapeout](https://www.linkedin.com/company/100708654/)
  - Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
  - X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@tinytapeout](https://twitter.com/tinytapeout)
 
  - 
## How it works

This design executes binary operations on two octal numbers encoded in an 8-bit instruction and outputs the result to the 7-segment display.
The instruction is made up of 8 total bits.  

Bits 0 and 1 make up the operation code. Operations are according to the following table.
| Bit 0 | Bit 1 | Operation |
| -------- | ------- | ------- |
| 0 | 0 | ADD |
| 0 | 1 | OR |
| 1 | 0 | AND |
| 1 | 1 | XOR |

Bits 2, 3, and 4 make up operand A. Bit 2 is MSB and bit 4 is LSB.

Bits 5, 6, and 7 make up operand B. Bit 5 is MSB and bit 7 is LSB.

A full operation would be decoded like this
|Bit|0|1|2|3|4|5|6|7|
|---|---|---|---|---|---|---|---|---|
|Decoded|OP1|OP2|A(MSB)|A|A(LSB)|B(MSB)|B|B(LSB)|

## How to test

1. Craft a instruction following the above decoding table. 
2. Enter the instruction on the TT08 PCB's input pin dip switches.
3. View the result on the 7 segment display

   Note: An overflow condition during an add operation will illumniate the 7 segment display's DP.

Examples:
- 0 0 1 0 0 0 0 1 -> ADD 4, 1 -> Displays 5 on 7-Segment Display
- 1 1 1 0 0 1 0 1 -> XOR 4, 5 -> Displays 1 on 7-Segment Display
- 1 0 1 0 0 1 0 1 -> AND 4, 5 -> Displays 4 on 7-Segment Display
- 0 1 1 1 0 1 0 1 -> OR  6, 5 -> Displays 7 on 7-Segment Display
- 0 0 1 0 1 1 1 0 -> ADD 5, 6 -> 7-Segment Display DP illuminated indicating overflow condition

## External hardware

The only external hardware required is the 7 segment display provided by the tt08 PCB.
