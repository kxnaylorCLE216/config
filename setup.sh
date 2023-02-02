#!/bin/bash

################################
######### VARIABLES ############
################################
EMAIL="terminal109@protonmail.com"     
AUTHOR="Kyle Naylor"          
################################

# Update pacman and install keyring to avoid signature problems
sudo pacman -Syu
sudo pacman -S manjaro-keyring
sudo pacman -Suu

# Base develop packages
sudo pacman -S git fish vim

# Browsers
yay -Syu
yay -S firefox

# The Rest
yay -S alacrity youtube neofetch oh-my-posh-bin youtube-music-bin rofi polybar visual-studio-code-bin nextcloud-client thunderbird protonmail-bridge-bin exa chatgpt-desktop-bin amberol


## Configure GIT ##
git config --global user.name $AUTHOR
git config --global user.email $NAME

## SSH Config
ssh-keygen -t rsa -b 2048 -f $HOME/.ssh/id_rsa -N ''

chsh -s $(which fish)

yay -S polybar-themes-git

mkdir ~/Repos
cd ~/Repos

git clone https://github.com/kxnaylorCLE216/config.git

cp --symbolic-link /home/kxn/Repos/config/config ~/.config/i3/config
