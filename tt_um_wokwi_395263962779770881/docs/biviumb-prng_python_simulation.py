# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

## 32-bit fibonacci prng

import numpy as np

lfsr_sequence = np.zeros(177,dtype=bool)

lfsr_reg = np.zeros(177, dtype=bool)
lfsr_out = np.zeros((1,8),dtype=bool)

for clocks in np.arange(1,500000):
        
    tmp_reg = lfsr_reg.copy()
    
    for count in np.arange(1,177):
        lfsr_reg[count] = tmp_reg[count-1]
    
    lfsr_reg[93] = (tmp_reg[90] * tmp_reg[91]) ^ (tmp_reg[65] ^ tmp_reg[92]) ^ tmp_reg[170]
    lfsr_reg[0]  = (tmp_reg[174]*tmp_reg[175]) ^ (tmp_reg[161]^tmp_reg[176]) ^ tmp_reg[68]
    
    if all(flag == 0 for (flag) in tmp_reg):
        lfsr_reg[0] = 1
        
    lfsr_out = np.append(lfsr_out,[[
                         tmp_reg[0],
                         tmp_reg[68],
                         (tmp_reg[174]*tmp_reg[175]) ^ (tmp_reg[161]^tmp_reg[176]),
                         tmp_reg[65],
                         tmp_reg[92],
                         tmp_reg[161],
                         tmp_reg[176],
                         tmp_reg[65] ^ tmp_reg[92] ^ tmp_reg[161] ^ tmp_reg[176] # lfsr output
                         ]],axis=0)