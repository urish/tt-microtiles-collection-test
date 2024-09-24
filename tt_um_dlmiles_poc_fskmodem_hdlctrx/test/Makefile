# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES += top_tt_um_dlmiles_poc_fskmodem_hdlctrx.v
PROJECT_SOURCES += ModemTop.v

ifneq ($(CI),true)
# Only for local simulation, at this time all CI and production removes this feature,
#  but ideally we want it included in GHA pre-synth simulation (need to add verilog ifdef)
NOCI_COMPILE_ARGS = -DHAVE_DEBUG_FSKMODEM_HDLCTRX
NOCI_EXTRA_ARGS   = -DHAVE_DEBUG_FSKMODEM_HDLCTRX
endif

ifneq ($(GATES),yes)

# RTL simulation:
SIM_BUILD		= sim_build/rtl
VERILOG_SOURCES 	+= $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))
COMPILE_ARGS 		+= -I$(SRC_DIR)

ifeq ($(SIM),icarus)
# FIXME review this (for the dlrtp.v)
COMPILE_ARGS		+= -DFUNCTIONAL
endif

else

# Gate level simulation:
SIM_BUILD	= sim_build/gl
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

ifeq ($(SIM),icarus)
COMPILE_ARGS    += -DTIMING
COMPILE_ARGS    += -DUNIT_DELAY=\#1
COMPILE_ARGS    += $(NOCI_COMPILE_ARGS)
endif

ifeq ($(SIM),verilator)
EXTRA_ARGS += -Wno-WIDTHTRUNC
EXTRA_ARGS += --trace --trace-structs --no-timing
# FIXME review this (for the maj3.v)
EXTRA_ARGS += -DFUNCTIONAL
EXTRA_ARGS += -DUNIT_DELAY=
#COMPILE_ARGS    += -DUSE_POWER_PINS
EXTRA_ARGS += $(NOCI_EXTRA_ARGS)

ifeq ($(COVERAGE),yes)
EXTRA_ARGS += --coverage --coverage-underscore
endif

ifeq ($(RANDOM_POLICY),zero)
PLUSARGS += +verilator+rand+reset+0
else ifeq ($(RANDOM_POLICY),one)
PLUSARGS += +verilator+rand+reset+1
else ifeq ($(RANDOM_POLICY),random)
PLUSARGS += +verilator+rand+reset+2
endif
endif


TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
