#!/usr/bin/env bash
# This file contains util functions for the application

create_folder_with_date(){
    # Creates a folder with the name of the current date (global variable)
    # The folder is created in the HARD_DRIVE_BACKUP folder

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
    # Using find command, finds the ".backup_me.backup" file to know which folders
    # needs to be zipped and copied. Excludes the Hard Drive Volume

    printf "\n >>> Searching for the directories \n"
    printf "This may take a while \n"

    find ~ -name ".backup_me.backup" ! -path "/Volumes/LaCie/*" -type f  2>&1 | grep -v "Operation not permitted" | while read -r line; do
        directory_path=$(dirname "${line}")
        cd "$directory_path" || exit
        zip_controller "$directory_path"
    done
    
}

zip_controller(){
    # Controls actions with the ZIP file, first gets the name of the directory
    # to name the ZIP with the same name, and then it creates a ZIP with all
    # the content of the folder, copies the ZIP to the Hard Drive and removes
    # the temp ZIP file.
    
    directory="${1%"${1##*[!/]}"}"
    directory_name="${directory##*/}"
    
    zip_name=$directory_name".zip"

    create_zip_file "$zip_name"
    if [ -f "$zip_name" ]; then
        echo -e "[${BLUE}OK${NC}] ZIP $zip_name creation"

        copy_to_hard_drive "$zip_name" "$directory_name"
    
        remove_temp_zip_file "$zip_name"
        
    else
        echo -e "[${RED}ERROR${NC}] ZIP $zip_name creation"
    fi
    
}

create_zip_file(){
    # Creates a ZIP file using zip command with the given name
    # Parameters: {$1} => Zip filename, example: my_zip.zip
    echo "Creating $1 ZIP file . . ."

    if [[ "$SILENT_FLAG" = "true" ]] ; then
        zip "$1" -q -r ./* -x "*/.git*" "*/node_modules*" "*/build*"  "*env/lib*" "*/bin*" "*/Debug*" "*/dist*" "*/.pytest_cache*" "*/__pycache*"
    else
        zip "$1" -dd -r ./* -x "*/.git*" "*/node_modules*" "*/build*"  "*env/lib*" "*/bin*" "*/Debug*" "*/dist*" "*/.pytest_cache*" "*/__pycache*"
    fi
    
}

remove_temp_zip_file(){
    # Checks if the given zip name exists and removes it
    # Parameters: {$1} => Zip filename, example: my_zip.zip

    echo ">>> Removing temp zip file"
    if [ -f "$1" ]; then
        rm "$1"
        echo -e "[${BLUE}OK${NC}] Remove ZIP file"
    else
        echo -e "[${RED}ERROR${NC}] Remove ZIP file"
    fi
    
}

copy_to_hard_drive(){
    # Copies the given ZIP file name to the Hard Drive with the same name
    # Parameters: {$1} => Zip filename, example: my_zip.zip
    
    rsync --progress -a "$1" "$HARD_DRIVE_BACKUP"/"$CURRENT_DATE"/"$1"
}