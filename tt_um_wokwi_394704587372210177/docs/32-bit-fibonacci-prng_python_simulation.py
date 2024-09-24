# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

## 32-bit fibonacci prng

import numpy as np

lfsr_sequence = np.zeros(32,dtype=bool)

lfsr_reg = np.zeros(32, dtype=bool)

for clocks in np.arange(0,100):
    
    print("Clock ", clocks,": ",lfsr_reg*1)
    
    tmp_reg = lfsr_reg.copy()
    
    for count in np.arange(1,32):
        lfsr_reg[count] = tmp_reg[count-1]
    
    lfsr_reg[0] = tmp_reg[31] ^ tmp_reg[29] ^ tmp_reg[25] ^ tmp_reg[24]
    
    
    if all(flag == 0 for (flag) in tmp_reg):
        lfsr_reg[0] = 1
        
print("Clock ", clocks+1,": ",lfsr_reg*1)