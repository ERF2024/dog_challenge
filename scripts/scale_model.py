#!/usr/bin/env python
import re

filepath = "../models/smaze2d/"

scale_factor = 0.5
f = open(filepath+"model.sdf", "r")
f2 = open(filepath+"model2.sdf","w")
lines = f.readlines()
for line in lines:
    new_line = line
    if "pose" in line:
        n = re.findall("(\d+(?:\.\d+)?)",line)
        np = [float(x)*scale_factor for x in n[0:3]]
        nr = [float(x) for x in n[3:6]]
        n = np+nr
        new_line = "\t\t\t\t<pose>" + str(n[0:6]) + "</pose>\n"
        replace_ch = ["[","]",","]
        for c in replace_ch:
            new_line = new_line.replace(c,"")
    f2.write(new_line)