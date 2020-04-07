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
