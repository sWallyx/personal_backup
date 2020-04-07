# Personal Backup
Makes the backup from certain folders to a pre-coded Hard Drive, at the moment that Hard Drive is in `/Volumes/LaCie/` and it will be saved in a folder called `CS` with a subdirectory for each day you make a backup, for example, `02/03/2020`.

## How does it work

The application first checks if the coded Hard Drive is connected or detected, if not the application will exit.

After the Hard Drive check it will start finding the key files to know which folder need a backup, or which folder were selected by the user.

The selected folders will be compressed as ZIP files, 

### How do I select a folder for backup?

If you want a folder to be copied in the backup, add a hidden file called `.backup_me.backup`. You can create this file from the terminal with the `touch` command as follows:

``` shell
touch .backup_me.backup
```

The file does not need any content.

### How do I make a hidden file?

The dot before the name makes the file hidden. Normal file would be `myfile.txt` and a hidden one `.myfile.txt`

### Will it copy everything inside the folders?

At the moment the backup excludes some files and folders for more information check [ZIP_IGNORE_INVESTIGATION.md](investigation/ZIP_IGNORE_INVESTIGATION.md) file. This files or folders are related to development projects and are ignored because they add nothing to the backup, this can be generated again by the developer.

## Installing

To install this command run the installation scrip, to do that you first will need to download the repository into your machine, you can do this also from the terminal with the `git clone` command.

``` shell
git clone https://github.com/sWallyx/personal_backup.git
```

Ones, you have all the code on the machine, install it with the script.

``` shell
./install.sh
```

To run the command you might need to make it executable, for that you can use this:

``` shell
chmod +x install.sh
```

## Command

The script can be used with the command `backup`, the install script should make the command available for you to use.

## Game plan

_NOTE: Always using the same hardDrive_
* Find files with file
* Create zip of the files containing .git 
* Check if Hard Drive connected
* Create menu to make is crazier ???