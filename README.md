# Installer Scripts

This repository contains two bash scripts designed to automate some installation processes. The scripts are recommended for use by developers.

## Author

2023 - By João Vieira | `jvieira9` on [GitHub](https://github.com/jvieira9)

### Script 1 - software.sh

This script automates the installation of the following software:

- Docker
- Google Chrome
- Visual Studio Code
- Git
- Python

### Functionality

1. The script checks for an internet connection and exits if there is no internet connection.
2. The script updates the package index, upgrades system packages, and installs Linux build essential and headers.
3. The script prompts the user to choose which software packages to install. If the user chooses to install a package, the script installs it using the appropriate package manager. If the package is already installed, the script skips the installation process.
4. The script updates the package index and upgrades system packages again, and prints "Installation complete!" to indicate that the installation process is finished.

### Script 2 - extensions.sh

This script automates the installation of the following Visual Studio Code extensions:

- Python
- Shellman
- Docker
- Intellicode

### Functionality

1. The script checks for an internet connection and exits if there is no internet connection.
2. The script checks if Visual Studio Code is installed and exits if it isn't.
3. The script prompts the user to confirm if they want to proceed with the installation of the extensions. If the user confirms, the script proceeds to install each of the extensions, prompting the user for confirmation for each extension.
4. If an extension is already installed, the script skips the installation of that extension.
5. Once all the extensions have been installed or skipped, the script prints a message indicating the completion of the installation process.

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
