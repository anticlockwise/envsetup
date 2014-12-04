# This setup script will install and setup all necessary packages needed for
# my development environment. The list of packages are:
# 

echo "Starting development environment setup"

# Set up OSX Home Brew and brew packages
echo "Installing OSX Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing necessary Homebrew packages"
brew install git
brew install wget
brew install python
brew install mysql
brew install couchdb
brew install mongo
brew install ctags
brew install node
brew install source-highlight
brew install scala
brew install tmux
brew install typesafe-activator
brew install groovy
brew install vim --enable-pythoninterp --enable-rubyinterp --enable-perlinterp

# Setup Python packages
export PATH="/usr/local/bin:$PATH"
echo "Installing necessary Python packages"
pip install django
pip install tornado
pip install virtualenv
pip install mysql-python
pip install numpy
pip install scipy
pip install ipython
pip install jedi

# Setup Powerline
echo "Installing Powerline"
pip install git+git://github.com/Lokaltog/powerline

# Setup ZSH
echo "Installing oh-my-zsh"
curl -L http://install.ohmyz.sh | sh
cp ./zshrc ~/.zshrc

# Setup VIM
echo "Installing Pathogen for VIM"
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle

git clone https://github.com/tpope/vim-pathogen.git
cp ./vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
rm -rf ./vim-pathogen

echo "Downloading VIM bundles"

CUR_DIR=`pwd`
cd ~/.vim/bundle

git clone https://github.com/sjl/badwolf.git
git clone https://github.com/jlanzarotta/bufexplorer.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/Raimondi/delimitMate.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/Yggdroot/indentLine.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/tmhedberg/matchit.git
git clone https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/klen/python-mode.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/derekwyatt/vim-scala.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/jmcantrell/vim-virtualenv.git
git clone https://github.com/altercation/vim-colors-solarized.git

cd $CUR_DIR
cp ./vimrc ~/.vimrc

mkdir -p ~/.vim/syntax
mkdir -p ~/.vim/ftplugin
cp ./django.vim ~/.vim/syntax/
cp ./htmldjango.vim ~/.vim/syntax/
cp ./ftplugin_django.vim ~/.vim/ftplugin/

# Setup git
echo "Setting up git"
git config --global user.name "Rongzhou Shen"
git config --global user.email "anticlockwise5@gmail.com"
