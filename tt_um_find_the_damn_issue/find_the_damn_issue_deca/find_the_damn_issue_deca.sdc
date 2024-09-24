create_clock -period 20 [get_ports CLK50M]
derive_pll_clocks
derive_clock_uncertainty

set_false_path -to [get_ports uo_*]
set_false_path -from [get_ports ui_*]

set_max_skew -from [get_ports uio*] 2
set_max_skew -to [get_ports uio*] 2

# we could not find a way to make this work, so we had to fall back to set_false_path :/
set_max_skew -from_clock [get_clocks {ALTPLL_inst|auto_generated|pll1|clk[4]}] -to_clock [get_clocks {ALTPLL_inst|auto_generated|pll1|clk[0]}] 2
set_false_path -from [get_clocks {ALTPLL_inst|auto_generated|pll1|clk[4]}] -to [get_clocks {ALTPLL_inst|auto_generated|pll1|clk[0]}] 
