set -e
iverilog ../src/pwm4bit.v  ../src/sndgen.v  ../src/top.v   ../src/vga.v top_tb.v -o sim.exe
vvp sim.exe
