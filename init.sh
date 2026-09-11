# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


CONFIG_DIR="${0:A:h}/.config"

# Load modules
source "$CONFIG_DIR/omz.zsh"
source "$CONFIG_DIR/zinit.zsh"
source "$CONFIG_DIR/aliases.zsh"

# Load tracked Powerlevel10k configuration
[[ ! -f "$CONFIG_DIR/p10k.zsh" ]] || source "$CONFIG_DIR/p10k.zsh"
