#!/bin/python3
from os.path import expandvars
from subprocess import run
from argparse import ArgumentParser

parser = ArgumentParser()

parser.add_argument("type")
parser.add_argument("-a", "--webapp",)

args = parser.parse_args()

expandvars("$PATH")

type = args.type

webapps = {
    "snap": "https://web.snapchat.com/",
    "pin": "https://pinterest.com/",
    "gh": "https://github.com/",
    "x": "https://x.com/",
    "wa": "https://web.whatsapp.com/",
    "yt": "https://www.youtube.com/",
    "mail": "https://mail.google.com/",
    "claude": "https://claude.ai/"
}

apps = {
    "browser": {"index": 1, "app": "google-chrome", "args": []},
    "code": {"index": 2, "app": "kitty", "args": []},
    "music": {"index": 3, "app": "spotify", "args": []},
    "app": {"index": 4, "app": "google-chrome", "args": [f"--app={webapps.get(args.webapp)}"]},
}

run(["wmctrl", "-s", str(apps[args.type]["index"])])

run([apps[args.type]["app"], *apps[args.type]["args"]])
