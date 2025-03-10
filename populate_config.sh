#!/bin/bash

CONFIG_DIR=~/.config 

NVIM_CONFIG=$CONFIG_DIR/nvim
FISH_CONFIG=$CONFIG_DIR/fish
KITTY_CONFIG=$CONFIG_DIR/kitty
STARSHIP_CONFIG=$CONFIG_DIR/starship.toml
GIT_CONFIG=~/.gitconfig
TMUX_CONFIG=~/.tmux.conf
TMUX_POWERLINE_CONFIG=$CONFIG_DIR/tmux-powerline


rm -rf $NVIM_CONFIG
cp -r neovim $NVIM_CONFIG

rm -rf $FISH_CONFIG
cp -r fish $FISH_CONFIG

rm -rf $KITTY_CONFIG
cp -r  kitty $KITTY_CONFIG

rm -rf $TMUX_CONFIG
cp -r tmux/tmux.conf $TMUX_CONFIG

rm -rf $TMUX_POWERLINE_CONFIG
cp -r tmux/tmux-powerline $TMUX_POWERLINE_CONFIG

cp git/gitconfig $GIT_CONFIG

cp starship/starship.toml $STARSHIP_CONFIG

