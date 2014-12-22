# This setup script will install and setup all necessary packages needed for
# my development environment. The list of packages are:
# 

echo "Starting development environment setup"

# Set up OSX Home Brew and brew packages
echo "Installing OSX Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing necessary Homebrew packages"
for package in `osx_packages`; do
    brew install $package
done

# Setup Python packages
export PATH="/usr/local/bin:$PATH"
echo "Installing necessary Python packages"
for package in `cat python_packages`; do
    echo "Installing $package"
    pip install $package
done

echo "Generating configurations"
python generate_configs.py

# Setup ZSH
echo "Installing oh-my-zsh"
curl -L http://install.ohmyz.sh | sh
cp ./configs/zshrc ~/.zshrc

echo "Setting up powerline"
cp -r configs/powerline ~/.config/powerline
echo "NOTE: Powerline fonts are not setup, please go to https://powerline.readthedocs.org/en/latest/installation/osx.html for installation of fonts on OSX"

# Setup VIM
./install_vim_plugins.sh
./install_nodejs_packages.sh
