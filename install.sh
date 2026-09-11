#!/bin/bash

echo "Starting setup..."

# Check if Zsh is installed
if ! command -v zsh &> /dev/null && [ ! -x "/usr/bin/zsh" ] && [ ! -x "/bin/zsh" ]; then
    echo "Error: zsh is not installed. Please install zsh first and run this script again."
    exit 1
fi

DOTFILES_DIR="$HOME/.dotfiles"
ZSHRC_FILE="$HOME/.zshrc"
SOURCE_CMD="source \"$DOTFILES_DIR/init.sh\""

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository to ~/.dotfiles..."
    git clone https://github.com/S41M4N/dotfiles.git "$DOTFILES_DIR"
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Cloning Oh My Zsh..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
else
    echo "Oh My Zsh is already installed. Skipping..."
fi

# Change the default shell to zsh if it isn't already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to Zsh. You may be prompted for your password."
    sudo chsh -s $(which zsh)
fi

# Install powerlevel10k
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo "Cloning Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
    echo "Powerlevel10k is already installed. Skipping..."
fi

# Install Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    echo "Cloning Zinit..."
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
else
    echo "Zinit is already installed. Skipping..."
fi

# Configure .zshrc
if [ ! -f "$ZSHRC_FILE" ]; then
    echo "No ~/.zshrc found. Creating one..."
    echo "$SOURCE_CMD" > "$ZSHRC_FILE"
elif ! grep -q "$DOTFILES_DIR/init.sh" "$ZSHRC_FILE"; then
    echo "Prepending configuration to top of ~/.zshrc..."
    { echo "$SOURCE_CMD"; echo ""; cat "$ZSHRC_FILE"; } > "$ZSHRC_FILE.tmp" && mv "$ZSHRC_FILE.tmp" "$ZSHRC_FILE"
else
    echo "Configuration already linked in ~/.zshrc. Skipping..."
fi

echo ""
echo "Setup completed successfully."

exec zsh
