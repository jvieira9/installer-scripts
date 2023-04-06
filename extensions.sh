#!/bin/bash
# 2023 - By: João Vieira | 'jvieira9' on GitHub
# This script automates the installation of some Visual Studio Code extensions on an Ubuntu-based system.
# VS Code Extensions: Python, Shellman, Docker, Intellicode.

# This enables the script to exit immediately if any command fails
set -euo pipefail

# Internet connection check

if ! ping -c 4 google.com &> /dev/null && ! ping -c 4 microsoft.com &> /dev/null; then
    printf "No internet connection. The script cannot be executed.\n"
    exit 1
else
    printf "Internet connection found. The script will be executed.\n"
fi

# VS Code check

if ! command -v code &> /dev/null; then
    printf "Visual Studio Code is not installed. Aborting.\n"
    exit 1
fi
# List of extensions

printf "This script will install the following VS Code extensions: Python, Shellman, Docker, Intellicode."

# Install VS Code extensions
read -p " Do you want to proceed? (Y/n)" install_extensions
if [[ "$install_extensions" == [yY] || "$install_extensions" == "" ]]; then
    read -p "Do you want to install the Python extension? (Y/n)" install_vscextpython
    if [[ "$install_vscextpython" == [yY] || "$install_vscextpython" == "" ]]; then
        if ! code --list-extensions | grep -q "ms-python.python"; then 
            printf "Installing the Python extension...\n"
            code --install-extension ms-python.python >/dev/null 2>&1
            printf "The extension was succesfully installed.\n"
        else
            printf "The Python extension is already installed.\n"
        fi
    else
        printf "Skipping the Python extension installation.\n"
    fi

    read -p "Do you want to install the Docker extension? (Y/n)" install_vscextdocker
    if [[ "$install_vscextdocker" == [yY] || "$install_vscextdocker" == "" ]]; then
        if ! code --list-extensions | grep -q "ms-azuretools.vscode-docker"; then
            printf "Installing the Docker extension...\n"
            code --install-extension ms-azuretools.vscode-docker >/dev/null 2>&1
            printf "The extension was succesfully installed.\n"
        else
            printf "The Docker extension is already installed.\n"
        fi
    else
        printf "Skipping the Docker extension installation.\n"
    fi

    read -p "Do you want to install the IntelliCode extension? (Y/n)" install_vscextintellicode
    if [[ "$install_vscextintellicode" == [yY] || "$install_vscextintellicode" == "" ]]; then
        if ! code --list-extensions | grep -q "VisualStudioExptTeam.vscodeintellicode"; then
            printf "Installing the IntelliCode extension...\n"
            code --install-extension VisualStudioExptTeam.vscodeintellicode >/dev/null 2>&1
            printf "The extension was succesfully installed.\n"
        else
            printf "The IntelliCode extension is already installed.\n"
        fi
    else
        printf "Skipping the IntelliCode extension installation.\n"
    fi

    read -p "Do you want to install the shellman extension? (Y/n)" install_vscextshellman
    if [[ "$install_vscextshellman" == [yY] || "$install_vscextshellman" == "" ]]; then
        if ! code --list-extensions | grep -q "Remisa.shellman"; then
            printf "Installing the shellman extension...\n"
            code --install-extension Remisa.shellman >/dev/null 2>&1
            printf "The extension was succesfully installed.\n"
        else
            printf "The shellman extension is already installed.\n"
        fi
    else
        printf "Skipping the shellman extension installation.\n"
    fi
    printf "Installation complete!\n"
else
    printf "Aborting. No extensions were installed.\n"
fi