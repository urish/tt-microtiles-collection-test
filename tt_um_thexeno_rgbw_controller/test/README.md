# Testbench for TT08 RGBW Controller

This testbench uses [cocotb](https://docs.cocotb.org/en/stable/) to drive the DUT and check the outputs.
See below to get started or for more information, check the [website](https://tinytapeout.com/hdl/testing/).

## Testbench

This testbench runs a sequence between different color modes, and outputs 4 PWM sequences as a result. Data is not automatically asserted, but waveforms were inspected manually in this first implementation.
The RTL waveforms (in .vcd format) are always tested against the flattened gate-level (hardened) design to evaluate the correctness of the design.

For more info in the design, check [the documentation](docs/info.md).

Here below a quick run up of the flow if needed to interact with the testbench.

## Silicon test with the TT08 Demoboard

To test the design with the TT08 Demoboard, simply connect the board on the USB port, connect to a terminal to run Micropython on the mounted RP2040, then copy in the terminal the script [script from here](./rp2040_demoboard/bringup_test_pico.py). It will run a sequence of the RGB color wheel. Each color is generated locally by the color processors as a response of the color ID, tint and intensity desired.

A starting point on how to use the demoboard with the TT08 chip containing the RGBW Controller ASIC, check the [official website of the demoboard](https://tinytapeout.com/guides/get-started-demoboard/) of the TinyTapeout project.

## Silicon test with an STM32

To test with other MCUs, a tiny firmware to convert UART to SPI was implemented in STM32 board (specifically a B-L475E-IOT01). The firmware can be easily ported to any STMCubeIDE supported MCU/devboard. It is assumed that, if you prefer this way instead of the RP2040, you know how to copy/paste the project to another board so this step is skipped.

This testing was done just to develop before having the RP2040, and is kept as a valid source in case to extend the RP2040 script on the demoboard. 

Pinout: 

UART TX = PB6

UART RX = PB7

CS = Arduino D8 header (PA2)

MOSI = Arduino D11 header (PA7)

SCK = Arduino D13 header (PA5)


Then connect the board via the USB cable, and once the VCOM is correctly detected, run the [dedicated python script](./stm32/mcu_custom_serial_test.py). Remeber to adapt the VCOM address first.

## How to run the testbench

### To run the RTL simulation:

```sh
make -B
```
A .vcd containing the waveforms is generated and can be instepcted with a waveform analyzer, i.e. GTKwave.

To run gatelevel simulation, first harden your project and copy `../runs/wokwi/results/final/verilog/gl/{your_module_name}.v` to `gate_level_netlist.v`.

Then run:

```sh
make -B GATES=yes
```

### If you don't have a locally hardened project:

Download from the GitHub actions the gate level .vcd, and replace the previously generated .vcd with this one. Then run the same ```make -B``` command.


## How to view the VCD file

```sh
gtkwave tb.vcd tb.gtkw
```
