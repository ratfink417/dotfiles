#!/usr/bin/bash
# save the working dir in case we ever get lost and need to return
working_dir=$PWD

# create the directories needed by the environment
mkdir -p $HOME/.local/share/fonts
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/yay
mkdir -p $HOME/.config

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
sudo pacman -Sy wget git bat fzf jq unzip lsd man-db fd ripgrep python3 lua51 luarocks eslint_d rust composer prettier nodejs npm jre-openjdk jdk-openjdk openjdk-doc python-virtualenv perl python-black tree-sitter julia python-pip python-neovim ruby lsd

# configure nodejs and npm for local user 
npm set prefix="$HOME/.local"
npm install -g neovim

# install man pages
sudo mandb

# select a nerdfont to install
font_choice='IBMPlexMono.zip'

# install fontconfig and install a nerd font
sudo pacman -Sy fontconfig 
wget -O /tmp/font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip
unzip /tmp/font.zip -d $local_fonts_dir
fc-cache -f -v

# install zsh and make it the default shell
sudo pacman -Sy zsh 
chsh -s /usr/bin/zsh $USER

# install starship and configure zsh
curl -sS https://starship.rs/install.sh | sh
cd $working_dir 
cp ../zsh/.zshrc $HOME
cat ./zshrc_append >> $HOME/.zshrc
cp ../starship/starship.toml $HOME/.config/starship.toml

# install neovim and copy the config folder
sudo pacman -S neovim
cp -R ../neovim $HOME/.config/nvim
