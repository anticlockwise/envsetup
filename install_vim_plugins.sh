echo "Installing Pathogen for VIM"
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle

git clone https://github.com/tpope/vim-pathogen.git
cp ./vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
rm -rf ./vim-pathogen

echo "Downloading VIM bundles"

CUR_DIR=`pwd`
cd ~/.vim/bundle

for plugin in `cat vim_plugins`; do
    git clone $plugin
done

cd $CUR_DIR
cp ./configs/vimrc ~/.vimrc

mkdir -p ~/.vim/syntax
mkdir -p ~/.vim/ftplugin
cp ./vim/django.vim ~/.vim/syntax/
cp ./vim/htmldjango.vim ~/.vim/syntax/
cp ./vim/ftplugin_django.vim ~/.vim/ftplugin/
