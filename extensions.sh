#!/bin/bash
# 2023 - By: João Vieira | 'jvieira9' on GitHub
# This script automates the installation of Visual Studio Code extensions on an Ubuntu-based system.
# VS Code Extensions: Python, Shellman, Docker, Intellicode, Node.js extension pack.

# Remove log files from previous executions of the script
rm extensions-install.log >/dev/null 2>&1
rm extensions-error.log >/dev/null 2>&1

# Create a new extensions-install.log file and log the first message
printf "This file registers every command executed by this script.\n" >> extensions-install.log

# This enables the script to exit immediately if any command fails
set -euo pipefail

# Internet connection check
if ! ping -c 2 google.com >> extensions-install.log 2> extensions-error.log && ! ping -c 2 microsoft.com >> extensions-install.log 2> extensions-error.log; then
    printf "No internet connection. The script cannot be executed.\n"
    rm extensions-install.log >/dev/null 2>&1
    rm extensions-error.log >/dev/null 2>&1
    exit 1
fi

# VS Code check
if ! command -v code &> /dev/null; then
    printf "Visual Studio Code is not installed. Aborting.\n"
    rm extensions-install.log >/dev/null 2>&1
    rm extensions-error.log >/dev/null 2>&1
    exit 1
fi

# Print the list of software that can be installed
printf "Type the digit that corresponds to the extension you wish to install and press 'Enter', afterwards select the option 'Finished' to proceed with the installation.\n" 
printf "Select 'None' to exit without installing any software.\n"
printf " \n"
options=("Python" "Shellman" "Docker" "IntelliCode" "Node.js extension pack" "Finished" "None")
selected=()

# Loop until the user is done selecting options
while true; do
  select opt in "${options[@]}"; do
    case $opt in
      "Finished")
        # Check if the user has selected any packages. If not, prompt the user to select at least one package.
        if [ ${#selected[@]} -eq 0 ]; then
          printf "Please select at least one option or 'None' to exit.\n"
        else
          break 2 # Exit both loops and proceed to install the selected packages.
        fi
        ;;
      "None")
        printf " \n"
        printf "Exiting without installing any software.\n"
        rm extensions-install.log >/dev/null 2>&1
        rm extensions-error.log >/dev/null 2>&1
        exit 0
        ;;
      *)
        # Check if the user has already selected the package. If not, add it to the list of selected packages.
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

# Install the selected extensions
for opt in "${selected[@]}"; do
  case $opt in

    "Python")
        # Check if Python Extension is already installed. If not, install it.
        if ! code --list-extensions | grep -q "ms-python.python"; then 
            printf "Installing the Python extension...\n"
            code --install-extension ms-python.python >> extensions-install.log 2> extensions-error.log
            printf "The Python extension was succesfully installed.\n"
        else
            printf "The Python extension is already installed.\n"
        fi
    ;;

    "Docker")
        # Check if Docker Extension is already installed. If not, install it.
        if ! code --list-extensions | grep -q "ms-azuretools.vscode-docker"; then
            printf "Installing the Docker extension...\n"
            code --install-extension ms-azuretools.vscode-docker >> extensions-install.log 2> extensions-error.log
            printf "The Docker extension was succesfully installed.\n"
        else
            printf "The Docker extension is already installed.\n"
        fi
    ;;

    "IntelliCode")
        # Check if IntelliCode Extension is already installed. If not, install it.
        if ! code --list-extensions | grep -q "VisualStudioExptTeam.vscodeintellicode"; then
            printf "Installing the IntelliCode extension...\n"
            code --install-extension VisualStudioExptTeam.vscodeintellicode >> extensions-install.log 2> extensions-error.log
            printf "The IntelliCode extension was succesfully installed.\n"
        else
            printf "The IntelliCode extension is already installed.\n"
        fi
    ;;

    "Shellman")
        # Check if shellman Extension is already installed. If not, install it.
        if ! code --list-extensions | grep -q "Remisa.shellman"; then
            printf "Installing the shellman extension...\n"
            code --install-extension Remisa.shellman >> extensions-install.log 2> extensions-error.log
            printf "The Shellman extension was succesfully installed.\n"
        else
            printf "The Shellman extension is already installed.\n"
        fi
    ;;

    "Node.js extension pack")
        # Check if Node.js extension pack is already installed. If not, install it.
        if ! code --list-extensions | grep -q "waderyan.nodejs-extension-pack"; then
            printf "Installing the Node.js extension pack...\n"
            code --install-extension waderyan.nodejs-extension-pack >> extensions-install.log 2> extensions-error.log
            printf "The Node.js extension pack was succesfully installed.\n"
        else
            printf "The Node.js extension pack is already installed.\n"
        fi
    ;;
  esac
done

# Log files
printf " \n"
read -p "Would you like to delete the log files created by this script? [Y/n]" log
if [[ "$log" == [yY] || "$log" == "" ]]; then
        rm extensions-install.log >/dev/null 2>&1
        rm extensions-error.log >/dev/null 2>&1
fi

# Installation Complete
printf " \n"
printf "Installation complete!\n"