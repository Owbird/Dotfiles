#!/bin/python3
from os import walk

ignore = [".git", ".vscode", "__pycache__",
          "node_modules", "env", "venv", ".next"]

completions = []

for root, folders, files in walk("/home/owbird/Workspace/"):
    folders[:] = [folder for folder in folders if folder not in ignore]
    completions.extend(folders)

completions = list(set(completions))
completions = [f"'{comp}'" for comp in completions]

file = f"""
# ~/.config/fish/completions/workspace.py.fish

function __fish_workspace_py_complete
    set -l opts {' '.join(completions)}
    for opt in $opts
        echo $opt
    end
end

complete -c workspace.py -f -a "(__fish_workspace_py_complete)"
"""

with open("/home/owbird/.config/fish/completions/workspace.py.fish", "w") as f:
    f.write(file)
