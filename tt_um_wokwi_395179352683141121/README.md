# 4-Bit Combination Lock

## How it works
Everything is controlled using the CLOCK, RESET, and input pins.
The first step after starting the simulation is pressing RESET.

### Setting a Passcode
To set a passcode, IN0 will need to be set to HIGH for the duration
of the setup. Then, create a combination of IN1, IN2, IN3, and IN4.
This will be your passcode after setting IN0 back to LOW. The passcode
can be reset anytime with IN0.
OUT 0~3 represent the current password of the lock.

### Unlocking
To unlock the combination lock, you will set IN1, IN2, IN3, and IN4 to
the previous combination in `Setting a Passcode`. To verify, set IN5
to HIGH. If correct, the LED at OUT4 will go HIGH.
The lock will only be in an unlocked state if IN5 is held at HIGH.
Returning IN5 back to LOW will lock the combination lock again.

### Number of Attempts
The user will only have 3 tries to get the right combination before
the input pins IN1, IN2, IN3, and IN4 become pin-locked (unusable). Once the 
lock become unusable, OUT5 will go LOW. A press of the RESET button will
turn it back to normal.

## How to test

The normal flow of using the design is to first set a password of your
liking (assuming you are the admin). Then, the lock would be free to use.
If in a case where the user failed three times to unlock the lock, it is up
to the admin to reset the pin-lock for continued use.

## External hardware

A microcontroller (or other hardware of sorts) that allows only the admin
to be able to reset the pin-lock is reccomended. Buttons, switches, or
other forms of input are necessary for physical operation of the lock.



![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg)

# Tiny Tapeout Wokwi Project Template

- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Wokwi Projects

Edit the [info.yaml](info.yaml) and change the wokwi_id to the ID of your Wokwi project. You can find the ID in the URL of your project, it's the big number after `wokwi.com/projects/`.

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
  - X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@matthewvenn](https://twitter.com/matthewvenn)
