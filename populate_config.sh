#!/bin/bash

CONFIG_DIR=~/.config 

NVIM_CONFIG=$CONFIG_DIR/nvim
FISH_CONFIG=$CONFIG_DIR/fish
KITTY_CONFIG=$CONFIG_DIR/kitty
STARSHIP_CONFIG=$CONFIG_DIR/starship.toml
GIT_CONFIG=~/.gitconfig


rm -rf $NVIM_CONFIG
cp -r neovim $NVIM_CONFIG

rm -rf $FISH_CONFIG
cp -r fish $FISH_CONFIG

rm -rf $KITTY_CONFIG
cp -r  kitty $KITTY_CONFIG

cp git/gitconfig $GIT_CONFIG

cp starship/starship.toml $STARSHIP_CONFIG

