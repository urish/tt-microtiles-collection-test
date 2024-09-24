
TESTS := tests/*

.PHONY: $(TESTS)
.PHONY: all

all: $(TESTS) results.xml

EMILIAN_LOCAL_DEV ?= no

# Regenerate plain Verilog from SystemVerilog on local development.
# This also gets submitted to Github.
fpga_nobuf.v: fpga.sv
	sv2v  fpga.sv > fpga_nobuf.v

ifeq ($(EMILIAN_LOCAL_DEV),yes)

# Regenerate plain Verilog from SystemVerilog on local development.
# This also gets submitted to Github.
fpga.v: fpga.sv
	sv2v -DEMILIAN_ADD_BUFS=y fpga.sv > fpga.v

endif


$(TESTS): fpga.v
	@cd $@ && $(MAKE)

results.xml: $(TESTS)
	cat tests/*/results.xml > results.xml

.PHONY: clean
clean:
	$(foreach TEST, $(TESTS), $(MAKE) -C $(TEST) clean;)

regression:
	$(foreach TEST, $(TESTS), $(MAKE) -C $(TEST) regression;
