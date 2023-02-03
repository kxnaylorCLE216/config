#!/bin/bash

################################
######### VARIABLES ############
################################
EMAIL="terminal109@protonmail.com"     
AUTHOR="Kyle Naylor"          
################################

# Cleaning the TTY.
clear

# Cosmetics (colours for text).
BOLD='\e[1m'
BRED='\e[91m'
BBLUE='\e[34m'  
BGREEN='\e[92m'
BYELLOW='\e[93m'
RESET='\e[0m'

# Update pacman and install keyring to avoid signature problems
sudo pacman -Syu
sudo pacman -S manjaro-keyring
sudo pacman -Suu

# Install .NET Core SDK
sudo pacman -S dotnet-sdk

# Install Visual Studio Code
sudo pacman -S visual-studio-code

# Install C# extension for Visual Studio Code
code --install-extension ms-dotnettools.csharp

# Install Git
sudo pacman -S git

# Install dependencies for GitLens extension
sudo pacman -S libsecret

# Install GitLens extension for Visual Studio Code
code --install-extension eamodio.gitlens

# Remove xfce and its extra applications
sudo pacman -R xfce4 xfce4-goodies

# Base develop packages
sudo pacman -S vim

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Update Yay
yay -Syu

# Install i3 window manager
yay -S i3-wm

# Install pywal
yay -S python-pywal

# Install i3status-rust
yay -S i3status-rust

# Install polybar
yay -S polybar

# Install rofi
yay -S rofi

# Install picom
yay -S picom

# Install conky
yay -S conky

# Install nitrogen
yay -S nitrogen

# Install firefox
yay -S firefox

# Install alacrity
yay -S alacrity 

# Install youtube
yay -S youtube 

# Install neofetch
yay -S neofetch

# Install polybar-themes
yay -S polybar-themes

# Install rofi-themes
yay -S rofi-themes

# Install i3status-rust-themes
yay -S i3status-rust-themes

# Install Amberol
yay -S amberol

# Install Fish shell
yay -S fish

# Change the default shell to Fish
chsh -s /usr/bin/fish

# Install Powerline-shell
yay -S powerline-shell

# Install Ranger
yay -S ranger

# Install GIMP
yay -S gimp

# Install Neofetch
yay -S neofetch

# Install another file manager
yay -S thunar

# Install youtube music
yay -S youtube-music-bin 

# Install nextcloud-client
yay -S nextcloud-client 

# Install thunderbird
yay -S thunderbird 

# Install protonmail-bridge-bin
yay -S protonmail-bridge-bin 

# Install exa
yay -S exa 

# Install chatgpt-desktop-bin
yay -S chatgpt-desktop-bin 

## Configure GIT ##
git config --global user.name $AUTHOR
git config --global user.email $NAME

## SSH Config
ssh-keygen -t rsa -b 2048 -f $HOME/.ssh/id_rsa -N ''

mkdir ~/Repos

# Set i3status-rust as the status bar for i3
echo "status_command = i3status-rust" >> ~/.config/i3/config

# Set pywal as the color scheme generator for i3
echo "exec_always nitrogen --restore && wal -i \$(< \${HOME}/.config/nitrogen/wall)" >> ~/.config/i3/config

# Start picom as a compositor for i3
echo "exec --no-startup-id picom" >> ~/.config/i3/config

# Apply pywal color scheme to Firefox and other applications
echo "export GTK_THEME=\$(cat ~/.cache/wal/gtk.css | grep -oP 'gtk-theme-name: \K.*')" >> ~/.bashrc
echo "export QT_STYLE_OVERRIDE=\$(cat ~/.cache/wal/qt5ct.conf | grep -oP 'style=\K.*')" >> ~/.bashrc

# Copy a sample polybar configuration file
cp /usr/share/doc/polybar/config ~/.config/polybar/config

# Choose a polybar theme
sed -i 's/example-theme/shapes/g' ~/.config/polybar/config

# Copy a sample rofi configuration file
cp /usr/share/

# Set i3status-rust as the status bar for i3
echo "status_command = i3status-rust" >> ~/.config/i3/config

# Set pywal as the color scheme generator for i3
echo "exec_always nitrogen --restore && wal -i \$(< \${HOME}/.config/nitrogen/wall)" >> ~/.config/i3/config

# Copy a sample rofi configuration file
cp /usr/share/doc/rofi/config.rasi ~/.config/rofi/config.rasi

# Choose a rofi theme
sed -i 's/example-theme/type-4/g' ~/.config/rofi/config.rasi

# Copy a sample i3status-rust configuration file
cp /usr/share/doc/i3status-rust/config.toml ~/.config/i3status-rust/config.toml

# Choose an i3status-rust theme
sed -i 's/example-theme/modern/g' ~/.config/i3status-rust/config.

# Configure powerline-shell
powerline-shell --install
echo "powerline-shell" >> ~/.config/fish/config.fish

# Configure ranger
echo "set visualmode=stay" >> ~/.config/ranger/rc.conf

# Configure git to use vim as the default editor
git config --global core.editor vim

# Set vim as the default text editor
echo "export VISUAL=vim" >> ~/.bashrc
echo "export EDITOR=vim" >> ~/.bashrc

# Configure neofetch
echo 'neofetch' >> ~/.config/fish/config.fish
echo 'neofetch' >> ~/.bashrc
echo 'neofetch' >> ~/.zshrc

# Add a cool vim theme
curl -fLo ~/.vim/colors/molokai.vim --create-dirs \
    https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
echo "syntax on" >> ~/.vimrc
echo "colorscheme molokai" >> ~/.vimrc

# Use another file manager
sudo pacman -S nemo

# Apply Pywal colors based on the nitrogen wallpaper
echo "wal -i \`cat ~/.cache/wal/wal\`" >> ~/.config/fish/config.fish
echo "wal -i \`cat ~/.cache/wal/wal\`" >> ~/.bashrc
echo "wal -i \`cat ~/.cache/wal/wal\`" >> ~/.zshrc

# Add media playing information to display on Polybar and i3status-rust
# Add the following lines to your Polybar config file:
# [module/mediaplayer]
# type = custom/script
# exec = "$HOME/.config/polybar/scripts/mediaplayer.sh"
# tail = true
# format-background = "#2f343f"
# format = "<label></label> %output%"

# Create the mediaplayer.sh script in the scripts directory:
# #!/bin/bash
# 
# media=$(playerctl -p spotify metadata artist 2> /dev/null || echo "")
# 
# if [ -z "$media" ]; then
#   echo ""
# else
#   echo "$media"
# fi

# Add the following lines to your i3status-rust config file:
# [mediaplayer]
# command = "$HOME/.config/i3status-rust/scripts/mediaplayer.sh"
# interval = 1
# label = "media"

# Create the mediaplayer.sh script in the scripts directory:
# #!/bin/bash
# 
# media=$(playerctl -p spotify
