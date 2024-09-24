#!/usr/bin/python3

from math import sqrt
from sys import argv

def sqr(x):
    return x*x

hex_mode = len(argv) > 1 and argv[1] == '--hex'

d=32
max_val = 255
idx = 0

for y in range(d//2):
	vals = []
	for x in range(d//2):
		cx = d/2
		cy = d/2
		dist_sq = sqr(cx-x) + sqr(cy-y)
		dist = sqrt(dist_sq)

		val = max_val / (dist if dist >= 1 else 1)
		val = int(max(val-14,0))

		if not hex_mode:
			print('bs[%d] = 8\'h%02x;' % (idx, val))
		idx += 1

		vals.append(val)

	if hex_mode:
		print(' '.join('%02x' % (val) for val in vals))
