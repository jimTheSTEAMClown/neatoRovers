#! /bin/bash
# ============================================================================
# shell script to restore / build a clean NEATO Image after a clean Raspberry Pi Ubuntu build & install
# Source: STEAM Clown - www.steamclown.org 
# GitHub: https://github.com/jimTheSTEAMClown/neatoRover
# Hacker: Jim Burnham - STEAM Clown, Engineer, Maker, Propmaster & Adrenologist 
# This example code is licensed under the CC BY-NC-SA 4.0, GNU GPL and EUPL
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# https://www.gnu.org/licenses/gpl-3.0.en.html
# https://eupl.eu/
# Program/Design Name:		Neato-RaspberryPi-Ubuntu-Build.sh
# Description: shell script to restore / build a clean NEATO Image after a clean 
# Raspberry Pi Ubuntu build & install 
# Dependencies:  Ubuntu 22.04.3 or 22.04.4 64 bit OS Build / Installed
#                from the Raspberry Pi image builder
# Revision: 
#  Revision 0.03 - Updated 05/15/2024 Cleaned up comments and added some tools and apps
#  Revision 0.02 - Updated 05/11/2024 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 05/11/2024 (Copied from other Linux build scripts)
# Additional Comments: 
# Copy This wget command
# sudo wget -O Neato-RaspberryPi-Ubuntu-Build.sh https://raw.githubusercontent.com/jimTheSTEAMClown/neatoRovers/main/Neato-RaspberryPi-Ubuntu-Build.sh 
# sudo chmod 755 Neato-RaspberryPi-Ubuntu-Build.sh
# ./Neato-RaspberryPi-Ubuntu-Build.sh
# ============================================================================
echo "----------------------------------------------------"
echo "Neato New Ubuntu Build / Update Script" 
echo "----------------------------------------------------"
echo " "
pwd
echo " "
echo "----------------------------------------------------"
echo "Do you wish run the Neato New Ubuntu Build / Update Script?"
echo "----------------------------------------------------"
echo "This script will rin the following: "
echo "  sudo apt update "
echo "  sudo apt upgrade -y "
echo "----------------------------------------------------"
echo "NEATO Specific Tools and Apps"
echo "----------------------------------------------------"
echo "  "
echo "  "
echo "  "
echo "----------------------------------------------------"
echo "VIAM Specific Tools and Apps"
echo "----------------------------------------------------"
echo "The Viam app/server needs to have the following tools installed  "
echo "  sudo apt install curl -y "
echo "  sudo apt install libfuse2 -y "
echo "    "
echo "----------------------------------------------------"
echo "Other Useful Stuff "
echo "----------------------------------------------------"
echo "  sudo apt install arduino -y "
echo "  sudo apt install git -y "
echo "  sudo apt install ufw -y "
echo "  sudo apt install net-tools -y  "
echo "  sudo apt install openssh-server -y  "
echo "  sudo ufw allow ssh  "
echo "  Install Google Chrome    "
echo "  sudo apt install vim -y "
echo "  sudo apt install thonny -y  "
echo "  sudo snap install notepad-plus-plus "
echo "  # Install Visual Studion Code  "
echo "  sudo snap install --classic code  "
echo "    "

echo "----------------------------------------------------"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------"
            echo "Running Ubuntu Class Image Update" 
            echo "----------------------------------------------------"
            break;;
        No ) 
            echo "----------------------------------------------------"
            echo "Exiting Without Update" 
            echo "----------------------------------------------------"
            exit;;
    esac
done

cd 
pwd
echo "-------------------------------------------------------"
echo " update & upgrade "
echo "-------------------------------------------------------"
sudo apt update
sudo apt upgrade -y
echo "-------------------------------------------------------"
echo " Checking for oand Installing the latest version of curl"
echo "-------------------------------------------------------"
sudo apt install curl -y
echo "-------------------------------------------------------"
echo "The UPGRADE will say:"
echo "   The following package was automatically installed"
RED_FG=`tput setaf 1`
GREEN_BG=`tput setab 2`
RESET=`tput sgr0`
echo "    ${RED_FG}${GREEN_BG}and is no longer required: libfuse${RESET}"
echo "    ${RED_FG}${GREEN_BG}and to use: 'sudo apt autoremove' to remove it.${RESET}"
echo "${RED_FG}DO NOT DO REMOVE IT.${RESET}  Looks like viam-server needs it"
echo "----------------------------------------------------"
echo "Installing Arduino"
echo "----------------------------------------------------"
echo " "
sudo apt install arduino -y
echo " "
echo "----------------------------------------------------"
echo "Done installing Arduino"
echo "----------------------------------------------------"
echo " "

echo "----------------------------------------------------"
echo "Installing git"
echo "----------------------------------------------------"
echo " "
sudo apt install git -y
echo " "
echo "----------------------------------------------------"
echo "Done installing git"
echo "----------------------------------------------------"
echo " "

echo "----------------------------------------------------"
echo "Installing ufw"
echo "Running $ sudo apt install ufw -y"
echo "----------------------------------------------------"
echo " "
sudo apt install ufw -y
echo " "

echo "----------------------------------------------------"
echo "Installing net tools (for ifconfig) "
echo "Running $ sudo apt install net-tools -y"
echo "----------------------------------------------------"
echo " "
sudo apt install net-tools -y
echo " "

echo "----------------------------------------------------"
echo "Installing ssh"
echo "Running $ sudo apt install openssh-server -y"
echo "----------------------------------------------------"
echo " "
sudo apt install openssh-server -y
echo " "
sudo ufw allow ssh
echo " "

echo "----------------------------------------------------"
echo "Installing Google Chrome"
echo "----------------------------------------------------"
echo " "
mkdir tmp-download
cd tmp-download
wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd ~
which google-chrome

sudo apt install vim -y
sudo apt install thonny -y
sudo snap install notepad-plus-plus
# Installing Visual Studion Code
sudo snap install --classic code

echo "----------------------------------------------------"
echo "Installing coreutils"
echo "Running $ sudo apt install coreutils -y"
echo "----------------------------------------------------"
echo " "
sudo apt install coreutils -y
echo " "

echo "----------------------------------------------------"
echo "Here is some information about you "
echo $USER
uname -m
ls -la
# Listing Apps
echo "listing the location of the installed Apps"
which curl
curl --version
which git
git --version
which ssh
which ufw
ufw --version
which arduino
# arduino --version 
# sudo systemctl status ssh
which ifconfig
ifconfig
code --version

echo "-------------------------------------------------------"
echo " Installing VIAM Specific Applications / Tools"
echo "-------------------------------------------------------"
echo " -  Installing libfuse2 for the VIAM application"
echo "-------------------------------------------------------"
sudo apt install libfuse2 -y
echo "-------------------------------------------------------"
echo " -  Copying with wget, a shell script to start the VIAM server, but it should actually autostart on boot"
echo "-------------------------------------------------------"
sudo wget -O start_viam_server.sh https://raw.githubusercontent.com/jimTheSTEAMClown/VIAM-Party-Rover-0/main/start_viam_server.sh 
sudo chmod 755 start_viam_server.sh
echo " Now you will need to set up the vial-server from your FLEET Page on the VIAM site https://app.viam.com/robots"
echo "-------------------------------------------------------"
echo "-------------------------------------------------------"
echo " ___    __  _  _  ___ "
echo "(   \  /  \( \( )(  _)"
echo " ) ) )( () ))  (  ) _)"
echo "(___/  \__/(_)\_)(___)"
echo "All Done"
echo " "
echo "----------------------------------------------------"
echo "  _  _  ____  _  _  ____    ___  ____  ____  ____  ___ "
echo " ( \( )( ___)( \/ )(_  _)  / __)(_  _)( ___)(  _ \/ __) "
echo "  )  (  )__)  )  (   )(    \__ \  )(   )__)  )___/\__ \ "
echo " (_)\_)(____)(_/\_) (__)   (___/ (__) (____)(__)  (___/ "
echo " "
echo "List of next steps: "
echo "----------------------------------------------------"
echo "VIAM Specific Next Steps "
echo " - Now you will need to set up the vial-server from your FLEET Page on the VIAM site https://app.viam.com/robots "
echo " - Then, maybe run this .sh file ./start_viam_server.sh "
echo " - https://docs.viam.com/installation/#detailed-installation-instructions "
echo "-------------------------------------------------------"
echo "NEATO Specific Next Steps "
echo " -    "
