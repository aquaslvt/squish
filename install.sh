#!/bin/sh

touch ~/.squishrc
echo -e "\033[34m->\033[0m .squishrc created in home directory"
git clone https://github.com/mkukiro/squish
cd squish
echo -e "\033[34m->\033[0m Installing squish into /usr/bin ···"
sudo install squish /usr/bin
echo -e "\033[34m->\033[0m Deleting install.sh ···"
rm install.sh
echo -e "\033[32m<-\033[0m Installation comlpeted!"