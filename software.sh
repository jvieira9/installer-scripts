#!/bin/bash
# 2023 - By: João Vieira | 'jvieira9' on GitHub
# This script automates the installation of software on an Ubuntu-based system.
# Softwares: Docker, Google Chrome, Visual Studio Code, Git, Python.

# This enables the script to exit immediately if any command fails
set -euo pipefail

# Internet connection check

if ! ping -c 2 google.com >> installer-script.log 2>&1 && ! ping -c 2 microsoft.com >> installer-script.log 2>&1; then
    printf "No internet connection. The script cannot be executed.\n"
    exit 1
fi

# Check if the user running the script is root or has sudo privileges
if ! command -v sudo -v >> installer-script.log 2>&1; then
   printf "This script must be executed as a root user or with sudo privileges.\n"
   sudo -v
   exit 1
fi

# Remove a log file from previous executions of the script and create a new one

rm installer-script.log
touch installer-script.log

# Update the package index, upgrade the system packages to their latest versions and refresh snap packages
clear
printf "Updating packages...\n"
# sudo apt update >> installer-script.log 2>&1 && sudo apt-get upgrade -y >> installer-script.log 2>&1
# sudo snap refresh >> installer-script.log 2>&1
printf "Packages updated succesfully.\n"
printf " \n"

printf "Please type in the digits that corresponds to the software you want to install. Select 'None' to exit.\n"

options=("Docker" "Google Chrome" "Visual Studio Code" "Git" "Python" "None" "Finished")
selected=()

# loop until the user is done selecting options
while true; do
  select opt in "${options[@]}"; do
    case $opt in
      "Finished")
        if [ ${#selected[@]} -eq 0 ]; then
          printf "Please select at least one option or 'None' to exit.\n"
        else
          break 2
        fi
        ;;
      "None")
        printf " \n"
        printf "Exiting without installing any software.\n"
        exit 0
        ;;
      *)
        if [[ " ${selected[@]} " =~ " ${opt} " ]]; then
          printf "%s is already selected.\n" "$opt"
        else
          selected+=("$opt")
          printf "%s selected.\n" "$opt"
        fi
        ;;
    esac
  done
done

# install the selected packages
for opt in "${selected[@]}"; do
  case $opt in
    "Docker")
        if ! command -v docker >> installer-script.log 2>&1
        then
            printf "Installing Docker...\n"
            sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >> installer-script.log 2>&1
            sudo groupadd docker >> installer-script.log 2>&1
            sudo usermod -aG docker $USER >> installer-script.log 2>&1
            newgrp docker >> installer-script.log 2>&1
            sudo chmod 666 /var/run/docker.sock >> installer-script.log 2>&1
            printf "Docker installed successfully.\n"
        else
            printf " \n"
            printf "Docker is already installed.\n"
        fi
      ;;
    "Google Chrome")
        if ! dpkg -l google-chrome-stable >> installer-script.log 2>&1
        then
            printf "Installing Google Chrome...\n"
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> installer-script.log 2>&1
            sudo dpkg -i google-chrome-stable_current_amd64.deb >> installer-script.log 2>&1
            rm google-chrome-stable_current_amd64.deb
            printf "Google Chrome installed successfully.\n"
        else
            printf "Google Chrome is already installed.\n"
        fi
      ;;
    "Visual Studio Code")
        if ! command -v code >> installer-script.log 2>&1
        then
            printf "Installing Visual Studio Code...\n"
            sudo snap install code --classic >> installer-script.log 2>&1
            printf "Visual Studio Code installed successfully.\n"
        else
            printf "Visual Studio Code is already installed.\n"
        fi
      ;;
    "Git")
        if ! command -v git >> installer-script.log 2>&1
        then
            printf "Installing Git...\n"
            sudo apt install git -y >> installer-script.log 2>&1
            printf "Git installed successfully.\n"
        else
            printf "Git is already installed.\n"
        fi
      ;;
    "Python")
        if ! command -v python3 >> installer-script.log 2>&1
        then
            printf "Installing Python...\n"
            sudo apt install python3 python3-pip -y >> installer-script.log 2>&1
        else
            printf "Python is already installed.\n"
        fi
  esac
done

# Log file

printf " \n"
read -p "Would you like to delete the 'installer-script.log' file that recorded the output of all executed commands? [Y/n]" log
if [[ "$log" == [yY] || "$log" == "" ]]; then
        rm installer-script.log
fi

# Installation Complete

printf " \n"
printf "Installation complete!\n"