# Installer Scripts

This repository contains two bash scripts designed to automate some installation processes. The scripts are recommended to be used by developers.

## Author

2023 - By João Vieira | `jvieira9` on [GitHub](https://github.com/jvieira9)

### Script 1 - software.sh

This script automates the installation of the following software:

- Google Chrome
- Visual Studio Code
- Git
- Docker
- Python
- Node.js
- VirtualBox
- VLC
- Notepadqq

### Functionality

1. The script creates two log files. A file named `install.log` that will register all the commands executed by the script and a file named `error.log` that will register every error that occurs while executing the script.
2. The script checks for an internet connection and exits if there is no internet connection.
3. The script checks if the user running the script is root or has sudo privileges and exits if it isn't.
4. The script updates the package index, upgrades system packages and refreshes snap packages.
5. The script prompts the user to choose which software to install. If the user chooses to install a software, the script installs it. If the package is already installed, the script says so.
6. The script prompts the user to choose if they want to delete the log files created by the script.

### Script 2 - extensions.sh

This script automates the installation of the following Visual Studio Code extensions:

- Python
- Shellman
- Docker
- Intellicode
- Node.js extension pack 

### Functionality

1. The script creates two log files. A file named `extensions-install.log` that will register all the commands executed by the script and a file named `extensions-error.log` that will register every error that occurs while executing the script.
2. The script checks for an internet connection and exits if there is no internet connection.
3. The script checks if the VS Code installed in the device and exits if it isn't.
4. The script prompts the user to choose which extensions to install. If the user chooses to install a extension, the script installs it. If the package is already installed, the script says so.
6. The script prompts the user to choose if they want to delete the log files created by the script.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Getting Started

To execute the scripts on a new machine, follow these steps:

1. Clone this repository to your local machine using the command:

    ```
    git clone https://github.com/jvieira9/installer-scripts.git
    ```

2. Navigate to the directory where the repository was cloned using the command:

    ```
    cd <repository_name>
    ```

3. Modify the permissions of the scripts before executing them. To do this, run the following command: 

    ```
    chmod +x software.sh extensions.sh
    ```

4. Run the following command to execute the first script: 

    ```
    ./software.sh
    ```

5. Run the following command to execute the second script: 

    ```
    ./extensions.sh
    ```

## Notes

- These scripts were designed to run on Ubuntu 22.04 but can run on most Debian-based Linux distributions, such as Linux Mint, Ubuntu, Debian, Xubuntu, and Lubuntu.
- To execute the `extensions.sh` script, you need Visual Studio Code installed on your computer.

#### If you encounter any issues while executing these scripts, please feel free to contact me at `joao.lopes.vieira115@gmail.com`.
