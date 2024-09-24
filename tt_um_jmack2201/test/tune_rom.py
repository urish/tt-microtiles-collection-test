import math
with open("../src/params.v","r") as fp:
    contents = fp.readlines()
tune_length = int([line.strip().split()[-1][:-1] for line in contents if "TUNE" in line][0])
header = f"module sfx_rom (\n\tinput clk,\n\tinput [{int(math.log2(tune_length)-1)}:0] addr,\n\toutput reg [7:0] note_out\n);\n\treg [7:0] note_arr [TUNE_LENGTH-1:0];\n"
body = ""
footer = "\n\talways @(posedge clk) begin\n\t\tnote_out <= note_arr[addr];\n\tend\nendmodule\n"


body += "\n\tinitial begin\n"
for note in range(tune_length):
    bit_string = "01010101"
    body += f"\t\tnote_arr[{note}] = 8\'b{bit_string};\n"
body += "\tend\n"

with open("../src/sfx_rom.v","w") as fp:
    fp.write(header+body+footer)