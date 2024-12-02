#!/bin/python3
from subprocess import run
from argparse import ArgumentParser

parser = ArgumentParser()

parser.add_argument("-on", "--on", action="store_true")
parser.add_argument("-off", "--off", action="store_true")

args = parser.parse_args()


if args.on:
    run(["pactl", "load-module", "module-loopback", "latency_msec=1"])

if args.off:
    run(["pactl", "unload-module", "module-loopback"])
