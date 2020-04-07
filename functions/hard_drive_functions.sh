#!/usr/bin/env bash

disk_space(){
    # Shows on the terminal how many space is left in the HardDrive
    hard_drive_space=$(df -H "$HARD_DRIVE" | tail -1 | awk '{print $4}')
    echo " >>> Hard Drive has $hard_drive_space available"
}

move_to_hard_drive(){
    # Moves to the HardDrive folder
    cd "$HARD_DRIVE_BACKUP" || exit
}

check_for_hard_drive(){
    echo ">>> Searching for the Hard Drive"

    if [ -d "$HARD_DRIVE" ]; then
        echo -e "[${BLUE}OK${NC}] Hard Drive"
        find_directories_to_copy
    else
        echo -e "[${RED}ERROR${NC}] Hard Drive"
    fi
}