# dotfiles

Configuration files for my development environment (Fedora Linux)

## Requirements
Ensure you have these packages on your system for cloning and symlinking dotfiles

### Git (duh)

```bash
sudo dnf install git
```

### Stow (automated symlinking)

```bash
sudo dnf install stow
```

## Installation

First, install the programs configured in these dotfiles

```bash
sudo dnf install alacritty neovim tmux zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && rm -rf ~/.oh-my-zsh # Oh My Zsh
```

Afterwards, clone this repo to your $HOME directory and cd into the cloned repo

```bash
git clone git@github.com:dioxair/dotfiles.git $HOME/dotfiles --recursive
cd dotfiles
```

Then, use stow to create symlinks

```bash
stow .
```
