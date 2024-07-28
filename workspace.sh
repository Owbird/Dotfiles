#!/bin/bash
echo /home/owbird/Workspace/$1/$2
kitty @ launch --type=tab --cwd=/home/owbird/Workspace/$1/$2 --title=$2 nvim .
kitty @ resize-window -a vertical -i 8
kitty @ launch --type=window --cwd=/home/owbird/Workspace/$1/$2 --title=$2
kitty @ launch --type=window --cwd=/home/owbird/Workspace/$1/$2 --title=$2

