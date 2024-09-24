![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# FSK Modulator/Demodulator Full-Duplex<br/>with HDLC frame transceiver<br/>with UART+FIFO

TT08 Resubmission of the original intention of the TT06 submission.  The
outline internal digital design structure exists, the TX appears to be
generating HDLC looking frames at the output.  None of the RX is in place
and various muxes, modes and test points have not been validated as all
being present and routed correctly.

TT06 fc1c5510a is the actual submission, due to working right upto the
deadline I ended up with not having a viable GDS in the last few hours
that was the most recent action.  The feature to pick an older commit-id
to submit for fabrication was not in place so I had to delete GHA results
to wind back to a last good GDS build, which did not contain anything useful.

TODO create block diagram and logical diagram showing test points and
muxing.

This is the first phase (digital side only) of a mixed signal (analogue and
digital) project using TinyTapeout.

NOTE: This is a proof-of-concept to iron out the electrical interfaces (to
host CPU over UART and also radio transceiver equipment) in lieu of a next
phase that includes the analogue components draw into GDS to complete the
solution.

The design is based on the well known Amateur Radio G3RUH modem originally
published in the ARRL 7th Computer Networking Conference (US) Oct 1988.
pps 135-140.

2FSK Continuous-phase frequency-shift keying modular and demodulator capable
of full-duplex operation.  This includes a scrambler/descrambler, receiver
PLL clock recovery, zero crossing detector, PLL lock indicator for DCD,
transmit audio anti-alising filter.

On the HDLC side it includes full-duplex hardware with NRZI encoding,
synchronous bit-stuffing and synchronize/abort sequence detection, CRC16 CCITT
FCS generator and validation.  Data underrun on transmit (with automatic
abort sequence generation) and data overrun on receive (when UART was full).

On the UART side it includes full-duplex hardware with a small FIFO (rx=4
bytes, tx=8 bytes) that acts more like a cut-through modem (not a
store-and-forward) as is usually found with Amateur radio TNC hardware.
The serial framing protocol is a modified KISS protocol which itself is
based on SLIP protocol used with early kilobit serial Internet point-to-point
links.  The modification mainly handles the cut-through nature and also
exposes the original FCS so it is possible for the host to optionally
validate (across the UART link) data corruption on that part (this is an
unusual feature in the scene but is easier to implement and results in a
better solution).  A frame abort sequence was added which is an illegal
KISS sequence of FESC FESC to account for CRC errors allowing the host
to discard the received data.

The UART is pretty fixed in configuration 8N1 (as is usual for TNC) with
the two data rate options x2 or x1 the speed of the modem.  The x2 is
expected to be the nominal mode of operation, because when converting async
data to sync data you are sending 10 bits for every 8 across the link, so
the UART can not keep up,  HDLC serial links require no underrun conditions
to occur as there is no way to mark time.  The x1 mode only exists to
validate confirm error handling condition does not exist for any other purpose.

Additional control mechanisms and signals exist to handle various normal
error conditions that may exist during operation, OVERRUN, UNDERRUN, BAD FCS,
DCD indication, transmit mode active indication.  The UART generally obeys
the RTS/CTS signalling (and requires the other end to do so) as it is
expected during transmit the UART TX FIFO will fill and the host must stop
sending,  There are some potentially tight timings needed on this matter
that may mandate flow control hardware assist by the host controller side,
especially while the FIFO maybe only 4 octets (bytes) deep.  This maybe
reviewed in a later revision.  Some errors are sticky in nature once they
occur and require a soft-reset using the inactive.

A future revision might allow some UART control commmands to key-up the
transmitter sending some test sequences (continuious SYNC generation,
repeated start frame and abort frame at various lengths) it is unclear what
maybe useful at this time for testing.

The original design include a BERT mode (as it includes a self-container
scrambler/descramler) it is possible to check the link by sending continious
ZERO or ONE and monitor the receiver and count the data rate distance before
a transition was seen.  This feature is included in this design the BERT
mode is a reset configuration option.

With the assistance of appropiate controller software, I would like the
resulting solution to be capable of performing automatic bit-error-rate
calculations, automatic transmit/receive calibration for point to point
links, and automatic detection of common misconfigurations concerning the
setup.  So additional modes of operation for this maybe added to the KISS
command packet level to allow host control of the BERT mode entry/exit.
Sending control packets and entry/exit of BERT mode with a receiver side
counter for data transition count, that can be read-back over KISS seems
like most of the solution.

This is more about characteriszing any non-liner response found on the audio
transmit or audio receive that is fed back into the ROM lookup to achieve a
better bit-error-rate and SnR so the communication link works better in poor
RF conditions/environments.

# Tiny Tapeout Verilog Project Template

- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Verilog Projects

1. Add your Verilog files to the `src` folder.
2. Edit the [info.yaml](info.yaml) and update information about your project, paying special attention to the `source_files` and `top_module` properties. If you are upgrading an existing Tiny Tapeout project, check out our [online info.yaml migration tool](https://tinytapeout.github.io/tt-yaml-upgrade-tool/).
3. Edit [docs/info.md](docs/info.md) and add a description of your project.
4. Optionally, add a testbench to the `test` folder. See [test/README.md](test/README.md) for more information.

The GitHub action will automatically build the ASIC files using [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/).

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
  - X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@matthewvenn](https://twitter.com/matthewvenn)
