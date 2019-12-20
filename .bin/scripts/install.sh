#! /bin/sh

# Get script's folder
# http://stackoverflow.com/a/246128
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "install packages"
packages=(
# general
"git"
"tmux"
"make"
# i3 window manager
"i3-wm"
# c++
"gcc"
"clang"
)

for package in "${packages[@]}"
do
  sudo apt install $package
  echo "---------------------------------------------------------"
done

echo "restore dotfiles"

echo "bash"

echo "git"
ln -sf "$DIR/.gitconfig" ~/.gitconfig
ln -sf "$DIR/.gitignore" ~/.gitignore
ln -sf "$DIR/.gitattributes" ~/.gitattributes

echo "tmux"
ln -sf "$DIR/.tmux.conf" ~/.tmux.conf

echo "ranger"
mkdir -p ~/.config/ranger
for file in $DIR/ranger/*; do
    ln -sf "$file" ~/.config/ranger/"${file##*/}"           # gives basename of file
done

echo "Vim"
ln -sf "$DIR/vim/.vimrc" ~/.vimrc
mkdir -p ~/.vim/colors
ln -sf "$DIR/vim/monokai.vim" ~/.vim/colors/monokai.vim


echo "---------------------------------------------------------"
echo "All done!"
echo "and change your terminal font to source code pro"
echo "Cheers"
echo "---------------------------------------------------------"

exit 0
