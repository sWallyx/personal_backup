#!/usr/bin/env bash
# Install script for the command

printf "Let me install the script for you, it will only be one second\n"

printf " >>> Installation started\n"

printf "I need to make this executable\n"
# Make script executable
chmod +x backup.sh

# Get repository path
repository_folder=$(pwd)
printf "The script is being installed in: %s\n" "$repository_folder"

printf "Checking if the system uses zsh or bash \n"

if [ -n "$ZSH_VERSION" ]; then # Update just zsh
    printf " >>> Remove alias if exists\n"
    awk '!/alias backup/' ~/.zshrc > temp && mv temp ~/.zshrc

    printf " >>> Save backup alias\n\n"
    echo "alias backup='$repository_folder/backup.sh'" >> ~/.zshrc
elif [ -n "$BASH_VERSION" ]; then # Update just bash
    printf " >>> Remove alias if exists\n"
    awk '!/alias backup/' ~/.bashrc > temp && mv temp ~/.bashrc

    printf " >>> Save backup alias\n\n"
    echo "alias backup='$repository_folder/backup.sh'" >> ~/.bashrc
else # Do both to secure that the installation is completed correctly
    printf " >>> Remove alias if exists\n"
    awk '!/alias backup/' ~/.bashrc > temp && mv temp ~/.bashrc
    awk '!/alias backup/' ~/.zshrc > temp && mv temp ~/.zshrc

    printf " >>> Save backup alias\n\n"
    echo "alias backup='$repository_folder/backup.sh'" >> ~/.bashrc
    echo "alias backup='$repository_folder/backup.sh'" >> ~/.zshrc
fi
printf " >>> Installation completed!\n\n"
printf "You can use the command by typing backup in the terminal\n"

