# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"

alias c=clear
alias gdelb="bash ~/scripts/delete.sh"
alias gauall="git stash && git add . && git stash pop"
alias mc=~/micro
alias kitty-reload='[[ -n "$KITTY_PID" ]] && sudo kill -SIGUSR1 "$KITTY_PID"'
alias dup="docker compose up -d"
alias dcdown="docker compose down"
alias dupb="docker compose up -d --build"

# it will only work on ESAUDE project 
ptest() {
    local PROCS="$1"
    shift
    docker exec esaude_php ./vendor/bin/paratest --processes "$PROCS" "$@"
}

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh-background-notify/bgnotify.plugin.zsh

autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST

PROMPT='[%n@%m %1~]%F{green}(${vcs_info_msg_0_})%F{white}$ '

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/arturfonseca/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# terminal-error-sounds
source "$HOME/.terminal-error-sounds/zsh.sh"
