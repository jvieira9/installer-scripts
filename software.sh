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
apt update >> installer-script.log 2>&1 && apt-get upgrade -y >> installer-script.log 2>&1
snap refresh >> installer-script.log 2>&1

# Install Docker
read -p "Do you want to install Docker? [Y/n]" install_docker
if [[ "$install_docker" == [yY] || "$install_docker" == "" ]]; then
    if ! command -v docker >> installer-script.log 2>&1
    then
        printf "Installing Docker...\n"
        apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >> installer-script.log 2>&1
        groupadd docker >> installer-script.log 2>&1
        usermod -aG docker $USER >> installer-script.log 2>&1
        newgrp docker >> installer-script.log 2>&1
        chmod 666 /var/run/docker.sock >> installer-script.log 2>&1
        printf "Docker installed successfully.\n"
    else
        printf "Docker is already installed.\n"
    fi
else
    printf "Skipping Docker installation.\n" 
fi

# Download the latest version of Google Chrome for Ubuntu and install it using dpkg package manager
read -p "Do you want to install Google Chrome? [Y/n]" install_chrome
if [[ "$install_chrome" == [yY] || "$install_chrome" == "" ]]; then
    if ! dpkg -l google-chrome-stable >> installer-script.log 2>&1
    then
        printf "Installing Google Chrome...\n"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> installer-script.log 2>&1
        dpkg -i google-chrome-stable_current_amd64.deb >> installer-script.log 2>&1
        rm google-chrome-stable_current_amd64.deb
        printf "Google Chrome installed successfully.\n"
    else
        printf "Google Chrome is already installed.\n"
    fi
else
    printf "Skipping Google Chrome installation.\n"
fi

# Install Visual Studio Code using snap package manager
read -p "Do you want to install Visual Studio Code? [Y/n]" install_vscode
if [[ "$install_vscode" == [yY] || "$install_vscode" == "" ]]; then
    if ! command -v code >> installer-script.log 2>&1
    then
        printf "Installing Visual Studio Code...\n"
        snap install code --classic >> installer-script.log 2>&1
        printf "Visual Studio Code installed successfully.\n"
    else
        printf "Visual Studio Code is already installed.\n"
    fi
else
    printf "Skipping Visual Studio Code installation.\n"
fi

# Install Git
read -p "Do you want to install Git? [Y/n]" install_git
if [[ "$install_git" == [yY] || "$install_git" == "" ]]; then
    if ! command -v git >> installer-script.log 2>&1
    then
        printf "Installing Git...\n"
        apt install git -y >> installer-script.log 2>&1
        printf "Git installed successfully.\n"
    else
        printf "Git is already installed.\n"
    fi
else
    printf "Skipping Git installation.\n"
fi

# Install Python
read -p "Do you want to install Python? [Y/n]" install_python
if [[ "$install_python" == [yY] || "$install_python" == "" ]]; then
    if ! command -v python3 >> installer-script.log 2>&1
    then
        printf "Installing Python...\n"
        apt install python3 python3-pip -y >> installer-script.log 2>&1
    else
        printf "Python is already installed.\n"
    fi
else
    printf "Skipping Python installation.\n"
fi

# Log file
read -p "Would you like to delete the 'installer-script.log' file that recorded the output of all executed commands? [Y/n]" log
if [[ "$log" == [yY] || "$log" == "" ]]; then
        rm installer-script.log
fi

# Installation Complete
printf "Installation complete!\n"