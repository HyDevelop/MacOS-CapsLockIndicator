#!/usr/bin/env python3
import os
from os import listdir
from os.path import isfile

for f in listdir():
    if isfile(f) and f.endswith("png"):
        os.system("echo " + f)
