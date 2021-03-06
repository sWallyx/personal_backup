#!/usr/bin/env bash

show_welcome_message(){
    # Shows the welcome message with the author name, also clears
    # the screen as init of the command.

    clear
    
    printf "

 ____             _          __  __
| __ )  __ _  ___| | __     |  \/  | ___ 
|  _ \ / _' |/ __| |/ /     | |\/| |/ _ \ 
| |_) | (_| | (__|   <      | |  | |  __/ 
|____/ \__,_|\___|_|\_\     |_|  |_|\___| 
                              by: sWallyx
    "
    echo ""
    echo "This will take some time"
    echo "Thanks in advance"
    echo " - - - - - - - - - - - -"
    echo ""
    
}

show_end_message(){
    # Shows the bye message.

    echo ""
    echo " - - - - - - - - - - - -"
    echo "All done!"
    echo "Thanks."
    echo ""
}