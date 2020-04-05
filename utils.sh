#!/usr/bin/env bash
# Note: use user config to know which folders to copy
# best aproach with jq => jq .iCloud config.json

disk_space(){
    # Shows on the terminal how many space is left in the HardDrive
    hard_drive_space=$(df -H "$HARD_DRIVE" | tail -1 | awk '{print $4}')
    echo " >>> Hard Drive has $hard_drive_space avalaiable"
}

copy_sites(){
    printf "\n >>> Copy of User Site\n"
    rsync --progress -a /Users/mikel/Sites/. "$1"/"$2"/Sites
}

move_to_hard_drive(){
    # Moves to the HardDrive folder
    cd "$HARD_DRIVE_BACKUP" || exit
}

create_folder_with_date(){
    printf "\n >>> Creating folder\n"

    move_to_hard_drive

    mkdir "$CURRENT_DATE"

    if [ -d "$HARD_DRIVE_BACKUP"/"$CURRENT_DATE" ]; then
        echo -e "[${BLUE}OK${NC}] Create folder for backup"
    else
        echo -e "[${RED}ERROR${NC}] Create folder for backup"
    fi

}

find_directories_to_copy(){
    printf "\n >>> Searching for the directories \n"
    printf "This may take a while \n"

    find ~ -name ".backup_me.backup" ! -path "/Volumes/LaCie/*" -type f  2>&1 | grep -v "Operation not permitted" | while read -r line; do  
        directory_path=$(dirname "${line}")
        cd "$directory_path" || exit
        zip_controller "$directory_path"
    done

}

zip_controller(){

    directory="${1%"${1##*[!/]}"}"
    directory_name="${directory##*/}" 

    zip_name=$directory_name".zip"
    
    create_zip_file "$zip_name"

    copy_to_hardrive "$zip_name" "$directory_name"

    remove_temp_zip_file "$zip_name"
}

create_zip_file(){
    echo "Creating $1 ZIP file . . ."

    # Find more files or folders to exclude
    zip "$1" -dd -r * -x "*/.git*" "*/node_modules*" "*/build*"  "*env/lib*" "*/bin*" "*/Debug*" "*/dist*" "*/.pytest_cache*" "*/__pycache*"
}

remove_temp_zip_file(){
    echo ">>> Removing temp zip file"
    if [ -f "$1" ]; then
        rm "$1"
        echo -e "[${BLUE}OK${NC}] Remove ZIP file"
    else
        echo -e "[${RED}ERROR${NC}] Remove ZIP file"
    fi
    
}

copy_to_hardrive(){
    rsync --progress -a "$1" "$HARD_DRIVE_BACKUP"/"$CURRENT_DATE"/"$1"
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