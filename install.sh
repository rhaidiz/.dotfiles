#!/bin/bash
stow_foler=(nvim fish tmux starship alacritty)

for f in "${stow_foler[@]}"
do
  stow -D $f
  stow $f 
done
