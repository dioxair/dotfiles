# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

autoload -U promptinit; promptinit
autoload -U colors && colors
export PWD=/home/$USER
export OLDPWD=/home/$USER
export BAT_THEME="Visual Studio Dark+"

export KEYTIMEOUT=1
export ZSH=/home/$USER/.oh-my-zsh
export ZSH_CUSTOM=/home/$USER/.oh-my-zsh/custom/plugins

# Load Version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats "%b"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"

setopt prompt_subst
PROMPT="%F{011}%~ %F{060}%n@%m%F{010}"$'\n'"? %f"
RPROMPT='%F{060}${vcs_info_msg_0_}`git_prompt_status 2</dev/null`'

#ZSH_THEME=random
#ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "crunch" "fino-time" "funky" "jonathan" "junkfood" )

source $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
HIST_STAMPS="dd/mm/yyyy"
compinit
_comp_options+=(globdots) # lets you tab complete hidden files by default

plugins=(
  git
  npm
  zsh-autosuggestions
  vi-mode
  zsh-syntax-highlighting
)
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

function git-config-sam() {
  git init
  git config user.name "Samuel Olagunju"
  git config user.email "94651716+samuelolagunju@users.noreply.github.com"
}

function add-ssh-sam() {
  eval `ssh-agent -s`
  ssh-add -D
  ssh-add ~/.ssh/id_sam
}

##############################################################
#        Aliases! (Holy cow, there's a lot of these!)
##############################################################
alias nvim=/home/$USER/.local/bin/lvim
alias goto-deadend=/run/media/$USER/DEADEND/
alias mount-deadend="sudo mount -o user,umask=000,utf8,noauto -L DEADEND /run/media/samuel/DEADEND/"
alias ls="exa -l"
alias cat="bat"
# Rust
alias cb="cargo build"
alias cbr="cargo build --release"
alias cr="cargo run"
alias cs="cargo search"
alias crr="cargo run --release"
alias cls="clear"
# NixOS
alias nxc="sudo nvim /etc/nixos/configuration.nix" # Edit NixOS config
alias nxgb="sudo nix-collect-garbage -d" # Remove old boot entries in Grub
alias nxr="sudo nixos-rebuild switch" # Build from NixOS config
function nxs() {
  local cache_file=~/.cache/nix/nix-env-qaP

  if [[ "$1" =~ ^--?c(ache)?$ ]]; then
    mkdir -p $(dirname $cache_file)
    echo -n "Caching packages.."
    nix-env -qaP '*' >$cache_file
    echo " 🏁"
  else
    grep -iE "$1" $cache_file
  fi
} # Search for Nix packages
alias killalljobs="kill ${${(v)jobstates##*:*:}%=*}"
##############################################################

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/home/$USER/.deta/bin:$PATH"
export PATH="/home/$USER/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH=~/.npm-packages/bin:$PATH
export PATH="/home/samuel/.detaspace/bin:$PATH"
export NODE_PATH=~/.npm-packages/lib/node_modules
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
