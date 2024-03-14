# dotfiles

Configuration files for my development environment

## Requirements
Ensure you have these packages on your system for cloning and symlinking dotfiles

### Git (duh)

```bash
sudo pacman -S git
```

### Stow (automated symlinking)

```bash
sudo pacman -S stow
```

## Installation

First, install the programs configured in these dotfiles

```bash
sudo pacman -S alacritty neovim tmux zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && rm -rf ~/.oh-my-zsh # Oh My Zsh
```

Afterwards, clone this repo to your $HOME directory and cd into the cloned repo (make sure to setup SSH first)

```bash
git clone git@github.com:dioxair/dotfiles.git $HOME/dotfiles --recursive
cd ~/dotfiles
```

Then, use stow to create symlinks

```bash
stow .
```
