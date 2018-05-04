#!/bin/zsh

echo "Installing antigen for zsh"
mkdir -p ~/.config

curl -L git.io/antigen > "$HOME/.config/antigen.zsh"

echo "Installing base16 colors"
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

cp configs/zshrc ~/.zshrc

source ~/.zshrc
base16_eighties # Install the eighties base16 color scheme

echo "Installing Vundle for VIM"
mkdir -p ~/.vim/bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp configs/vimrc ~/.vimrc

echo "Installing Vim Plugins"
vim +PluginInstall +qall

echo ""
echo "========================="
echo "Everything has been installed to the correct place, please execute the following commands:"
