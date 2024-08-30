#!/usr/bin/python3
from subprocess import Popen

programs = [
    "spotify",
    "google-chrome",
    "telegram-desktop",
    "notion-snap-reborn",
    "kitty",
    "lisky-console",
    "whatsdesk",
    "one-dev",
]

for program in programs:
    try:
        Popen(program)
    except:
        print(f"Couldn't open {program}")
