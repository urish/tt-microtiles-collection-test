![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# SQUARE-1

This repository contains Verilog code for an entry into the
[Tiny Tapeout](https://tinytapeout.com/) demoscene hardware competition,
part of the TT08 run in 2024.

See [the technical documentation](docs/info.md) for what exactly this project does
and how to use it.

## Set up the Verilog project

\[from the [project template](https://github.com/TinyTapeout/tt08-verilog-template)\]

1. Add your Verilog files to the `src` folder.
2. Edit the [info.yaml](info.yaml) and update information about your project, paying special attention to the `source_files` and `top_module` properties. If you are upgrading an existing Tiny Tapeout project, check out our [online info.yaml migration tool](https://tinytapeout.github.io/tt-yaml-upgrade-tool/).
3. Edit [docs/info.md](docs/info.md) and add a description of your project.
4. Adapt the testbench to your design. See [test/README.md](test/README.md) for more information.

The GitHub actions will automatically build the ASIC files using [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/).

## License

The code in this repository is licensed under the Apache License, Version 2.0.
