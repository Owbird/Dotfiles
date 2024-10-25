#!/usr/bin/python3
from subprocess import Popen

programs = [
    "spotify",
    "google-chrome",
    "telegram-desktop",
    "kitty",
    "whatsdesk",
]

for program in programs:
    try:
        Popen(program)
    except:
        print(f"Couldn't open {program}")
