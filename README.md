![2024-11-20-200409_hyprshot](https://github.com/user-attachments/assets/1afbffe2-c006-440b-a362-a5b8e7f84de8)

# dotfiles

My config files for my Linux development environment (Arch Linux and Hyprland)

## Requirements
Ensure you have these packages on your system

You should have a basic Hyprland environment set up first before using these dotfiles (I recommend using the Hyprland desktop option in the archinstall script)

### Git (duh)

```bash
sudo pacman -S --needed base-devel git
```

### yay (AUR helper)
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
```

### Stow (automated symlinking)

```bash
sudo pacman -S stow
```

## Installation

First, install the programs configured in these dotfiles

```bash
sudo pacman -S install neovim tmux zsh eza bat hyprland hyprshot dunst kitty dolphin wofi xdg-desktop-portal-hyprland qt5-wayland qt6-wayland polkit-kde-agent qt5ct grim slurp libnotify notify-osd python-gobject
# Fonts and icons
sudo pacman -S $(pacman -Ssq noto-fons)
sudo pacman -S ttf-hack kvantum breeze-icons breeze
yay -S ttf-jetbrains-mono-nerd qt6ct-kde
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && rm -rf ~/.oh-my-zsh
```

Afterwards, clone this repo to your $HOME directory and cd into the cloned repo (make sure to setup SSH first)

```bash
git clone git@github.com:dioxair/dotfiles.git $HOME/dotfiles --recursive
cd ~/dotfiles
```

Then, use stow to create symlinks

```bash
stow . --adopt && git restore .
```

> **NOTE FOR NON-ARCH LINUX USERS**: I use JetBrainsMono Nerd Font for Kitty. To install JetBrainsMono Nerd Font userwide, [download and extract](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip) the .zip file with all of the fonts to `~/.local/share/fonts` (you may have to create the directory)

## Image credits
[bg1.jpg](https://www.pixiv.net/en/artworks/115001263) made by [furi / ふーり](https://www.pixiv.net/en/users/41736171)

[bg2.jpg](https://www.pixiv.net/en/artworks/118647339) and [bg3.jpg](https://www.pixiv.net/en/artworks/99144899) made by [縹 京介（ALPCMAS）](https://www.pixiv.net/en/users/2351667)

[github pfp.png](https://www.pixiv.net/en/artworks/113901165) and [another pfp.jpg](https://www.pixiv.net/en/artworks/113658699) made by [Rune Xiao](https://www.pixiv.net/en/users/44473246)
