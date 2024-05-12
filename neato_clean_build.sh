#! /bin/bash
# ============================================================================
# shell script to restore an Ubuntu Linux Class Image after a clean Ubuntu install
# Source: STEAM Clown - www.steamclown.org 
# GitHub: https://github.com/jimTheSTEAMClown/Linux
# Hacker: Jim Burnham - STEAM Clown, Engineer, Maker, Propmaster & Adrenologist 
# This example code is licensed under the CC BY-NC-SA 4.0, GNU GPL and EUPL
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# https://www.gnu.org/licenses/gpl-3.0.en.html
# https://eupl.eu/
# Program/Design Name:		neato_clean_build.sh
# Description:    shell script to restore an Ubuntu Linux Class Image after a clean Ubuntu installl 
# Dependencies:   
# Revision: 
#  
#  Revision 0.02 - Updated 05/11/2024 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 05/11/2024 (Copied from other Linux build scripts)
# Additional Comments: 
# 05/11/2024 - Need to update for Neato builds
# ============================================================================
echo "----------------------------------------------------"
echo "Ubuntu Class Image Update Script" 
echo "----------------------------------------------------"
echo " "
pwd
# ls -l
ls
echo " "
echo "----------------------------------------------------"
echo "Do you wish run the Ubuntu Class Image Update?"
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
# ============================================================================
echo " "
echo "  _  _  ___  ___   __  ____  __  _  _  __ "
echo " ( )( )(  ,\(   \ (  )(_  _)(  )( \( )/ _) "
echo "  )()(  ) _/ ) ) )/__\  )(   )(  )  (( (/\ "
echo "  \__/ (_)  (___/(_)(_)(__) (__)(_)\_)\__/ "
echo "----------------------------------------------------"
echo "Ready... I'm going to run "
echo "  Going to run $ sudo apt update"
echo "  Going to run $ sudo apt upgrade with -y" 
echo "----------------------------------------------------"
echo "Do you wish to run UPDATE and UPGRADE?  Enter y/Y or n/N or any Key?"
read -p "update and upgrade?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "getting home with cd ~"
echo "----------------------------------------------------"
echo " "
cd ~
pwd
echo "----------------------------------------------------"
echo "Running $ update"
echo "----------------------------------------------------"
echo " "
sudo apt update
echo " "
echo "----------------------------------------------------"
echo "Done running Update"
echo "----------------------------------------------------"
echo "----------------------------------------------------"
echo "Running $ upgrade with -y"
echo "----------------------------------------------------"
echo " "
sudo apt upgrade -y
echo " "
echo "----------------------------------------------------"
echo "Done running Upgrade"
echo "----------------------------------------------------"
elif [ $yesInstall == "n" ] || [ $yesInstall == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi

echo "Now I'm going to install some standard apps that are not part"
echo "of the standard Ubuntu build, but I find you will use them lots..."
echo "I'm installing:"
echo " - curl"
echo " - git"
echo " - openssh-server"
echo " - net-tools"
echo " - google-chrome"
echo " - ubuntu-gnome-desktop"
echo " - arduino"
echo " "
echo "Do you wish to install these? Dude, just say 'Yes' Trust me."
echo "Enter y/Y or n/N or any Key?"
read -p "Install this list of apps?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "Installing curl"
echo "Running $ sudo apt install curl -y"
echo "----------------------------------------------------"
echo " "
sudo apt install curl -y
echo " "
echo "Installing git"
echo "Running $ sudo apt install git -y"
echo "----------------------------------------------------"
echo " "
sudo apt install git -y
echo " "
echo "Installing ssh"
echo "Running $ sudo apt install openssh-server -y"
echo "----------------------------------------------------"
echo " "
sudo apt install openssh-server -y
# sudo systemctl status ssh
sudo ufw allow ssh
echo " "
echo "Installing net tools (for ifconfig) "
echo "Running $ sudo apt install net-tools -y"
echo "----------------------------------------------------"
echo " "
sudo apt install net-tools -y
echo " "
echo "----------------------------------------------------"
echo "Done running App installs and updates"
echo "----------------------------------------------------"

echo " "
echo "Installing Google Chrome"
# echo "Running $ sudo apt install net-tools -y"
echo "----------------------------------------------------"
echo " "
mkdir tmp-download
cd tmp-download
wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd ~
which google-chrome

echo " "
echo "----------------------------------------------------"
echo "Done running App installs and updates"
echo "----------------------------------------------------"

echo " "
echo "Installing Stuff "
echo " "
echo "----------------------------------------------------"
echo " "
sudo apt install ubuntu-gnome-desktop -y
gsettings set org.gnome.desktop.session idle-delay 800
gsettings set org.gnome.desktop.screensaver lock-delay 900

# gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 600
# gsettings set org.gnome.settings-daemon.plugins.power sleep-display-battery 600
# gsettings set org.gnome.desktop.session idle-delay 600
# gsettings set org.gnome.desktop.screensaver idle-activation-enabled 'true'
# gsettings set org.gnome.desktop.screensaver lock-enabled 'true'
# gsettings set org.gnome.desktop.screensaver lock-delay 900

sudo apt install vim -y
sudo apt install thonny -y
sudo snap install notepad-plus-plus
sudo apt install arduino -y
# Installing Visual Studion Code
sudo snap install --classic code


echo " "
echo "----------------------------------------------------"
echo "Done running STUFF"
echo "----------------------------------------------------"
elif [ $yesInstall == "n" ] || [ $yesInstall == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi

# Listing Apps
echo "listing the location of the installed Apps"
which curl
curl --version
which git
git --version
which ssh
which arduino
# arduino --version 
# sudo systemctl status ssh
which ifconfig
ifconfig
code --version

# sudo apt update
# sudo apt upgrade -y

echo "-------------------------------------------------------"
echo "  ___    __  _  _  ___  "
echo " (   \  /  \( \( )(  _) "
echo "  ) ) )( () ))  (  ) _) "
echo " (___/  \__/(_)\_)(___) "
echo " "
echo "----------------------------------------------------"
echo "Done running Ubuntu 22.04.2 Class Image Build"
echo " "
echo "----------------------------------------------------"
echo "  _  _  ____  _  _  ____    ___  ____  ____  ____  ___ "
echo " ( \( )( ___)( \/ )(_  _)  / __)(_  _)( ___)(  _ \/ __) "
echo "  )  (  )__)  )  (   )(    \__ \  )(   )__)  )___/\__ \ "
echo " (_)\_)(____)(_/\_) (__)   (___/ (__) (____)(__)  (___/ "
echo " "
echo "List the next steps here"
