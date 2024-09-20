#!/usr/bin/bash
# save the working dir in case we ever get lost and need to return
working_dir=$PWD

# install utilities that are going to be needed
sudo apt install wget curl git fzf jq unzip lsd man-db fd-find python3 lua5.1 luarocks composer nodejs npm default-jdk  python3-virtualenv python3.11-venv perl  python3-pip python3-neovim ruby llvm lldb fontconfig zsh neovim tmux 

# install neovim 
wget -O $HOME/.local/bin/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.10.1/nvim.appimage
chmod u+x $HOME/.local/bin/nvim.appimage

# install bat
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb -O /tmp/bat.deb
sudo dpkg -i /tmp/bat.deb

# install ripgrep
wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep_14.1.1-1_amd64.deb -O /tmp/ripgrep.deb
sudo dpkg -i /tmp/ripgrep.deb

# rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# create the directories needed by the environment
mkdir -p $HOME/.local/share/fonts
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.config

# create var to reference dirs
local_fonts_dir=$HOME/.local/share/fonts
local_bin_dir=$HOME/.local/bin

# configure nodejs and npm for local user 
npm set prefix="$HOME/.local"
npm install -g neovim

# install man pages
sudo mandb

# select a nerdfont to install
font_choice='IBMPlexMono.zip'

# install fontconfig and install a nerd font
wget -O /tmp/font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip
unzip /tmp/font.zip -d $local_fonts_dir
fc-cache -f -v

# install zsh and make it the default shell
chsh -s /usr/bin/zsh $USER

# install starship and configure zsh
curl -sS https://starship.rs/install.sh | sh
cd $working_dir 
cp ../zsh/.zshrc $HOME
cat ./zshrc_append >> $HOME/.zshrc
cp ../starship/starship.toml $HOME/.config/starship.toml

# install neovim and copy the config folder
cp -R ../neovim $HOME/.config/nvim

# install and configure tmux
cp -R ../tmux/.tmux $HOME
cp ../tmux/.tmux.conf $HOME
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# set up debugpy virtual environment for python-dap
mkdir $HOME/.virtualenvs
cd $HOME/.virtualenvs
python3 -m venv debugpy
debugpy/bin/python -m pip install debugpy
cd $working_dir

# set up lldb debugging for c/cpp/rust 
cp ./neovim/c_rust.lua $HOME/.config/nvim/lua/plugins/dap/c_rust.lua 
