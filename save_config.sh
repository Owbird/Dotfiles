#!/bin/bash
CONFIG_DIR=~/.config 
NVIM_CONFIG=$CONFIG_DIR/nvim
FISH_CONFIG=$CONFIG_DIR/fish
KITTY_CONFIG=$CONFIG_DIR/kitty
STARSHIP_CONFIG=$CONFIG_DIR/starship.toml
GIT_CONFIG=~/.gitconfig
TMUX_CONFIG=~/.tmux.conf
TMUX_POWERLINE_CONFIG=$CONFIG_DIR/tmux-powerline

rm -rf neovim
cp -r $NVIM_CONFIG neovim
rm -rf fish
cp -r $FISH_CONFIG fish
rm -rf kitty
cp -r $KITTY_CONFIG kitty
rm -rf tmux
mkdir -p tmux
cp $TMUX_CONFIG tmux/tmux.conf
cp -r $TMUX_POWERLINE_CONFIG tmux/tmux-powerline
rm -rf git
mkdir -p git
cp $GIT_CONFIG git/gitconfig
rm -rf starship
mkdir -p starship
cp $STARSHIP_CONFIG starship/starship.toml
