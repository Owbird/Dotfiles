#!/bin/python3
from os.path import expandvars, join
from os import walk, environ, listdir
from getpass import getuser
from subprocess import run
from argparse import ArgumentParser
from time import sleep

parser = ArgumentParser()

parser.add_argument("project")
parser.add_argument("cmds", nargs="*")
parser.add_argument("-a", "--all", action="store_true")
parser.add_argument("-b", "--browse", action="store_true")
parser.add_argument("-c", "--clone", action="store_true")
parser.add_argument("-g", "--git", action="store_true")

args = parser.parse_args()

vars = expandvars("$PATH")

project = args.project

ignore = [".git", "node_modules", "env", "venv", ".next"]

workspace_path = f"/home/{getuser()}/Workspace/"

if args.clone:
    run(["gh", "repo", "clone", project, join(workspace_path, project)])

for root, folders, files in walk(workspace_path):

    folders[:] = [folder for folder in folders if folder not in ignore]

    for folder in folders:

        if folder.lower() == project.lower():
            project_path = join(root, folder)

            if args.browse:

                res = run(["git", "-C", project_path, "remote",
                          "get-url", "origin"], capture_output=True)

                repo = str(res.stdout, "utf-8").split(".com/")[1]

                run(["gh", "browse", "-R", repo])

                break

            if args.all:

                dirs = listdir(project_path)

                if args.git and not ".git" in dirs: break

                run(["kitty", "@", "launch", "--type=tab", "--cwd",
                    project_path, "--title", folder, "--hold", "tmux",
                     "new", "-A", "-s", f"{folder}", "-n", "code"])

                sleep(2)

                run([
                    "tmux", "send-keys", "-t", f"{
                        folder}:0", "nvim .", "Enter"
                ])

                for i, t in enumerate(["runner", "misc", "git"], start=1):
                    run([
                        "tmux", "new-window", "-t", f"{
                            folder}:{i}", "-n", f"{t}", "-c", project_path
                    ])

                    if t == "git":
                        sleep(1)
                        run([
                            "tmux", "send-keys", "-t", f"{
                                folder}:{i}", "lazygit status", "Enter"
                        ])
            else:
                run(["kitty", "@", "launch", "--type=tab", "--cwd",
                     project_path, "--title", folder, "--hold", *args.cmds])

            break
