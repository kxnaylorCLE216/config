#!/bin/bash

# Cleaning the TTY.
clear

################################
######### VARIABLES ############
################################
EMAIL="terminal109@protonmail.com"     
AUTHOR="Kyle Naylor"          
################################

# Update pacman and install keyring to avoid signature problems
sudo pacman -Syu --noconfirm
sudo pacman -S manjaro-keyring --noconfirm
sudo pacman -Suu --noconfirm

sudo pacman -S git --noconfirm

## Configure GIT ##
git config --global user.name $AUTHOR
git config --global user.email $NAME

## SSH Config
ssh-keygen -t rsa -b 2048 -f $HOME/.ssh/id_rsa -N ''

# Base develop packages 
sudo pacman -Syu base-devel --noconfirm
sudo pacman -Syu curl --noconfirm
sudo pacman -S vim --noconfirm

# Add a cool vim theme
curl -fLo ~/.vim/colors/molokai.vim --create-dirs \
    https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
echo "syntax on" >> ~/.vimrc
echo "colorscheme molokai" >> ~/.vimrc

# Configure git to use vim as the default editor
git config --global core.editor vim

# Set vim as the default text editor
echo "export VISUAL=vim" >> ~/.bashrc
echo "export EDITOR=vim" >> ~/.bashrc

# Install .NET Core SDK
sudo pacman -S dotnet-sdk --noconfirm

# Install Visual Studio Code
yay -S code --noconfirm

# Install C# extension for Visual Studio Code
code --install-extension ms-dotnettools.csharp

# Install dependencies for GitLens extension
sudo pacman -S libsecret --noconfirm

# Install GitLens extension for Visual Studio Code
code --install-extension eamodio.gitlens

# Update Yay
yay -Syu --noconfirm

# Install firefox
yay -S firefox --noconfirm

# Install alacrity
yay -S alacrity --noconfirm 

# Install youtube
yay -S youtube --noconfirm 

# Install neofetch
yay -S neofetch --noconfirm

# Install Ranger
yay -S ranger --noconfirm

# Configure ranger
echo "set visualmode=stay" >> ~/.config/ranger/rc.conf

# Install GIMP
yay -S gimp --noconfirm

# Install Neofetch
yay -S neofetch --noconfirm

# Configure neofetch
echo 'neofetch' >> ~/.config/fish/config.fish
echo 'neofetch' >> ~/.bashrc

# Install another file manager
yay -S thunar --noconfirm

# Install youtube music
yay -S youtube-music-bin --noconfirm 

# Install nextcloud-client
yay -S nextcloud-client --noconfirm 

# Install thunderbird
yay -S thunderbird --noconfirm 

# Install protonmail-bridge-bin
yay -S protonmail-bridge-bin --noconfirm 

# Install exa
yay -S exa --noconfirm 

# Install chatgpt-desktop-bin
yay -S chatgpt-desktop-bin --noconfirm 

# Install Amberol
yay -S amberol --noconfirm

# Install polybar
yay -S polybar --noconfirm

mkdir -p ~/Repos
mkdir -p ~/.config/i3

# Install polybar-themes
git clone https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh
cd ..
rm -rf polybar-themes

# Install rofi
yay -S rofi --noconfirm

# Install i3status-rust
yay -S i3status-rust --noconfirm

# Install i3status-rust
yay -S otf-font-awesome --noconfirm

# Install i3status-rust
yay -S pulseaudio --noconfirm

# Install i3status-rust
yay -S pavucontrol --noconfirm

# Install i3status-rust
yay -S blueman --noconfirm

# Install i3status-rust
yay -S playerctl --noconfirm

# Install i3status-rust
yay -S pulseaudio-bluetooth --noconfirm

yay -S alacritty --noconfirm


# Copy a sample i3 configuration file
cp /etc/i3/config ~/.config/i3/config

# Choose a terminal theme
sed -i 's/i3-sensible-terminal/alacritty/g' ~/.config/i3/config

echo "exec_always --no-startup-id ~/.config/polybar/launch.sh --shapes" >> ~/.config/i3/config

mkdir -p ~/Backgrounds
cd ~/Backgrounds


curl https://raw.githubusercontent.com/kxnaylorCLE216/config/main/Backgrounds/leonardo-yip-NcWnJmeVtcw-unsplash.jpg?token=GHSAT0AAAAAAB6Y7FZRVJ2XXUAEV4ZTIIMMY7O2BRA >> image01.png

echo "exec_always --no-startup-id ~/.config/polybar/shapes/scripts/pywal.sh /home/kxn/Backgrounds" >> ~/.config/i3/config

# Install polybar-themes
cd ~/Repos
git clone https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ..
rm -rf rofi

#sed -i 's/dmenu_run/~/.config/rofi/launchers/type-3/launcher.sh/g' ~/.config/i3/config
sed -i 's!dmenu_run!~/.config/rofi/launchers/type-3/launcher.sh!g' ~/.config/i3/config

sed -i 's!bindsym Mod1+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"!bindsym Mod1+Shift+e exec --no-startup-id ~/.config/rofi/powermenu/type-1/powermenu.sh!g' ~/.config/i3/config

i3-msg reload
i3-msg restart

git clone https://github.com/MetaKomora/Manjaro-Post-Install-Script && cd Manjaro-Post-Install-Script;
chmod +x manjaro-post-install-script.sh;
./manjaro-post-install-script.sh

# Copy a sample i3status-rust configuration file
#cp /usr/share/doc/i3status-rust/config.toml ~/.config/i3status-rust/config.toml


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
