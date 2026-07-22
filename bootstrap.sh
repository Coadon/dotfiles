#!/bin/sh

echo "DANGER: MACOS BOOTSTRAP. MAY BE DESTRUCTIVE ON LINUX."

ln -sFhi $HOME/.dotfiles/nvim $HOME/.config/nvim
ln -sFhi $HOME/.dotfiles/fish $HOME/.config/fish
ln -sFhi $HOME/.dotfiles/ghostty $HOME/.config/ghostty
ln -sFhi $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sFhi $HOME/.dotfiles/clang-format $HOME/.clang-format
