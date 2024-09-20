#!/bin/python3
from os.path import expandvars, join
from os import walk
from subprocess import run
from sys import argv
from argparse import ArgumentParser

parser = ArgumentParser()

parser.add_argument("project")
parser.add_argument("-a", "--all", action="store_true")
parser.add_argument("-G", "--gh", action="store_true")

args = parser.parse_args()

expandvars("$PATH")

project = argv[1]

ignore = [".git", "node_modules", "env", "venv", ".next"]

for root, folders, files in walk("/home/owbird/Workspace/"):

    folders[:] = [folder for folder in folders if folder not in ignore]

    for folder in folders:

        if folder.lower() == project.lower():
            project_path = join(root, folder)

            if args.gh:

                res = run(["git", "-C", project_path, "remote",
                          "get-url", "origin"], capture_output=True)

                repo = str(res.stdout, "utf-8").split(".com/")[1]

                run(["gh", "browse", "-R", repo])

                break

            run(["kitty", "@", "launch", "--type=tab", "--cwd",
                project_path, "--title", folder])

            if args.all:

                run(["kitty", "@", "launch", "--type=overlay",
                    "--cwd", project_path, "--title", folder, "fish", "-C",  "nvim"])

                run(["kitty", "@", "resize-window", "-a", "vertical", "-i", "8"])

                run(["kitty", "@", "launch", "--type=window",
                    "--cwd", project_path, "--title", folder])

                run(["kitty", "@", "launch", "--type=window",
                     "--cwd", project_path, "--title", folder])

                run(["kitty", "@", "launch", "--type=window",
                     "--cwd", project_path, "--title", folder])

                run(["kitty", "@", "launch", "--type=overlay",
                    "--cwd", project_path, "--title", folder, "lazygit", "status"])

            break
