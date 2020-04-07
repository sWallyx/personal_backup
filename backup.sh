#!/usr/bin/env bash
# Script main file, will copy certain folder and files into the HardDrive

HARD_DRIVE=/Volumes/LaCie
HARD_DRIVE_BACKUP=/Volumes/LaCie/CS
CURRENT_DATE=$(date +%m-%d-%Y)

# Get script directory
SCRIPT_DIRECTORY="${0%/*}"

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/src/utils.sh

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/src/hard_drive_functions.sh

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/src/colors.sh

# shellcheck source=/dev/null
source "$SCRIPT_DIRECTORY"/src/messages.sh

show_welcome_message

if  [[ $1 = "-o" ]]; then
    echo "Option -o turned on"
else
    echo "You did not use option -o"
fi

echo ">>> Searching for the Hard Drive"

if [ -d "$HARD_DRIVE" ]; then
    echo -e "[${BLUE}OK${NC}] Hard Drive"
    disk_space
    
    # create_folder_with_date
    
    # find_directories_to_copy
else
    echo -e "[${RED}ERROR${NC}] Hard Drive"
fi


show_end_message

