#!/usr/bin/python3
from subprocess import Popen

programs = [
    "spotify",
    "brave-browser",
    "code",
    "gnome-system-monitor"
]

for program in programs:
    Popen(program)
