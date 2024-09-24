# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES = project.v
MODULE_SRC_DIR = $(PWD)/../src/ssd1306_oled_frequency_counter/src
MODULE_SRC = shift_register.sv spi.sv ssd1306_microcode_rom.sv ssd1306_microcode_exec.sv ssd1306_driver.sv counter_bcd_1digit.sv counter_bcd_Ndigits.sv counter_bcd_1digit_async_rst.sv counter_bcd_Ndigits_async_rst.sv decoder_bin_to_7seg.sv decoder_7seg_to_21x32pix.sv data_streamer.sv oled_frequency_counter.sv

ifneq ($(GATES),yes)

# RTL simulation:
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))
VERILOG_SOURCES += $(addprefix $(MODULE_SRC_DIR)/,$(MODULE_SRC))
COMPILE_ARGS 		+= -I$(MODULE_SRC_DIR) -I$(SRC_DIR)

else

# Gate level simulation:
SIM_BUILD				= sim_build/gl
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

endif

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
