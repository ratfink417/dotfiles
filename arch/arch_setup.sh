#!/usr/bin/bash
# save the working dir in case we ever get lost and need to return
working_dir=$PWD

# create the directories needed by the environment
mkdir -p $HOME/.local/share/fonts
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/yay

# create var to reference dirs
local_fonts_dir=$HOME/.local/share/fonts
local_bin_dir=$HOME/.local/bin
local_yay_dir=$HOME/.local/yay

# set up yay (for installing AUR pkgs)
pushd
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git $local_yay_dir
cd $local_yay_dir 
makepkg -si
popd

# install utilities that are going to be needed
sudo pacman -Sy wget git bat fzf jq unzip lsd 

# select a nerdfont to install
font_choice='IBMPlexMono.zip'

# install fontconfig and install a nerd font
sudo pacman -Sy fontconfig 
wget -O /tmp/font.zip \
https://raw.githubusercontent.com/ryanoasis/nerd-fonts/releases/latest/download/$font_choice
unzip /tmp/font.zip -d $local_fonts_dir
fc-cache -f -v

# install zsh and make it the default shell
sudo pacman -Sy zsh 
chsh -s /usr/bin/zsh $USER

# install starship and configure zsh
curl -sS https://starship.rs/install.sh | sh
cd $working_dir 
cp ./zsh/.zshrc $HOME
cat ./zsh/zshrc_append >> $HOME/.zshrc
