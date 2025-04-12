from os.path import expanduser
from subprocess import run

user_path = expanduser("~")

scripts = {
    "mic.py":"mic",
    "apps.py": "apps",
    "light.py": "light",
    "startup.py": "startup",
    "workspace.py": "ws",
    "workspace_completion.py": "wsc"
}

for script, label in scripts.items():
    run(["cp", f"{script}", f"{user_path}/Workspace/bin/{label}"])
    run(["chmod", "+x", f"{user_path}/Workspace/bin/{label}"])
