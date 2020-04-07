#!/usr/bin/env bash
# This file contains util functions for the application

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
        zip_controller "$directory_path" "$1"
    done
    
}

zip_controller(){
    
    directory="${1%"${1##*[!/]}"}"
    directory_name="${directory##*/}"
    
    zip_name=$directory_name".zip"
    
    create_zip_file "$zip_name" "$2"
    if [ -f "$zip_name" ]; then
        echo -e "[${BLUE}OK${NC}] ZIP $zip_name creation"

        copy_to_hard_drive "$zip_name" "$directory_name"
    
        remove_temp_zip_file "$zip_name"
        
    else
        echo -e "[${RED}ERROR${NC}] ZIP $zip_name creation"
    fi
    
}

create_zip_file(){
    echo "Creating $1 ZIP file . . ."
    
    # Find more files or folders to exclude
    # $2 refers to the silent_flag
    if [ "$2" = true ] ; then
        zip "$1" -r * -x "*/.git*" "*/node_modules*" "*/build*"  "*env/lib*" "*/bin*" "*/Debug*" "*/dist*" "*/.pytest_cache*" "*/__pycache*"
    else
        zip "$1" -dd -r * -x "*/.git*" "*/node_modules*" "*/build*"  "*env/lib*" "*/bin*" "*/Debug*" "*/dist*" "*/.pytest_cache*" "*/__pycache*"
    fi
    
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

copy_to_hard_drive(){
    rsync --progress -a "$1" "$HARD_DRIVE_BACKUP"/"$CURRENT_DATE"/"$1"
}