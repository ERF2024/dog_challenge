#!/usr/bin/env python
import re

filepath = "../models/smaze_wall_short/"

scale_factor = 0.33
f = open(filepath+"model_old.sdf", "r")
f2 = open(filepath+"model.sdf","w")
lines = f.readlines()
for line in lines:
    new_line = line
    tags = ["pose", "size"]
    for t in tags:
        if t in line:
            n = re.findall("(\d+(?:\.\d+)?)",line)
            np = [float(x)*scale_factor for x in n[0:3]]
            nr = [float(x) for x in n[3:6]]
            n = np+nr
            new_line = "\t\t\t\t<"+t +">"+ str(n[0:6]) + "</"+t+">\n"
            replace_ch = ["[","]",","]
            for c in replace_ch:
                new_line = new_line.replace(c,"")
    f2.write(new_line)