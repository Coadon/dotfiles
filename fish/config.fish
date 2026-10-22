eval "$(/opt/homebrew/bin/brew shellenv)"

alias clawstop='pkill -f "openclaw-gateway"'

alias  l='eza -l -a'
alias ll='eza -g -l --group-directories-first --header'
alias lg='eza -g -l --group-directories-first --git --git-ignore'
alias le='eza -g -l --group-directories-first --extended'
alias lt='eza -g -l --group-directories-first --tree --level 4'
alias lc='eza -g --group-directories-first --across'
alias lo='eza -g --group-directories-first --oneline'

set -x BUN_INSTALL "$HOME/.bun"
set -x -U GOPATH "$HOME/.go"
set -x DOTNET_ROOT "/usr/local/share/dotnet"

set -gx PATH $PATH "\
/usr/local/bin:\
$DOTNET_ROOT:\
$HOME/.go/bin:\
$HOME/.bun/bin:\
$HOME/.cargo/bin:\
$HOME/.npm-global/bin:\
/opt/homebrew/opt/binutils/bin:\
"

# OpenClaw Completion
source "/Users/rupert/.openclaw/completions/openclaw.fish"

set -x -U GPG_TTY (tty)
set -e SSH_AUTH_SOCK
set -x -U SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
