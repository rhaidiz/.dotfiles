if status is-interactive; and set -q SSH_CONNECTION
	tmux new-session -A -s main
end

# disable fish greeting
set fish_greeting

set -x HOMEBREW_NO_AUTO_UPDATE 1
starship init fish | source

