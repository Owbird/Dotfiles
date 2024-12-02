from os.path import expanduser
from subprocess import run

user_path = expanduser("~")

scripts = [
    "mic",
    "apps",
    "light",
    "startup",
    "workspace",
    "workspace_completion"
]

for script in scripts:
    run(["cp", f"{script}.py", f"{user_path}/Workspace/bin/"])
    run(["chmod", "+x", f"{user_path}/Workspace/bin/{script}.py"])
