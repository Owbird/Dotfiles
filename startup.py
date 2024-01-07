#!/usr/bin/python3
from subprocess import Popen

programs = [
    "spotify",
    "firefox",
    "code",
    "gnome-system-monitor"
]

for program in programs:
    Popen(program)
