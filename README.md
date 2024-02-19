# dotfiles

Configuration files for my development environment (Fedora Linux)

## Requirements

Ensure you have these packages on your system for cloning and symlinking dotfiles

### Git (duh)

```
sudo dnf install git
```

### Stow (automated symlinking)

```
sudo dnf install stow
```

## Installation

First, install the programs configured in these dotfiles

```bash
sudo dnf install alacritty neovim tmux zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # Oh My Zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # Tmux Plugin Manager
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 # NvChad
```

Afterwards, clone this repo to your $HOME directory and cd into the cloned repo

```
git clone https://github.com/dioxair/dotfiles.git $HOME/dotfiles
cd dotfiles
```

Then, use stow to create symlinks

```
stow .
```
