# ─────────────────────────────────────────────────────────────
# DETECT OS (macOS vs Ubuntu/Linux)
# ─────────────────────────────────────────────────────────────
OS="$(uname -s)"

# ─────────────────────────────────────────────────────────────
# PATH SETUP (Cross-platform)
# ─────────────────────────────────────────────────────────────

# Shared PATH
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Platform-specific
if [[ "$OS" == "Darwin" ]]; then
    # macOS Homebrew locations (ARM & Intel)
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    export PATH="/usr/local/opt/icu4c/bin:/usr/local/opt/icu4c/sbin:$PATH"
else
    # Linux/Ubuntu
    export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
fi

# Generic tools (public-safe placeholders)
export PATH="/opt/custom/bin:$PATH"
export PATH="/usr/local/terraform:$PATH"
export PATH="/usr/local/aws-cli:$PATH"

# Build flags (public-safe)
export LDFLAGS="-L/usr/local/opt/ilmbase/lib"
export CPPFLAGS="-I/usr/local/opt/ilmbase/include"
export PKG_CONFIG_PATH="/usr/local/opt/ilmbase/lib/pkgconfig"

# ─────────────────────────────────────────────────────────────
# OH-MY-ZSH
# ─────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"

# ─────────────────────────────────────────────────────────────
# TERMINAL COLORS / MAN PAGE COLORS
# ─────────────────────────────────────────────────────────────
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export CLICOLOR=1
export LANG=en_US.UTF-8

# ─────────────────────────────────────────────────────────────
# DEVOPS / CLOUD ENVIRONMENT (PUBLIC-SAFE)
# ─────────────────────────────────────────────────────────────
export AWS_PAGER=""
export AWS_DEFAULT_REGION="us-east-1"
export AWS_SDK_LOAD_CONFIG=1
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"
export GRANTED_QUIET=true
export ANSIBLE_STDOUT_CALLBACK=yaml

# ─────────────────────────────────────────────────────────────
# PROMPT (PUBLIC-SAFE)
# ─────────────────────────────────────────────────────────────
# Replace with your own oh-my-posh theme file
eval "$(oh-my-posh --init --shell zsh --config ~/.config/oh-my-posh/theme.json)"

# ─────────────────────────────────────────────────────────────
# OH-MY-ZSH SETTINGS
# ─────────────────────────────────────────────────────────────
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
export UPDATE_ZSH_DAYS=30

# ─────────────────────────────────────────────────────────────
# PLUGINS
# ─────────────────────────────────────────────────────────────
plugins=(
  ansible
  aws
  docker
  git
  terraform
  kubectl
  vscode
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
)

autoload -Uz compinit && compinit

# fzf-tab (cross-platform safe)
source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.zsh

source $ZSH/oh-my-zsh.sh

# AWS zsh completion (cross-platform safe if installed)
if [[ -f /usr/local/share/zsh/site-functions/aws_zsh_completer.sh ]]; then
  source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh
fi

# ─────────────────────────────────────────────────────────────
# EDITOR CONFIG (cross-platform)
# ─────────────────────────────────────────────────────────────
if [[ -n "$SSH_CONNECTION" ]]; then
    export EDITOR="nano"
else
    export EDITOR="vim"
fi

export K9S_EDITOR="vim"

# ─────────────────────────────────────────────────────────────
# ALIASES (cross-platform safe)
# ─────────────────────────────────────────────────────────────
alias python="python3"
alias pip="pip3"
alias reload="source ~/.zshrc"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias public_ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias local_ip="hostname -I | awk '{print $1}'"
alias rm="rm -i"
alias ls="lsd"
alias lsh="lsd -ld .??*"
alias cat="ccat"
alias memory_status="top -l 1 -s 0 | grep PhysMem 2>/dev/null || free -h"
alias drop_rc="env -i zsh -f"
alias star_wars="{ sleep 1 ; echo starwars ; sleep 99999 ;} | nc -c telehack.com 23"

# macOS-only aliases
if [[ "$OS" == "Darwin" ]]; then
    alias dodo="pmset sleepnow"
    alias restartdock="killall -KILL Dock"
fi

# Linux-only aliases
if [[ "$OS" != "Darwin" ]]; then
    alias dodo="systemctl suspend"
fi

# ─────────────────────────────────────────────────────────────
# SSH HOST COMPLETION
# ─────────────────────────────────────────────────────────────
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts '
reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[# ]*}//,/ })
'

# ─────────────────────────────────────────────────────────────
# FUNCTIONS (public-safe)
# ─────────────────────────────────────────────────────────────
ff() { find . -iname "$1" 2>/dev/null; }

fif() {
	[[ $# -eq 1 ]] && grep -nr "$1" . --color || \
	s "$(grep -nr "$1" . | sed -n "$2"p | cut -d: -f-2)"
}

randompw() {
	local MAXSIZE=${1:-27}
	local chars=( {a..z} {A..Z} {0..9} \! \@ \$ \% \^ \& \* )
	for ((i=0;i<MAXSIZE;i++)); do printf "%s" "${chars[$RANDOM % ${#chars[@]}]}"; done
	echo
}

sha256sum() { openssl sha256 "$@" | awk '{print $2}'; }

list_aws_profiles() {
   grep '\[profile' ~/.aws/config | sed -n 's/\[profile \(.*\).*\]/\1/p'
}

current_aws_profile() {
  local p=$(aws configure list | awk '/profile/{print $2}')
  [[ "$p" == "<not" ]] && return
  echo "($p)"
}

set_aws_profile() { export AWS_PROFILE="$1"; }
drop_aws_profile() { unset AWS_PROFILE; }

aws_ec2_info() {
aws ec2 describe-instances \
    --filter Name=instance-state-name,Values=running \
    --query 'Reservations[].Instances[].{ID:InstanceId,Name:Tags[?Key==`Name`].Value|[0],Type:InstanceType,IP:PrivateIpAddress}' \
    --output table
}

aws_rds_info() {
aws rds describe-db-instances \
  --query 'DBInstances[*].{ID:DBInstanceIdentifier,Engine:Engine,Version:EngineVersion}' \
  --output table
}

extract() {
    [[ -f "$1" ]] || { echo "'$1' is not a valid file"; return; }
    case "$1" in
      *.tar.bz2|*.tbz2) tar xjf "$1" ;;
      *.tar.gz|*.tgz)  tar xzf "$1" ;;
      *.tar)           tar xf "$1" ;;
      *) echo "'$1' cannot be extracted";;
    esac
}

update_repos() {
for dir in */; do
  [[ -d "$dir/.git" ]] || continue
  echo "Updating: $dir"
  (cd "$dir" && git pull)
done
}

# ─────────────────────────────────────────────────────────────
# COMPLETION / TOOLING (cross-platform)
# ─────────────────────────────────────────────────────────────
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(op completion zsh)" 2>/dev/null
source <(kubectl completion zsh)
source <(helm completion zsh)
granted completion -s zsh >/dev/null 2>&1
eval "$(gh copilot alias -- zsh)"

# pyenv (cross-platform safe)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
