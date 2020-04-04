#!/usr/bin/env bash
# Script main file, will copy certain folder and files into the HardDrive

HARD_DRIVE=/Volumes/LaCie

current_date=$(date +%m-%d-%Y)

# Get script directory
SCRIPT_DIRECTORY="${0%/*}"

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/utils.sh

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/colors.sh

# create_folder_with_date "$current_date"

# copy_sites "$HARD_DRIVE" "$current_date"

# copy_documents "$HARD_DRIVE" "$current_date"

# copy_dropbox "$HARD_DRIVE" "$current_date"

# copy_iCloud_CV "$HARD_DRIVE" "$current_date"

# copy_iCloud_Billetes_Vuelo "$HARD_DRIVE" "$current_date"

# copy_iCloud_Wallpapers "$HARD_DRIVE" "$current_date"

# copy_iCloud_KAMON "$HARD_DRIVE" "$current_date"

# copy_iCloud_Images "$HARD_DRIVE" "$current_date"

check_for_hard_drive

#disk_space
