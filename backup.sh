#!/usr/bin/env bash
# Script main file, will copy certain folder and files into the HardDrive

HARD_DRIVE=/Volumes/LaCie
HARD_DRIVE_BACKUP=/Volumes/LaCie/CS
CURRENT_DATE=$(date +%m-%d-%Y)

# Get script directory
SCRIPT_DIRECTORY="${0%/*}"

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/functions/utils.sh

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/functions/hard_drive_functions.sh

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/src/colors.sh

disk_space

create_folder_with_date

check_for_hard_drive

