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

## Image credits
[bg1.jpg](https://www.pixiv.net/en/artworks/95815717) made by [Rune Xiao](https://www.pixiv.net/en/users/44473246)

[bg2.jpg](https://www.pixiv.net/en/artworks/115001263) made by [furi / ふーり](https://www.pixiv.net/en/users/41736171)
