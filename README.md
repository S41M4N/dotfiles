# Salman's Dotfiles

A modular Zsh configuration focused on speed and simplicity. It uses Zinit for plugin management, Powerlevel10k for the prompt, and core Oh My Zsh libraries.

## Requirements & Font Setup

Before installing, make sure your system has `zsh`, `git`, and `curl` installed.

### Installing the Required Font
Powerlevel10k requires a Nerd Font to render icons like arrows, git status, and OS logos correctly.

1. Download these **MesloLGS NF** font files:
   * [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
   * [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
   * [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
   * [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)
2. Double-click each downloaded file and click **Install**.
3. Open your terminal emulator settings (VS Code, Alacritty, iTerm2, Windows Terminal, etc.) and set the font family to **MesloLGS NF**.

---

## Repositories & Tools Used

* **Framework:** [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
* **Plugin Manager:** [Zinit](https://github.com/zdharma-continuum/zinit)
* **Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* **Plugins:**
  * [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) - Command syntax highlighting as you type.
  * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like command suggestions based on shell history.
  * [zsh-completions](https://github.com/zsh-users/zsh-completions) - Additional completion definitions for system commands.
  * [fzf-tab](https://github.com/Aloxaf/fzf-tab) - Replaces standard tab completion menus with interactive fzf filtering.

---

## Installation

### Automatic

Run this command directly in your terminal to automatically clone the repository to `~/.dotfiles` and configure dependencies:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/S41M4N/dotfiles/main/install.sh)"
```

### Manual
Run these commands in your terminal to set up on a new machine:

```bash
git clone https://github.com/S41M4N/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x setup.sh
./setup.sh
```

### What `install.sh` does:
1. Clones this repository to `~/.dotfiles` (if not already present).
2. Checks if `zsh` is installed on your system.
3. Clones Oh My Zsh, Powerlevel10k, and Zinit into their designated directories.
4. Prepends `source ~/.dotfiles/init.sh` to the top of your existing `~/.zshrc` without deleting existing configurations.
5. Sets `zsh` as your system default shell using `chsh`.

Close and reopen your terminal after setup finishes.