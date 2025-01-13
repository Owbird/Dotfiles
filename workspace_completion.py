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
# ~/.config/fish/completions/ws.fish

function __fish_ws_complete
    set -l opts {' '.join(completions)}
    for opt in $opts
        echo $opt
    end
end

complete -c ws -f -a "(__fish_ws_complete)"
"""

with open("/home/owbird/.config/fish/completions/ws.fish", "w") as f:
    f.write(file)
