#!/usr/bin/env python

import sys

Map = {35:0, 97:1, 118:2}
x = int(sys.argv[1])
if x not in Map:
    print x
print Map[int(sys.argv[1])]
