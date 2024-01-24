#!/usr/bin/python3
from subprocess import Popen

programs = [
    "spotify",
    "brave-browser",
    "code",
    "nautilus",
    "gnome-system-monitor",
    "telegram-desktop",
    "whatsdesk"
]

for program in programs:
    try:
        Popen(program)
    except:
        print(f"Couldn't open {program}")
