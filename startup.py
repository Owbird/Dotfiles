#!/usr/bin/python3
from subprocess import Popen
from time import sleep

programs = [
    "music",
    "browser",
    "code",
]

for program in programs:
    Popen(["apps.py", program])
    sleep(3)
