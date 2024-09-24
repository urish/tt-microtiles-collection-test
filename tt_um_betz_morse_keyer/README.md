![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# Morse Keyer - A lightweight hardware (Verilog) keyer for CW training

- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital and analog designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## About this Verilog Project

Please see [docs/info.md](docs/info.md) for a description of this project. An application schematic is shown below.

This design is a CW keyer taking paddle (Iambic) inputs and outputting dits and dahs to a radio/LED/buzzer for training and play. WPM control and Iambic/Straight key selection are done with inputs 7:4 and 0:1, respectively. It also outputs active-high LED controls for a 7-segment display on the board. This design takes advantage of input dip switches and an output seven-segment display present on the demo PCB kit provided with most Tiny Tapeout orders. For more, see: [https://www.tinytapeout.com/specs/pcb/](https://www.tinytapeout.com/specs/pcb/)

If you'd like to use this HDL in your own system, be sure to check the I/O mappings shown in [src/project.v](src/project.v) and adjust accordingly.

The [cocotb](https://docs.cocotb.org/en/stable/index.html) testbench is admittedly sparse. More rigorous testing has been performed with a Spartan 7 FPGA with no noticeable issues.

## Application Schematic for UIO PMOD Port

![KiCad Application Schematic - 2024 Sep 02](https://github.com/b-etz/tt08-morse-keyer/blob/main/docs/application_schematic.jpg?raw=true)
