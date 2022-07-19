#!/usr/bin/env bash
# Purpose: Install required packages
#          Must run as root
# Author: MrQianjinsi
# --------------------------------------

# ranger preview file
#ranger_related = ('caca-utils',  # img2txt preview images
#          'atool', # tarball metainfo
#          'w3m', # html
#          'mediainfo', # prview mediafile metainfo
#          'highlight', # code
#          'pdftotext', # pdf
#          'transmission-show', # bit-torrent metainfo
#          'catdoc', # .doc 
#          'docx2txt', # .docx 
#          'xlsx2csv', # .xlsx
#          'xls2csv', # .xls
#          'unrar', # .rar
#          'xsel', # filename copy and paste
#          'autojump' # jump between directory
#          )
#
## vim style application
#vim_style = ('sxiv', # image brownser
#             'zathura' # pdfviewer
#)
#
## i3 related
#i3_related = ('i3',
#              'feh', # wallpaper
#              'x11-xserver-utils', # command version moniter manager
#              'arandr', # gui moniter manager
#              'x11-utils', # xprop, xev
#              'i3blocks', # i3 status bar
#              'scrot', # screenshoot
#              'pactrl', # system volume control
#              'playerctl', # switch music
#              'paucontrol', # system voluem setup
#              'blueman-applet', # bluetooth applet
#              'nm-applet', # network manager applet
#              'xautolock', # auto screenlock
#)
#
## system themes
## lxappreance
#
## utils
#dev = ( 'silversearcher-ag', # fuzzy searcher
#)
#
## python related packages
#echo "install python related packages"
## curl https://pyenv.run | bash
#
## thinkpad x1 special keys

# arc themes
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get install arc-theme
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get install arc-icons

# setup theme
sudo apt install lxappearance

# font awesome
sudo apt-get install -y fonts-font-awesome

# node
echo "install node"
curl -sL install-node.vercel.app/lts | bash

# neovim related
echo "install neovim related packages"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c "PlugInstall" -c "qa"

