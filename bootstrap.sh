#!/bin/sh

echo "DANGER: BOOTSTRAP"

# Detect the Operating System
OS_TYPE=$(uname -s)

if [ "$OS_TYPE" = "Darwin" ]; then

    ln -sFhi $HOME/.dotfiles/nvim $HOME/.config/nvim
    ln -sFhi $HOME/.dotfiles/fish $HOME/.config/fish
    ln -sFhi $HOME/.dotfiles/ghostty $HOME/.config/ghostty
    ln -sFhi $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
    ln -sFhi $HOME/.dotfiles/clang-format $HOME/.clang-format

elif [ "$OS_TYPE" = "Linux" ]; then

    mkdir .config
    ln -sfn $0/../tmux.conf $HOME/.tmux.conf
    ln -sfn $0/../fish $HOME/.config/fish

else
    echo "Unknown Operating System: $OS_TYPE"
fi
