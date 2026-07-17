eval "$(/opt/homebrew/bin/brew shellenv)"

set -x -U GPG_TTY (tty)
set -x -U GOPATH "$HOME/.go"

set -e SSH_AUTH_SOCK
set -x -U SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# bun
set --export BUN_INSTALL "$HOME/.bun"

set -gx PATH "\
/usr/local/bin:\
$HOME/.npm-global/bin:\
$HOME/.cargo/bin:\
$HOME/.local/bin:\
$HOME/.emacs.d/bin:\
$GOPATH/bin:\
$BUN_INSTALL/bin:\
/opt/homebrew/opt/binutils/bin:\
/Users/rupert/Library/Python/3.9/bin:\
" $PATH

alias l='eza -l -a'
alias ll='eza -g -h --group-directories-first -l'
alias lg='eza -g -h --group-directories-first -l --git --git-ignore'
alias le='eza -g -h --group-directories-first -l --extended'
alias lt='eza -g -h --group-directories-first --tree --level 4'
alias lc='eza -g -h --group-directories-first --across'
alias lo='eza -g -h --group-directories-first --oneline'
alias clawstop='pkill -f "openclaw-gateway"'

# OpenClaw Completion
source "/Users/rupert/.openclaw/completions/openclaw.fish"
