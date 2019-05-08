#!/bin/bash

BASEDIR="/personal/dotfile"

echo $BASEDIR

mkdir -p ~/.vim/bundle
[[ ! -s ~/.vim/bundle/neobundle.vim ]] && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir -p ~/.config/nvim
ln -s $BASEDIR/.bash_functions ~/.bash_functions
ln -s $BASEDIR/.bash_profile ~/.bash_profile
ln -s $BASEDIR/.bash_local ~/.bash_local
ln -s $BASEDIR/.gitconfig ~/.gitconfig
ln -s $BASEDIR/.slate ~/.slate
ln -s $BASEDIR/.vimrc ~/.vimrc
ln -s $BASEDIR/.vimrc ~/.config/nvim/init.vim
ln -s $BASEDIR/bash-git-prompt ~/.bash-git-prompt
ln -s $BASEDIR/.ant.properties ~/.ant.properties


defaults write com.apple.universalaccess slowKey -int 0 # Disable Slow Keys.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool FALSE # Disable Press-And-Hold for keys.
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # Set key repeat triggering delay to even shorter.
defaults write NSGlobalDomain KeyRepeat -int 3 # Set key repeat rate to even faster.

# if it's linux do the following
