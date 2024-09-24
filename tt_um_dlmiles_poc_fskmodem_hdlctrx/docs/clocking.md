
## Clocking Notes

```
 P  R
 H  X
 A  C
 S  T
 E  R

           9,600  Data Rate
          15,300  x16 TX CLOCK (original design)
          61,440  x64 TT06 CLK (data rate x4)

              A4     [tt x128 dr x1]
 5         x8 A3     [tt x64  dr x2]  TX A1  UART TX 1:1
 4  2      x4 A2     [tt x32  dr x4]  TX A0  UART TX 2:1
 3  1      x2 A1     [tt x16  dr x8]
 2  0      x1 A0     [tt x8   dr x16]        UART RX 1:1
 1            PHASE1 [tt x4   ]              UART RX 2:1
 0            PHASE0 [tt x2   ]   


           x4  UART TX 2:1  (19,200) 1samp/UART bit
           x2  UART TX 1:1   (9,600) 1samp/UART bit

           x16 UART RX 2:1  (19,200) 8samp/UART bit
           x8  UART RX 1:1   (9,600) 8samp/UART bit

```
