#!/bin/bash

set -oex

iverilog -g2012 -I ../src -o tt08_top_tb tb_i2c.v ../src/i2c_periph.v ../src/byte_receiver.v ../src/byte_transmitter.v
vvp tt08_top_tb
