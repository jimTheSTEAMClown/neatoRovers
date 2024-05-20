#! /bin/bash
# ============================================================================
# shell script to restore / build a clean NEATO ROS Image after a clean RAspberry Pi / Craptop Ubuntu build & install
# Source: STEAM Clown - www.steamclown.org 
# GitHub: https://github.com/jimTheSTEAMClown/neatoRover
# Hacker: Jim Burnham - STEAM Clown, Engineer, Maker, Propmaster & Adrenologist 
# This example code is licensed under the CC BY-NC-SA 4.0, GNU GPL and EUPL
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# https://www.gnu.org/licenses/gpl-3.0.en.html
# https://eupl.eu/
# Program/Design Name:		Neato-ROS-Build.sh
# Description: shell script to restore / build a clean NEATO Image after a clean 
# Raspberry Pi Ubuntu build & install 
# Dependencies:  Ubuntu 22.04.3 or 22.04.4 64 bit OS Build / Installed
#                from the Ubuntu site
# Revision: 
#  Revision 0.03 - Updated 05/18/2024 Cleaned up comments and added some tools and apps
#  Revision 0.02 - Updated 05/18/2024 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 05/18/2024 (Copied from other Linux build scripts)
# Additional Comments: 
# Copy This wget command
# sudo wget -O Neato-Craptop-Ubuntu-Build.sh https://raw.githubusercontent.com/jimTheSTEAMClown/neatoRovers/main/Neato-ROS-Build.sh 
# sudo chmod 755 Neato-ROS-Build.sh
# ./Neato-ROS-Build.sh
# ============================================================================
echo "----------------------------------------------------"
echo "Neato New ROS Build / Update Script" 
echo "----------------------------------------------------"
echo "    "
pwd
echo " "
echo "----------------------------------------------------"
echo " Current Locale Settings "
locale  # check for UTF-8
echo "----------------------------------------------------"
echo " Updating / Upgrading /intalling the latest Locales "
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
echo "----------------------------------------------------"
echo " Showing any Updated Locale Settings "
locale  # verify settings
echo "----------------------------------------------------"
echo " Add the ROS 2 apt repository to your system "
echo "----------------------------------------------------"
echo " "
echo "----------------------------------------------------"
echo " - First ensure that the Ubuntu Universe repository is enabled."
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
echo "----------------------------------------------------"
echo " - Now add the ROS 2 GPG key with apt."
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "----------------------------------------------------"
echo " - Then add the repository to your sources list."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
echo "----------------------------------------------------"
echo " - Install ROS 2 packages - Update your apt repository caches after setting up the repositories."
echo " - Running Update Upgrade "
sudo apt update
sudo apt upgrade -y
echo "----------------------------------------------------"
echo " - Desktop Install (Recommended): ROS, RViz, demos, tutorials."
sudo apt install ros-humble-desktop -y 
sudo apt install ros-humble-ros-base -y
sudo apt install ros-dev-tools -y
echo "----------------------------------------------------"
echo " - Sourcing the setup script - Set up your environment by sourcing the following file."
# Replace ".bash" with your shell if you're not using bash
# Possible values are: setup.bash, setup.sh, setup.zsh
# source /opt/ros/humble/setup.bash

# Uninstall
# If you need to uninstall ROS 2 or switch to a source-based install once you have 
# already installed from binaries, run the following command:
# sudo apt remove ~nros-humble-* && sudo apt autoremove
# sudo rm /etc/apt/sources.list.d/ros2.list
# sudo apt update
# sudo apt autoremove
# Consider upgrading for packages previously shadowed.
# sudo apt upgrade

echo "----------------------------------------------------"
echo " ___    __  _  _  ___ "
echo "(   \  /  \( \( )(  _)"
echo " ) ) )( () ))  (  ) _)"
echo "(___/  \__/(_)\_)(___)"
echo "All Done With The Neato ROS INstall / Update"
echo " "
echo "----------------------------------------------------"
echo "  _  _  ____  _  _  ____    ___  ____  ____  ____  ___ "
echo " ( \( )( ___)( \/ )(_  _)  / __)(_  _)( ___)(  _ \/ __) "
echo "  )  (  )__)  )  (   )(    \__ \  )(   )__)  )___/\__ \ "
echo " (_)\_)(____)(_/\_) (__)   (___/ (__) (____)(__)  (___/ "
echo " "
echo "List of next steps: "
echo "----------------------------------------------------"
echo "-------------------------------------------------------"
echo "NEATO ROS Specific Next Steps "
echo " -    "
