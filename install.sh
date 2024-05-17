#!/bin/bash

tool="caesar"

# ON KALI WE NEED ROOT ACCESS TO /sbin
if [ "$(id -u)" -ne 0 ]; then
    echo -e "You should run as \e[0;101m\e[1;97mroot\e[0m\e[0m!"
    echo -e "Don't worry, we won't install '${tool}' in root.."
    exit 1
fi


# Check if rustc is available in common directories
if [ -f /usr/sbin/rustc ] || [ -f /usr/bin/rustc ] || [ -f /usr/local/bin/rustc ]; then
    echo "Rust compiler found. [ Dependency ]"
else
    echo "Rust compiler (rustc) is not available in /usr/sbin, /usr/bin, or /usr/local/bin."
    echo "This tool depends on Rust. Please install Rust to proceed."
    exit 1
fi





# NOW THE TOOL WILL WORK ONLY ON LINUX
opt_folder="/opt"
sbin_folder="/sbin"
opt="${opt_folder}/${tool}"
sbin="${sbin_folder}/${tool}"


#            IF YOU WANT TO RUN ON KALI REPLACING THESE.. 
#     ***BUT MOST TOOLS INSTALLED ARE SUPPORTED ON TERMUX ONLY***
# +---------------------+---------------------------------------------------------------+
# |   KALI LINUX        |     TERMUX                                                    |
# +---------------------+---------------------------------------------------------------+
# |   /opt/${tool}        |  /data/data/com.termux/files/usr/share/${tool}              |
# |   /sbin/${tool}       |  /data/data/com.termux/files/usr/bin/${tool}                |
# +---------------------+---------------------------------------------------------------+

echo -e "\n\tStarting Installation of [$tool]..\n"


# Check if the tool was installed before and delete the previous version
if [ -d "$opt" ]; then
    echo -e "\t  $tool: \"${opt}\" directory was found .."
    sudo rm -rf "${opt}"
    echo -e "\t  $tool: \"${opt}\" was removed .."
fi 

if [ -e "$sbin" ]; then
    echo -e "\t  $tool: \"${sbin}\" file was found .."
    sudo rm -rf "${sbin}"
    echo -e "\t  $tool: \"${sbin} was removed .."
fi 



sudo mkdir $opt
echo -e "\t  $tool: '${opt}' folder was made .."

echo -e "\t  $tool: copying files to ${opt} .."
sudo cp -r author.sh install.sh README.MD caesar caesar_executable  $opt
echo -e "\t  $tool: files and folders were moved to ${opt_folder}/${tool} .."

sudo cp -r caesar $sbin_folder
echo -e "\t  $tool: '${tool}' was moved to ${sbin_folder}.."

sudo chmod 777  "$opt"  "$sbin" "${opt}/caesar_executable"
# 777- kali Linux problem (advantage for future use, [777 must be accessible for all users])

echo -e "\t  $tool: Hoooorey, Installation complete!! .."

echo -e "\n\t  Now you can type '${tool}' to command line to open the tool!\n\t Type '${tool} -h' to see manual!"
