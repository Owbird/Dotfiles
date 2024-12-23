#!/bin/python3
from os.path import expandvars, join
from os import walk
from getpass import getuser
from subprocess import run
from argparse import ArgumentParser

parser = ArgumentParser()

parser.add_argument("project")
parser.add_argument("cmds", nargs="*")
parser.add_argument("-a", "--all", action="store_true")
parser.add_argument("-b", "--browse", action="store_true")
parser.add_argument("-c", "--clone", action="store_true")

args = parser.parse_args()

expandvars("$PATH")

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

                run(["kitty", "@", "launch", "--type=tab",
                    "--cwd", project_path, "--title", folder, "--hold",  "nvim"])

                run(["kitty", "@", "resize-window", "-a", "vertical", "-i", "8"])

                run(["kitty", "@", "launch", "--type=window",
                    "--cwd", project_path, "--title", folder, "--hold", *args.cmds])

                run(["kitty", "@", "launch", "--type=window",
                     "--cwd", project_path, "--title", folder])

                run(["kitty", "@", "launch", "--type=window",
                    "--cwd", project_path, "--title", folder, "--hold", "lazygit", "status"])
            else:
                run(["kitty", "@", "launch", "--type=tab", "--cwd",
                     project_path, "--title", folder, "--hold", *args.cmds])

            break
