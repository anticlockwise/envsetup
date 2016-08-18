echo "Installing antigen for zsh"
mkdir -p ~/.config
mkdir -p ~/.local

curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > "~/.local/antigen.zsh"

echo "Installing base16 colors"
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

cp configs/zshrc ~/.zshrc

echo "Installing Vundle for VIM"
mkdir -p ~/.vim/bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp configs/vimrc ~/.vimrc

echo "Installing Vim Plugins"
vim +PluginInstall +qall

echo ""
echo "========================="
echo "Everything has been installed to the correct place, please execute the following commands:"
echo "source ~/.zshrc"
echo "antigen apply"
