#!/bin/bash

# This script is to install new versions of Discord so I dont have to (it's tedious).

# Putting a note in here about the .desktop files which reference the /usr/bin/Discord
# symlink, the script doesn't interact with them but this is where they need to be
# - ./discord.desktop
# - ~/.local/share/applications/discord.desktop

# Getting the version to install
read -p "Version to install: " dVersion
dFile=./discord-$dVersion.tar.gz

# Check if the file exists, if it does then extract it, if it doesn't then exit.
if test -f "$dFile"; then
    echo "File: $dFile"
    echo "Exists! Proceeding to install."

    # Extract the files, rename the Discord directory to the version number then
    # move the old tarball to the tarballs directory for backup.

    tar -xzvf $dFile
    mv Discord $dVersion
    mv $dFile tarballs

    # Sudo and remove the link to the old version and symlink the new version.

    sudo rm /usr/bin/Discord
    sudo ln -s /opt/Apps/Discord/$dVersion/Discord /usr/bin/Discord
else
    echo "File: $dFile"
    echo "Does not exist! Exiting."
fi
