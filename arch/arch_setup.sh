#!/usr/bin/bash

# create the directories needed by the environment
mkdir -p $HOME/.local/share/fonts
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/yay

# create var to reference dirs
local_fonts_dir=$HOME/.local/share/fonts
local_bin_dir=$HOME/.local/bin
local_yay_dir=$HOME/.local/yay

# set up yay (for installing AUR pkgs)
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git $local_yay_dir
cd $local_yay_dir 
makepkg -si

# install utilities that are going to be needed
sudo pacman -S wget git bat fzf jq unzip lsd 

# install zsh and make it the default shell
sudo pacman -S zsh 
chsh -s /usr/bin/zsh $USER

# install fontconfig and install a nerd font
sudo pacman -S fontconfig 
wget -o /tmp/font.zip \
https://raw.githubusercontent.com/ryanoasis/nerd-fonts/releases/latest/download/$font_choice
unzip /tmp/font.zip -d $local_fonts_dir
fc-cache -f -v
