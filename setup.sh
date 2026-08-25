#!/bin/bash

BASEDIR=$( cd "$( dirname "$0" )" && pwd )

echo $BASEDIR

ln -s $BASEDIR/zsh/zshrc ~/.zshrc
ln -s $BASEDIR/zsh/zsh_alias ~/.zsh_alias
ln -s $BASEDIR/zsh/zsh_functions ~/.zsh_functions
mkdir ~/.hammerspoon
ln -s $BASEDIR/.hammerspoon/init.lua ~/.hammerspoon/init.lua
ln -s $BASEDIR/.hammerspoon/window_management.lua ~/.hammerspoon/window_management.lua
ln -s $BASEDIR/vim/vimrc ~/.vimrc
ln -s $BASEDIR/vim/vimrc.plugins ~/.vimrc.plugins
ln -s $BASEDIR/vim/xvimrc ~/.xvimrc
ln -s $BASEDIR/git/gitconfig ~/.gitconfig
# ln -s $BASEDIR/tmux/tmux.config ~/.tmux.config

# oh-my-zsh custom theme (must go under custom/ so omz updates don't clobber it)
mkdir -p ~/.oh-my-zsh/custom/themes
ln -sf $BASEDIR/zsh/intheloop.zsh-theme ~/.oh-my-zsh/custom/themes/intheloop.zsh-theme

# keyboard repeat rate.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write com.apple.Accessibility KeyRepeatDelay 0.166666666
defaults write com.apple.Accessibility KeyRepeatEnabled 1
defaults write com.apple.Accessibility KeyRepeatInterval 0.016666666
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
