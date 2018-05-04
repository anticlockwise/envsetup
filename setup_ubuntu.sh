#!/usr/bin/env bash

# This script is designed to work only on an ubuntu box, so if you're trying to
# run it on a different linux distribution, it may fail badly!

set -e

release=`lsb_release -r | cut -f2`
if [ ! $release = "18.04" ]; then
    echo "Supported Ubuntu versions are: 18.04"
    exit 1
fi

echo "Ubuntu version: $release"

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
echo "* zsh antigen"
echo "* base16 colorschemes"

echo -n "Do you want to continue? [y/N] "
read answer

if [ $answer == "y" ]; then
    echo "Installation starting"
    echo "Please give me sudo permissions for your username."

    echo "Installing necessary ubuntu packages"

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

    echo "Installing VIM plugins"
    ./install_cmd_tools.sh

    echo "Installing NodeJS packages"
    ./install_nodejs_packages.sh

    echo "Installing other utilities"

    # Setup ZSH
    echo "Installing oh-my-zsh"
    curl -L http://install.ohmyz.sh | sh
    cp ./configs/zshrc ~/.zshrc

    echo "Setting up powerline fonts"
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir ~/.fonts/
    mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d/
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
else
    echo "Good bye!"
fi
