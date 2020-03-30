disk_space(){
    # Shows on the terminal how many space is left in the HardDrive
    hard_drive_space=$(df -H $HARD_DRIVE | tail -1 | awk '{print $4}')
    echo " >>> Hard Drive has $hard_drive_space avalaiable"
}

move_to_icloud(){
    # Moves to the iCloud folder
    # There is a problem using variables with this
    cd /Users/mikel/Library/Mobile\ Documents/com\~apple\~CloudDocs/
}

save_sites(){

}

save_dropbox(){

}

move_to_hard_drive(){
    # Moves to the HardDrive folder
    # Dont think it will be useful
    cd $HARD_DRIVE
}