read_sdc $::env(SCRIPTS_DIR)/base.sdc

# Relax reset and input delays as they will not be changing while running
# Note for reset this assumes we can slow down the clock while coming out of reset
set_input_delay 1.5 -clock [get_clocks $::env(CLOCK_PORT)] {rst_n}
set_input_delay 1.5 -clock [get_clocks $::env(CLOCK_PORT)] {ui_in}

# Tighten timing on output to improve coherence
set_output_delay 20 -clock [get_clocks $::env(CLOCK_PORT)] {uo_out uio_out}
