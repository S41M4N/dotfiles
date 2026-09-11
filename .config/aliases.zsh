# =============================================================================
# Shell & Configuration
# =============================================================================
alias reload="source ~/.zshrc"

# =============================================================================
# Directory Navigation
# =============================================================================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias bd="cd -"                          # Quick jump to previous directory

# =============================================================================
# File & Directory Listings (Colorized)
# =============================================================================
alias ls="ls --color=auto"
alias ll="ls -alF"                        # Detailed list with hidden files
alias la="ls -A"                          # List all except . and ..
alias l="ls -CF"

# =============================================================================
# Safety & Convenience
# =============================================================================
alias cp="cp -i"                          # Confirm before overwriting
alias mv="mv -i"                          # Confirm before overwriting
alias rm="rm -i"                          # Confirm before deleting
alias mkdir="mkdir -p"                    # Auto-create parent folders if missing

# =============================================================================
# Utilities & System Info
# =============================================================================
alias c="clear"
alias h="history"
alias myip="curl -s https://icanhazip.com" # Display public IP
