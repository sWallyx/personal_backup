#!/usr/bin/env bash
# Script main file, will copy certain folder and files into the hardrive

HARD_DRIVE=/Volumes/LaCie

current_date=`date +%m-%d-%Y`

disk_space(){
    hard_drive_space=$(df -H $HARD_DRIVE | tail -1 | awk '{print $4}')
    echo " >>> Hard Drive has $hard_drive_space avalaiable"
}

move_to_icloud(){
    # Moves to the iCloud folder
    # There is a problem using variables with this
    cd /Users/mikel/Library/Mobile\ Documents/com\~apple\~CloudDocs/
}

cd $HARD_DRIVE

# mkdir $current_date

disk_space

move_to_icloud

pwd