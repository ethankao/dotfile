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


# keyboard repeat rate.
# sudo defaults write com.apple.universalaccess slowKey -int 0 # Disable Slow Keys.
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool FALSE # Disable Press-And-Hold for keys.
# defaults write NSGlobalDomain InitialKeyRepeat -int 10 # Set key repeat triggering delay to even shorter.
# defaults write NSGlobalDomain KeyRepeat -int 3 # Set key repeat rate to even faster.
