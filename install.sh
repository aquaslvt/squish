#!/bin/sh

# Check if the user has root previleges

if [[ $EUID -ne 0 ]]; then
    echo "\033[31m=>\033[0m This script requires root privileges! Please run with sudo/doas"
    exit 1
fi

# Step 1

touch ~/.config/squish/.squishrc
echo -e "\033[34m~>\033[0m .squishrc created in .config"

# Step 2

echo -e "\033[34m->\033[0m In what directory do you want to install fish in? 1. /usr/bin 2. /usr/local/bin"
read x
echo -e "\033[34m~>\033[0m Installing squish..."

if [ $x -eq 1 ]; then
    install squish /usr/bin
elif [ $x -eq 2 ]; then
    install squish /usr/local/bin
else
    install squish /usr/bin
fi

# Step 3

echo -e "\033[34m~>\033[0m Deleting install.sh"
rm install.sh

# End

echo -e "\033[32m<~\033[0m Installation completed!"
exit 0