import time
import machine
import gc
from machine import SPI, Pin

from ttboard.mode import RPMode
from ttboard.demoboard import DemoBoard

#from pio_spi import PIOSPI

tt = DemoBoard()
tt.shuttle.tt_um_thexeno_rgbw_controller.enable()


R_POS = 3
G_POS = 4
B_POS = 5
W_POS = 6
INT_POS = 1
IDX_POS = 2
MODE_POS = 7
PREAMB_POS = 0

cs = machine.Pin(17, machine.Pin.OUT)
spi = machine.SPI(0, baudrate=10000, polarity=0, phase=0, bits=8,
                  firstbit=machine.SPI.MSB, sck=machine.Pin(18), mosi=machine.Pin(19), miso=machine.Pin(16))
cs.on()
params = ["00", "00", "00", "00", "00", "ff", "00", "a4"]
dataPayload = [0x55, 0xff, 0x24, 0x00, 0xff, 0x00, 0xaa, 0xa4]
dataPayload[R_POS] = 0x00
dataPayload[G_POS] = 0x00
dataPayload[B_POS] = 0x00
dataPayload[W_POS] = 0x39
dataPayload[INT_POS] = 0xFF
dataPayload[IDX_POS] = 0xB8
dataPayload[MODE_POS] = 0xa4
dataPayload[PREAMB_POS] = 0x55

def spi_cmd(data, dummy_len=0, read_len=0):
    dummy_buf = bytearray(dummy_len)
    read_buf = bytearray(read_len)
    
    cs.off()
    spi.write( bytearray(bytes([data])))
    if dummy_len > 0:
        spi.readinto(dummy_buf)
    if read_len > 0:
        spi.readinto(read_buf)
    cs.on()
    
    return read_buf

def test_colorwheel():

    i = 0
    for i in range(0xff):
        dataPayload[IDX_POS] = i
        for j in range(8):
            spi_cmd(dataPayload[j]) #sending single byte to have CS toggle every 8 bits


    return

