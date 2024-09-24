# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES += $(PWD)/tb.v $(PWD)/tt_um_njp_micro.v $(PWD)/ALU.v $(PWD)/ControlUnit.v $(PWD)/DataPath.v $(PWD)/Decoder.v $(PWD)/MicroCodeROM.v $(PWD)/Mux2to1V1.v $(PWD)/Mux2to1V2.v $(PWD)/ProgramCounter.v $(PWD)/RegEight.v $(PWD)/RegFour.v $(PWD)/TimingGenerator.v $(PWD)/UniversalShiftReg.v

ifneq ($(GATES),yes)

# RTL simulation:
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(tb.v tt_um_njp_micro ALU.v ControlUnit.v DataPath.v Decoder.v MicroCodeROM.v Mux2to1V1.v Mux2to1V2.v ProgramCounter.v RegEight.v Reg4.v TimingGenerator.v UniversalShiftReg.v ))
COMPILE_ARGS 		+= -I$(SRC_DIR)

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
