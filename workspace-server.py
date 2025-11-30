#!/bin/python3
from os.path import expandvars, join
from os import walk, environ
from getpass import getuser
from subprocess import run, Popen
from argparse import ArgumentParser
from time import sleep

parser = ArgumentParser()

parser.add_argument("project")
parser.add_argument("cmds", nargs="*")
parser.add_argument("-a", "--all", action="store_true")

args = parser.parse_args()

vars = expandvars("$PATH")

project = args.project

ignore = [".git", "node_modules", "env", "venv", ".next"]

workspace_path = f"/root/Workspace/"

for root, folders, files in walk(workspace_path):

    folders[:] = [folder for folder in folders if folder not in ignore]

    for folder in folders:

        if folder.lower() == project.lower():
            project_path = join(root, folder)

            if args.all:
                session = folder

                p = Popen([
                    "tmux", "new-session", "-d", "-A",
                    "-s", session,
                    "-n", "code",
                    "-c", project_path
                ])

                sleep(0.2)

                run(["tmux", "send-keys", "-t", f"{session}:0", "nvim", "Enter"])

                for i, t in enumerate(["runner", "misc", "git"], start=1):
                    run([
                        "tmux", "new-window",
                        "-t", f"{session}:{i}",
                        "-n", t,
                        "-c", project_path
                    ])

                    if t == "git":
                        sleep(0.2)
                        run(["tmux", "send-keys", "-t", f"{session}:{i}", "lazygit", "Enter"])

                run(["tmux", "attach", "-t", session])
                exit(0)
            else:
                run([*args.cmds], cwd=project_path)

            break
