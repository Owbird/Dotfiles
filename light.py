#!/usr/bin/python3
from os import listdir
from os.path import join

leds_dir = "/sys/class/leds"

file = [file for file in listdir(leds_dir) if "scrolllock" in file][-1]


with open(join(leds_dir, file, "brightness"), "w") as f:
    f.write("1")
