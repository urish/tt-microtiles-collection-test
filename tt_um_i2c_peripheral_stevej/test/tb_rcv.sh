#!/bin/bash

set -oex

iverilog -g2012 -I ../src -o tt08_rcv_tb tb_byte_receiver.v ../src/i2c_periph.v ../src/byte_receiver.v ../src/byte_transmitter.v
vvp tt08_rcv_tb
