![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

(Note, these fail until your project is properly configured.)

# Overview

This repository provides a starting template for developing and submitting a Tiny Tapeout project using the Makerchip online IDE.

Or it is a project created from this template, with its own [documentation](docs/info.md).

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital and analog designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Makerchip for Tiny Tapeout

Makerchip is an online IDE for digital circuit design supporting Verilog or [TL-Verilog](https://tl-x.org) development. The starting code template in this repository enables development for Tiny Tapeout with simulation in a [Virtual Tiny Tapeout Lab](https://github.com/os-fpga/Virtual-FPGA-Lab).

[![tt08-makerchip](https://github.com/stevehoover/tt08-makerchip-template/assets/11302288/0be4791c-28ee-4533-8543-29d9020e4851)](https://youtu.be/afF3z4gzv9Y)

[5-Min Start-to-Finish Screen Capture](https://youtu.be/afF3z4gzv9Y) demonstrating the development of a Verilog Tiny Tapeout 8 project using Makerchip, starting in a new browser window and ending with a project submission.

## Prepare your Project

> [!NOTE]
> GitHub README links always open in the same tab by default. Use Ctrl-click below to open in a new tab.

1. **Create:** While logged in to GitHub, visit [this template repository](https://github.com/stevehoover/tt07-tl-verilog-template) and "Use this template", then "Create a new repository".
1. **Enable GitHub Pages** (for your new repo)**:** See [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part).
1. **Document:** Edit [docs/info.md](docs/info.md) and add a description of your project.
1. **Configure:** Edit the [info.yaml](info.yaml) and update information about your project, including the `top_module` property.

## Develop your Project

1. **Open:** [Open the starting template (src/project.tlv) in Makerchip](https://www.makerchip.com/sandbox?code_url=https:%2F%2Fraw.githubusercontent.com%2Fstevehoover%2Ftt07-tl-verilog-template%2Fmain%2Fsrc%2Fproject.tlv) and use the "Project" menu to save your file, or clone this repository and open `src/project.tlv` from [a fresh Makerchip session](https://makerchip.com/sandbox). Makerchip projects are currently limited to this single source file plus any TL-Verilog libraries included via URL.
1. **Configure:** Using settings near the top of the file, specify your project's top module name in the format `tt_um_<github-username>_<project-name>`.
1. **Edit:** Code your Verilog and/or TL-Verilog where designated by code comments. (The "Learn" menu has resources for learning TL-Verilog. Prior Makerchip-based submissions are referenced below under [Resources](#resources)).
1. **Verify:** Adapt the cocotb testbench to your design (see [test/README.md](test/README.md)) and/or verify your design in Makerchip by modifying the `top` module.
1. **Build:** With every update in GitHub, GitHub Actions workflows automatically build the ASIC files using [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/). Debug any failures in these workflows. View your layout to size your design appropriately.
1. **Test:** Optionally, get yourself a [Demo Board](https://tinytapeout.com/guides/get-started-demoboard/). These are really cool! [Use instructions with Makerchip and Wokwi](https://docs.google.com/document/d/e/2PACX-1vTCpb11-ZiFI2Xga6pHhZgTvN9GKuUFN9VTemRUJ-y3b5zR1dfbSRG_pTLokr0Cl9_lOpAwFZ21mowQ/pub) from [ChipCraft Course](https://github.com/efabless/chipcraft---mest-course).

> [!NOTE]
> You can run tests locally with `cd test; make`. In case of local build errors, note that the `Makefile` uses the cocotb Makefile which messes with the Python environment and
> can break the SandPiper(TM) command that compiles the `.tlv` code. If you encounter Python environment errors, look for
> the SandPiper command in the `make` output, and run it manually. Then run `make` (as a pre-check for testing via GitHub).

## Submit your Project

1. **Update:** Review and update your documentation ([docs/info.md](docs/info.md)) and project configuration ([info.yaml](info.yaml)).
2. **Submit:** As described at [tinytapeout.com](tinytapeout.com/), [submit your project repository for the next shuttle](https://app.tinytapeout.com/).

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://tinytapeout.com/discord)
- [Build your design locally](https://docs.google.com/document/d/1aUUZ1jthRpg4QURIIyzlOaPWlmQzr-jBn3wZipVUPt4)
- [Reference this calculator example](https://www.makerchip.com/sandbox?code_url=https:%2F%2Fraw.githubusercontent.com%2Fstevehoover%2Fmakerchip_examples%2Fmain%2Ftiny_tapeout_examples%2Ftt_um_calculator.tlv#)
- See other [example designs](https://github.com/efabless/chipcraft---mest-course/blob/main/reference_designs/README.md) created in the [ChipCraft Course](https://github.com/efabless/chipcraft---mest-course)
- Learn TL-Verilog within the [Makerchip IDE](https://makerchip.com).

## What next?

Share your project on your social network of choice:
- LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [@TinyTapeout](https://www.linkedin.com/company/100708654/)
- Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
- X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@tinytapeout](https://twitter.com/tinytapeout)
