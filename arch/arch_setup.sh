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
sudo pacman -Sy --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git $local_yay_dir
cd $local_yay_dir 
makepkg -si
popd

# install utilities that are going to be needed
sudo pacman -Sy --noconfirm wget git bat fzf jq unzip lsd man-db fd ripgrep python3 lua51 luarocks eslint_d rust composer prettier nodejs npm jdk-openjdk openjdk-doc python-virtualenv perl python-black tree-sitter julia python-pip python-neovim ruby lsd gdb llvm lldb

# configure nodejs and npm for local user 
npm set prefix="$HOME/.local"
npm install -g neovim

# install man pages
sudo mandb

# select a nerdfont to install
font_choice='IBMPlexMono.zip'

# install fontconfig and install a nerd font
sudo pacman -Sy --noconfirm fontconfig 
wget -O /tmp/font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip
unzip /tmp/font.zip -d $local_fonts_dir
fc-cache -f -v

# install zsh and make it the default shell
sudo pacman -Sy --noconfirm zsh 
chsh -s /usr/bin/zsh $USER

# install starship and configure zsh
curl -sS https://starship.rs/install.sh | sh
cd $working_dir 
cp ../zsh/.zshrc $HOME
cat ./zshrc_append >> $HOME/.zshrc
cp ../starship/starship.toml $HOME/.config/starship.toml

# install neovim and copy the config folder
sudo pacman -S --noconfirm neovim
cp -R ../neovim $HOME/.config/nvim

# install and configure tmux
sudo pacman -S --noconfirm tmux 
yay -S tmux-plugin-manager
cp -R ../tmux/.tmux $HOME
cp ../tmux/.tmux.conf $HOME
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# set up debugpy virtual environment for python-dap
pushd
mkdir $HOME/.virtualenvs
cd $HOME/.virtualenvs
python - m venv debugpy
debugpy/bin/python -m pip install debugpy
popd

# set up lldb debugging for c/cpp/rust 
sudo echo "ptrace_scope=0" >> /etc/sysctl.conf
sudo sysctl -p
cp ./neovim/c_rust.lua $HOME/.config/nvim/lua/plugins/dap/c_rust.lua 
