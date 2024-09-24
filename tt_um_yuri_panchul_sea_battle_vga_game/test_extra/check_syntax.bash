#!/usr/bin/env bash

iverilog -g2005-sv -s tb -I ../src ../src/*.sv ../test/*.v
rm -rf a.out
