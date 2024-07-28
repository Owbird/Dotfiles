#!/bin/bash
kitty @ set-tab-title $1
kitty @ send-text cd ~/Workspace/$1/$2
kitty @ send-text nvim .
kitty @ resize-window -a vertical -i 8
kitty @ launch --type=window --cwd=current
kitty @ launch --type=window --cwd=current
