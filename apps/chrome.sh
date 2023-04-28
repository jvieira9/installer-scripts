spinner()
{
    local pid=$1
    local delay=0.15
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c] " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

spinnerPercentage() {
    local pid=$1
    local delay=0.15
    local spinstr='|/-\'
    local progress=0
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c] %d%% " "$spinstr" "$progress"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
        if [ $progress -lt 100 ]; then
            progress=$((progress+10))
        fi
    done
    printf "    \b\b\b\b"
}

if ! dpkg -l google-chrome-stable >> install.log 2> error.log
        then
            printf " \n"
            printf "Installing Google Chrome...\n"
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> install.log 2> error.log
            sudo dpkg -i google-chrome-stable_current_amd64.deb >> install.log 2> error.log & spinnerPercentage $!
            printf " \n"
            printf "Google Chrome installed successfully.\n"
            rm google-chrome-stable_current_amd64.deb
        else
            printf " \n"
            printf "\033[31mChrome is already installed.\n\033[0m"
        fi