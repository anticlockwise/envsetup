#!/usr/bin/env bash

# This script is designed to work only on an ubuntu box, so if you're trying to
# run it on a different linux distribution, it may fail badly!

echo "Starting to setup your ubuntu"
echo "This setup script will install the following on your ubuntu:"
echo "List of ubuntu packages:"
echo "* awesome"
echo "* mutt"
echo "* moc"
echo "* weechat"
echo "* bitlbee"
echo "* vim"
echo "* tmux"
echo "* imagemagick"
echo "* graphviz"
echo "* urlscan"
echo "* python-pip"
echo "* exuberant-ctags"

echo "List of Python packages:"
echo "* powerline-status"
echo "* psutil"
echo "* jedi"
echo "* virtualenv"

echo "List of vim plugins:"
echo "* pathogen"
echo "* bufexplorer"
echo "* indentLine"
echo "* snipmate"
echo "* delimitmate"
echo "* supertab"
echo "* syntastic"
echo "* easymotion"
echo "* vim-surround"
echo "* vim-virtualenv"
echo "* NERDTree"
echo "* NERDCommenter"
echo "* Fugitive"
echo "* vim-airline"
echo "* ctrlp"
echo "* matchit"
echo "* tagbar"
echo "* tabularize"
echo "* python-mode"
echo "* jedi-vim"

echo "List of other utilities:"
echo "* oh-my-zsh"
echo "* solarized colorschemes"

echo -n "Do you want to continue? [y/N] "
read answer

if [ $answer == "y" ]; then
    echo "Installation starting"
    echo "Please give me sudo permissions for your username."

    echo "Installing necessary ubuntu packages"
    sudo add-apt-repository -y ppa:klaus-vormweg/awesome
    sudo apt-get -y -qq update
    sudo apt-get install -y -qq awesome
    sudo apt-get install -y -qq mutt
    sudo apt-get install -y -qq moc
    sudo apt-get install -y -qq weechat
    sudo apt-get install -y -qq bitlbee
    sudo apt-get install -y -qq vim
    sudo apt-get install -y -qq tmux
    sudo apt-get install -y -qq imagemagick
    sudo apt-get install -y -qq graphviz
    sudo apt-get install -y -qq urlscan
    sudo apt-get install -y -qq python-pip
    sudo apt-get install -y -qq exuberant-ctags

    echo "Installing necessary Python packages"
    pip install --user powerline-status
    pip install --user mako
    pip install --user psutil
    pip install --user docutils
    pip install --user virtualenv
    pip install --user jedi

    export PATH="$HOME/.local/bin:$PATH"

    echo "Generating configurations"
    python generate_configs.py

    echo "Configuring awesome window manager"
    cp -r ./awesome ~/.config/awesome

    echo "Installing VIM plugins"

    ./install_vim_plugins.sh

    echo "Installing other utilities"

    # Setup ZSH
    echo "Installing oh-my-zsh"
    curl -L http://install.ohmyz.sh | sh
    cp ./configs/zshrc ~/.zshrc

    echo "Cloning solarized colorscheme"
    git clone git://github.com/altercation/solarized.git

    echo "Setting up mutt with solarized colorscheme"
    mkdir $HOME/.mutt
    cp ./configs/muttrc $HOME/.muttrc
    chmod 644 $HOME/.muttrc
    cp solarized/mutt-colors-solarized/mutt-colors-solarized-dark-256.muttrc $HOME/.mutt/

    echo "Setting up tmux"
    cp configs/tmux.conf $HOME/.tmux.conf

    echo "Installing extra powerline segments"
    pip install --user ./powerline_extras

    echo "============ INSTALLATION COMPLETED =============="
else
    echo "Good bye!"
fi
