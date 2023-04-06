#!/bin/bash
# 2023 - By: João Vieira | 'jvieira9' on GitHub
# This script automates the installation of software on an Ubuntu-based system.
# Softwares: Docker, Google Chrome, Visual Studio Code, VLC, Git, Python.

# This enables the script to exit immediately if any command fails
set -euo pipefail

# Internet connection check

if ! ping -c 1 google.com &> /dev/null; then
    printf "No internet connection. The script cannot be executed.\n"
    exit 1
fi

printf "Internet connection found. The script will be executed.\n"

# Update the package index, upgrade the system packages to their latest versions and install linux build essential and headers.
sudo apt update >/dev/null 2>&1 && sudo apt-get upgrade -y >/dev/null 2>&1
sudo snap refresh >/dev/null 2>&1
sudo apt install -y build-essential linux-headers-$(uname -r) >/dev/null 2>&1

# Install Docker using snap package manager
read -p "Do you want to install Docker? (Y/n)" install_docker
if [[ "$install_docker" == [yY] || "$install_docker" == "" ]]; then
    if ! command -v docker &> /dev/null
    then
        printf "Installing Docker...\n"
        sudo snap install docker >/dev/null 2>&1
        printf "Docker installed successfully.\n"
    else
        printf "Docker is already installed.\n"
    fi
else
    printf "Skipping Docker installation.\n" 
fi

# Download the latest version of Google Chrome for Ubuntu and install it using dpkg package manager
read -p "Do you want to install Google Chrome? (Y/n)" install_chrome
if [[ "$install_chrome" == [yY] || "$install_chrome" == "" ]]; then
    if ! dpkg -l google-chrome-stable &> /dev/null
    then
        printf "Installing Google Chrome...\n"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >/dev/null 2>&1
        sudo dpkg -i google-chrome-stable_current_amd64.deb >/dev/null 2>&1
        rm google-chrome-stable_current_amd64.deb
        printf "Google Chrome installed successfully.\n"
    else
        printf "Google Chrome is already installed.\n"
    fi
else
    printf "Skipping Google Chrome installation.\n"
fi

# Install Visual Studio Code using snap package manager
read -p "Do you want to install Visual Studio Code? (Y/n)" install_vscode
if [[ "$install_vscode" == [yY] || "$install_vscode" == "" ]]; then
    if ! command -v code &> /dev/null
    then
        printf "Installing Visual Studio Code...\n"
        sudo snap install code --classic >/dev/null 2>&1
        printf "Visual Studio Code installed successfully.\n"
    else
        printf "Visual Studio Code is already installed.\n"
    fi
else
    printf "Skipping Visual Studio Code installation.\n"
fi

# Install Git
read -p "Do you want to install Git? (Y/n)" install_git
if [[ "$install_git" == [yY] || "$install_git" == "" ]]; then
    if ! command -v git &> /dev/null
    then
        printf "Installing Git...\n"
        sudo apt install git -y >/dev/null 2>&1
        printf "Git installed successfully.\n"
    else
        printf "Git is already installed.\n"
    fi
else
    printf "Skipping Git installation.\n"
fi

# Install VLC media player
read -p "Do you want to install VLC Media Player? (Y/n)" install_vlc
if [[ "$install_vlc" == [yY] || "$install_vlc" == "" ]]; then
    if ! command -v vlc &> /dev/null
    then
        printf "Installing VLC media player...\n"
        sudo apt install vlc -y >/dev/null 2>&1
        printf "VLC media player installed succesfully.\n"
    else
        printf "VLC media player is already installed.\n"
    fi
else
    printf "Skipping VLC media player installation.\n"
fi

# Install Python
read -p "Do you want to install Python? (Y/n)" install_python
if [[ "$install_python" == [yY] || "$install_python" == "" ]]; then
    if ! command -v python3 &> /dev/null
    then
        printf "Installing Python...\n"
        sudo apt install python3 python3-pip -y >/dev/null 2>&1
    else
        printf "Python is already installed.\n"
    fi
else
    printf "Skipping Python installation.\n"
fi

# Update the package index and upgrade the system packages again
sudo apt update >/dev/null 2>&1 && sudo apt-get upgrade -y >/dev/null 2>&1
sudo snap refresh >/dev/null 2>&1

# Installation Complete
printf "Installation complete!\n"
