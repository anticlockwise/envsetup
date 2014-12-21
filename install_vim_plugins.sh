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
cp ./configs/vimrc ~/.vimrc

mkdir -p ~/.vim/syntax
mkdir -p ~/.vim/ftplugin
cp ./vim/django.vim ~/.vim/syntax/
cp ./vim/htmldjango.vim ~/.vim/syntax/
cp ./vim/ftplugin_django.vim ~/.vim/ftplugin/
