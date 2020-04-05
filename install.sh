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

# Save alias
printf " >>> Remove alias if exists\n"
awk '!/alias backup/' ~/.bashrc > temp && mv temp ~/.bashrc
awk '!/alias backup/' ~/.zshrc > temp && mv temp ~/.zshrc

printf " >>> Save backup alias\n\n"
echo "alias backup='$repository_folder/backup.sh'" >> ~/.bashrc
echo "alias backup='$repository_folder/backup.sh'" >> ~/.zshrc

# Add requisites

printf " >>> Installing requirements\n\n"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null

printf " >>> Installation completed!\n\n"
printf "You can use the command by typing backup in the terminal\n"