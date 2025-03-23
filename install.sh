#!/bin/bash

tool="caesar"

if grep -qi "debian" /etc/os-release 2>/dev/null || grep -qi "kali" /etc/os-release 2>/dev/null; then
    echo "Detected Debian-based system."
    shared_folder="$HOME/.local/share"
    sbin_folder="$HOME/.local/bin"
elif [ -d "/data/data/com.termux/files/usr" ]; then
    echo "Detected Termux."
    shared_folder="/data/data/com.termux/files/usr/share"
    sbin_folder="/data/data/com.termux/files/usr/bin"
else
    echo "Unsupported system. This script only supports Debian-based systems and Termux."
    exit 1
fi


shared="${shared_folder}/${tool}"
sbin="${sbin_folder}/${tool}"

echo -e "\n\tStarting Installation of [$tool]..\n"


# Check if the tool was installed before and delete the previous version
if [ -d "$shared" ]; then
    echo -e "\t  $tool: \"${shared}\" directory was found .."
    rm -rf "${shared}"
    echo -e "\t  $tool: \"${shared}\" was removed .."
fi 

if [ -e "$sbin" ]; then
    echo -e "\t  $tool: \"${sbin}\" file was found .."
    rm -rf "${sbin}"
    echo -e "\t  $tool: \"${sbin} was removed .."
fi 


chmod +x caesar_executable caesar

mkdir -p "$shared"
echo -e "\t  $tool: '${shared}' folder was made .."

echo -e "\t  $tool: copying files to ${shared} .."
cp -r author.sh README.MD caesar_executable LICENSE  $shared
echo -e "\t  $tool: files and folders were copied to ${shared_folder}/${tool} .."

cp -r caesar $sbin_folder
echo -e "\t  $tool: '${tool}' was copied to ${sbin_folder}.."

echo -e "\t  $tool: Hoooorey, Installation complete!! .."

echo -e "\n\t  Now you can type '${tool}' to command line to open the tool!\n\t Type '${tool} -h' to see manual!"
