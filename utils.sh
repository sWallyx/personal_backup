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
    printf "\n >>> Copy of User Site\n"
    rsync --progress -a /Users/mikel/Sites/. "$1"/"$2"/Sites
}

copy_documents(){
    printf "\n >>> Copy of User Documents\n"
    rsync --progress -a /Users/mikel/Documents/. "$1"/"$2"/Documents
}

copy_iCloud_CV(){
    printf "\n >>> Copy of iCloud CV\n"
    move_to_icloud 
    rsync --progress -a CV/. "$1"/"$2"/CV
}

copy_iCloud_Billetes_Vuelo(){
    printf "\n >>> Copy of iCloud Billetes Vuelo\n"
    move_to_icloud 
    rsync --progress -a Billetes_Vuelo/. "$1"/"$2"/Billetes_Vuelo
}

copy_iCloud_Wallpapers(){
    printf "\n >>> Copy of iCloud Billetes Vuelo\n"
    move_to_icloud 
    rsync --progress -a Wallpapers/. "$1"/"$2"/Wallpapers
}

copy_iCloud_KAMON(){
    printf "\n >>> Copy of iCloud Billetes Vuelo\n"
    move_to_icloud 
    rsync --progress -a KAMON/. "$1"/"$2"/KAMON
}

copy_iCloud_Images(){
    printf "\n >>> Copy of iCloud Billetes Vuelo\n"
    move_to_icloud 
    rsync --progress -a Images/. "$1"/"$2"/Images
}

copy_dropbox(){
    printf "\n >>> Copy of User Personal Dropbox\n"
    rsync --progress -a /Users/mikel/Dropbox\ \(Personal\)/. "$1"/"$2"/Dropbox
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

find_directories_to_copy(){
    for dir in $(find -name ".backup_me.backup" ! -path "/Volumes/LaCie/*"  2>&1 | grep -v "Operation not permitted")
    do
        cd $dir
        pwd
    done
}