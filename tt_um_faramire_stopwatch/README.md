![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# Tiny Tapeout 8: Simple Stopwatch

This is a verilog stopwatch to be realised in a "rideshare" open source ASIC organised by Tiny Tapeout.
I made a very similar stopwatch as part of an assignment in an FPGA class in VHDL, and wanted to learn verilog and ASIC design by porting it over.

With 3 buttons, a stopwatch with 1/100th second resolution can be started and stopped, as well as a lap time kept temporarily.

For more, read the [Tiny Tapeout documentation](docs/info.md)

## How to use

You will need the Tiny Tapeout 6 PCB/chip. See the [Tiny Tapeout documentation](docs/info.md).
A minimum of 2 buttons, preferrably 3 are needed.
This project was designed to display its output via SPI using a MAX7219/MAX7221 driven 7-segment display with 8 digits. If you have something else that can decode that, this should work as well. I will try to add some documentation on this, if I did not, check out the documentation of the MAX chip.

## What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip.
Each run, one or more tiles can be bought on the overall chip and filled with custom designs.

To learn more and get started yourself, visit https://tinytapeout.com and/or [Join the community](https://tinytapeout.com/discord).
