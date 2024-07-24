if status is-interactive; and set -q SSH_CONNECTION; and not set -q TMUX
  tmux new-session -A -s (hostname)
else
  pyenv init - | source
end

# disable fish greeting
set fish_greeting

set -x HOMEBREW_NO_AUTO_UPDATE 1
# starship init fish | source

