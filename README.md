# dotfiles

Configuration files for my development environment

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
sudo dnf install alacritty neovim tmux zsh eza bat
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && rm -rf ~/.oh-my-zsh # Oh My Zsh
```

Afterwards, clone this repo to your $HOME directory and cd into the cloned repo (make sure to setup SSH first)

```bash
git clone git@github.com:dioxair/dotfiles.git $HOME/dotfiles --recursive
cd ~/dotfiles
```

Then, use stow to create symlinks (.zshrc is deleted to prevent stow conflicts)

```bash
rm ~/.zshrc && stow .
```

> NOTE: I use JetBrainsMono Nerd Font for Alacritty. To install JetBrainsMono Nerd Font userwide, [download and extract](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip) the .zip file with all of the fonts to `~/.local/share/fonts` (you may have to create the directory)

## Image credits
[bg1.jpg](https://www.pixiv.net/en/artworks/115001263) made by [furi / ふーり](https://www.pixiv.net/en/users/41736171)
[github pfp.png](https://www.pixiv.net/en/artworks/113901165) and [another pfp.jpg](https://www.pixiv.net/en/artworks/113658699) by [Rune Xiao](https://www.pixiv.net/en/users/44473246)
