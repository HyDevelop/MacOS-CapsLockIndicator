#!/usr/bin/env python3
import os
from os import listdir
from os.path import isfile

baseRes = 16
reses = [baseRes, baseRes * 2, baseRes * 3]

for f in listdir():
    if isfile(f) and f.endswith("png"):
        name = f[:-4]
        names = list(map(lambda x: name + "@{}x.png".format(x), [1, 2, 3]))

        for i in range(3):
            os.system("convert {} -resize {}x{} {}".format(f, reses[i], reses[i], names[i]))
