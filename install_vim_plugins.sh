echo "Installing Vundle for VIM"
mkdir -p ~/.vim/bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp configs/vimrc ~/.vimrc

echo "Installing Vim Plugins"
vim +PluginInstall +qall
