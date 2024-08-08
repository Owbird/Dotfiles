#!/bin/python3
from os.path import expandvars, join
from os import walk
from subprocess import run
from sys import argv

expandvars("$PATH")

project = argv[1]

ignore = [".git", "node_modules", "env", "venv", ".next"]


for root, folders, files in walk("/home/owbird/Workspace/"):

    for folder in folders:
        if folder in ignore:
            folders.remove(folder)

        if folder.lower() == project.lower():
            project_path = join(root, folder)
            run(["kitty", "@", "launch", "--type=tab", "--cwd",
                project_path, "--title", folder])
            run(["kitty", "@", "launch", "--type=overlay",
                "--cwd", project_path, "fish", "-c",  "nvim", "."])
            run(["kitty", "@", "resize-window", "-a", "vertical", "-i", "8"])
            run(["kitty", "@", "launch", "--type=window",
                "--cwd", project_path, "--title", folder])
            run(["kitty", "@", "launch", "--type=window",
                "--cwd", project_path, "--title", folder])
