printf "\033[31mDo you want to upgrade your system packages? \n\033[0m"
read -p "(Y/n) " confirm

if [[ "$confirm" == [yY] || "$confirm" == "" ]]; then
    printf "\033[31mUpdating packages...\n\033[0m"
    sudo apt update >> install.log 2> error.log && sudo apt-get upgrade -y >> install.log 2> error.log & spinner $!
    sudo snap refresh >> install.log 2> error.log
    printf "\033[32mPackages updated successfully.\n\033[0m"
    printf " \n"
else
    echo "Upgrade cancelled"
fi