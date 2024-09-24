import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 1)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")
    #    bits(en)		    7     6     5     4     3     2	     1	    0
    #    ro_1	                                                        1
    #    ro_2                                                    1      
 
    
    #    input	            7     6     5     4     3     2	     1	    0  
    #    ascon_sbox               x     x     x     x     x  

    
    #    output     	    7     6     5     4     3     2	     1	    0
    #    shift_reg	                          x     x     x  
    #    ascon_sbox         1 

    dut._log.info("Test ASCON sbox output")
    # Set the input values you want to test
    
    dut.ui_in.value = 132 #//enable ascon sbox with input(5'b00001), check corresponding sbox ouput
    #Table 5: Ascon’s 5-bit S-box S as a lookup table.
    #x       0 1  2  3      4  5 6 7   8 9 a b    c d e f   10 11 12 13  14 15 16 17   18 19 1a 1b   1c 1d 1e 1f
    #S(x)    4 b 1f 14     1a 15 9 2  1b 5 8 12  1d 3 6 1c  1e 13  7  e  0  d  11 18   10  c  1 19   16 a  f  17
    output_value = dut.uo_out.value
    dut._log.info(f"Sbox output value: {output_value}")
    await ClockCycles(dut.clk, 3)
    dut._log.info("Test TRNG  output")
    dut.ui_in.value = 3
    # Wait for one clock cycle to see the output values
    await ClockCycles(dut.clk, 4)
    dut.ui_in.value = 0
    
    # Read and log the output value
    output_value = dut.uo_out.value
    dut._log.info(f"TRNG Output value: {output_value}")
    await ClockCycles(dut.clk, 2)
    dut.ui_in.value = 11
    await ClockCycles(dut.clk, 4)
    dut.ui_in.value = 0
    # Read and log the output value
    output_value = dut.uo_out.value
    dut._log.info(f"Output value: {output_value}")
    await ClockCycles(dut.clk, 4)
