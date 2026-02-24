#!/bin/bash

set -eux

DRIVE="/run/media/owbird/Owbird_s SSD/"

copy() {
	echo "Copying $1"
	rclone copy ~/$1 "$DRIVE/$1" --verbose
}

clear

copy Pictures
copy Documents
copy Downloads

umount "$DRIVE"
