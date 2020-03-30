#!/usr/bin/env bash
# Note: use user config to know which folders to copy
# best aproach with jq => jq .iCloud config.json

disk_space(){
    # Shows on the terminal how many space is left in the HardDrive
    hard_drive_space=$(df -H "$HARD_DRIVE" | tail -1 | awk '{print $4}')
    echo " >>> Hard Drive has $hard_drive_space avalaiable"
}

move_to_icloud(){
    # Moves to the iCloud folder
    # There is a problem using variables with this
    cd /Users/mikel/Library/Mobile\ Documents/com\~apple\~CloudDocs/ || exit
}

copy_sites(){
    printf "\n >>> CP of Site folder\n"
    cp -a /Users/mikel/Sites/. "$1"/"$2"/Sites
}

save_dropbox(){
    cd "$HARD_DRIVE" || exit
}

move_to_hard_drive(){
    # Moves to the HardDrive folder
    cd "$HARD_DRIVE" || exit
}

create_folder_with_date(){
    printf "\n >>> Creating folder\n"

    move_to_hard_drive

    mkdir "$1"

}
