FILE ?= cla
TARGET ?= synth

simulation: test_pre
test_pre: $(FILE).sv $(FILE)_tb.sv $(MODULES)
	iverilog -g2012 -o test_pre $(FILE).sv $(FILE)_tb.sv $(MODULES)
	vvp test_pre

convert: $(FILE).sv $(MODULES)
	yosys -p 'hierarchy -top $(FILE); proc; write_verilog $(FILE).v;' $(FILE).sv $(MODULES)

synthesis: $(FILE).json
$(FILE).json: $(FILE).sv
	# yosys -p '$(TARGET) -dsp -spram -top $(FILE); write_json $(FILE).json;' $(FILE).sv $(MODULES)
	yosys -p '$(TARGET) -top $(FILE); write_json $(FILE).json;' $(FILE).sv $(MODULES)

visualize: $(FILE).pdf
$(FILE).pdf: $(FILE).json
	sed -i -e 's/inout/output/g' $(FILE).json
	netlistsvg $(FILE).json -o $(FILE).svg
	svgo $(FILE).svg
	rsvg-convert -f pdf -o $(FILE).pdf $(FILE).svg

pr: $(FILE).asc $(FILE)-routed.pdf $(FILE)-routed.png
$(FILE).asc $(FILE)-routed.pdf $(FILE)-routed.png: $(FILE).json
	nextpnr-ice40 --up5k --package sg48 --asc $(FILE).asc --json $(FILE).json --routed-svg $(FILE)-routed.svg
	rsvg-convert -f pdf -o $(FILE)-routed.pdf $(FILE)-routed.svg
	rsvg-convert -f png -o $(FILE)-routed.png $(FILE)-routed.svg

formal:
	sby -f $(FILE).sby

clean:
	rm -f test_pre *.vcd $(FILE).json* $(FILE).asc $(FILE).bin $(FILE).pdf $(FILE).svg $(FILE)_yosys.svg $(FILE)_yosys.dot $(FILE)-routed.svg $(FILE)-routed.pdf $(FILE)-routed.png
