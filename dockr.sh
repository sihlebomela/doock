#!/usr/bin/bash

# COLORS
# text color
red=$(tput setaf 1)
white=$(tput setaf 7)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
black=$(tput setaf 0)
# text style
bold=$(tput bold)
dim=$(tput dim)

# bg color
bgRed=$(tput setab 1)
bgGreen=$(tput setab 2)

# end style
reset=$(tput sgr0)

# title
echo "${green}
█▀▄ █▀█ █▀█ █▀▀ █▄▀
█▄▀ █▄█ █▄█ █▄▄ █░█${reset}"
echo "${dim}enable and disable ubuntu dock${reset}"
echo

# MENU
echo "${yellow}(1) disable ubuntu dock
${cyan}(2) enable ubuntu dock"
echo

# Ask till choice is valid
printf "Enter Option > "

while read -r OPTION; do
    if (($OPTION == 1)); then
        echo "disabling ubuntu dock..."
        {
            # disabling ubuntu dock, without removing anything
            cd /usr/share/gnome-shell/extensions/
            sudo mv ubuntu-dock@ubuntu.com{,.bak}

        } || {
            echo
            echo "${bgRed}${white}seems like ubuntu dock is already disabled...${reset}"
        }
        echo
        echo -e "Use ${black}${bgGreen}Alt + F2$reset then in the input that appears enter ${black}${bgGreen}r${reset} to refresh gnome or reboot to see changes"
        exit 0
    elif (($OPTION == 2)); then

        echo "enabling ubuntu dock..."
        {
            # enabling ubuntu dock
            cd /usr/share/gnome-shell/extensions/
            sudo mv ubuntu-dock@ubuntu.com{.bak,}
        } || {
            echo
            echo "${bgRed}${red}seems like ubuntu dock is already enabled...${reset}"
        }
        echo
        echo -e "Use ${black}${bgGreen}Alt + F2$reset then in the input that appears enter ${bgGreen}${black} r ${reset} to refresh gnome or reboot to see changes"
        exit 0
    else
        # invalid option
        echo
        echo "${red}invalid option!${reset}"
        printf "Enter Option > "
    fi
done
