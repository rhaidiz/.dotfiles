function light --wraps='yes | fish_config theme save Solarized\\ Light' --description 'alias light=yes | fish_config theme save Solarized\\ Light'
    yes | fish_config theme save Solarized\ Light $argv
end
