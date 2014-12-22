#!/usr/bin/env bash

# This script is designed to work only on an ubuntu box, so if you're trying to
# run it on a different linux distribution, it may fail badly!

echo "Starting to setup your ubuntu"
echo "This setup script will install the following on your ubuntu:"
echo "List of ubuntu packages:"
for package in `cat ubuntu_packages`; do
    echo "* $package"
done

echo "List of Python packages:"
for package in `cat python_packages`; do
    echo "* $package"
done

echo "List of vim plugins:"
for plugin in `cat vim_plugins`; do
    echo "* $plugin"
done

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

    for package in `cat ubuntu_packages`; do
        echo "Installing $package"
        sudo apt-get install -y -qq $package
    done

    echo "Installing necessary Python packages"
    for package in `cat python_packages`; do
        echo "Installing $package"
        pip install --user $package
    done

    export PATH="$HOME/.local/bin:$PATH"

    echo "Generating configurations"
    python generate_configs.py

    echo "Configuring awesome window manager"
    cp -r ./awesome ~/.config/awesome

    echo "Installing VIM plugins"
    ./install_vim_plugins.sh

    echo "Installing NodeJS packages"
    ./install_nodejs_plugins.sh

    echo "Installing other utilities"

    # Setup ZSH
    echo "Installing oh-my-zsh"
    curl -L http://install.ohmyz.sh | sh
    cp ./configs/zshrc ~/.zshrc

    echo "Cloning solarized colorscheme"
    git clone git://github.com/altercation/solarized.git

    echo "Setting up powerline"
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir ~/.fonts/
    mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d/
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    cp -r configs/powerline ~/.config/powerline

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
    echo "NOTE: Weechat and Bitlbee are not set up yet, those will require manual configuration, please refer to their corresponding documentation for setups."
    echo "Please logout and log back in to see changes"
else
    echo "Good bye!"
fi
