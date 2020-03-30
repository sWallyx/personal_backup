#!/usr/bin/env bash
# Script main file, will copy certain folder and files into the hardrive

HARD_DRIVE=/Volumes/LaCie

current_date=`date +%m-%d-%Y`

# Get script directory
SCRIPT_DIRECTORY="${0%/*}"

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/utils.sh

# mkdir $current_date

disk_space

move_to_icloud

pwd