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
pip install pyflakes
pip install pep8

# Setup Node packages
echo "Install necessary packages and tools for node"
npm install -g express
npm install -g cssmin
npm install -g jshint
npm install -g jslint
npm install -g uglify-js
npm install -g bower
npm install -g grunt-cli

# Setup Powerline
echo "Installing Powerline"
pip install git+git://github.com/Lokaltog/powerline

# Setup ZSH
echo "Installing oh-my-zsh"
curl -L http://install.ohmyz.sh | sh
cp ./zshrc ~/.zshrc

# Setup VIM
./install_vim_plugins

# Setup git
echo "Setting up git"
git config --global user.name "Rongzhou Shen"
git config --global user.email "anticlockwise5@gmail.com"
