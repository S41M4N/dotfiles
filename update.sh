#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

echo "Updating dotfiles..."

if [ ! -d "$DOTFILES_DIR/.git" ]; then
    echo "Error: $DOTFILES_DIR is not a git repository."
    exit 1
fi

cd "$DOTFILES_DIR" || exit 1

# Pull latest dotfile changes
echo "Pulling latest dotfiles configuration..."
git pull --rebase origin main

# Update Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Updating Oh My Zsh..."
    git -C "$HOME/.oh-my-zsh" pull --quiet
fi

# Update Powerlevel10k
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ -d "$P10K_DIR" ]; then
    echo "Updating Powerlevel10k..."
    git -C "$P10K_DIR" pull --quiet
fi

# Update Zinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ -d "$ZINIT_HOME" ]; then
    echo "Updating Zinit..."
    git -C "$ZINIT_HOME" pull --quiet
fi

echo "Dotfiles and dependencies updated successfully!"
echo "Reloading Zsh configuration..."

# Reload shell configuration
exec zsh