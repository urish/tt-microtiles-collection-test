# reove this line to run the script in bash
$PSDefaultParameterValues['Out-File:Encoding'] = 'ASCII'

rm .\work-obj08.cf
ghdl -a --std=08 *.vhd
ghdl -e --std=08 -fsynopsys find_the_damn_issue_sky130_tb
ghdl -r --std=08 -fsynopsys find_the_damn_issue_sky130_tb --vcd=ghdl.vcd --ieee-asserts=disable
ghdl synth --std=08 -fsynopsys --out=verilog -Wno-binding -Wno-nowrite find_the_damn_issue_sky130*.vhd -e tt_um_find_the_damn_issue > "find_the_damn_issue_sky130.v"
cp .\find_the_damn_issue_sky130.v ..\src\

iverilog -o iverilog_test -s find_the_damn_issue_sky130_tb -g2005-sv find_the_damn_issue_sky130_tb.v find_the_damn_issue_sky130.v sky130_fd_sc_hd_dlygate4sd3_1.v
vvp -n iverilog_test
