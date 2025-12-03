function dark --wraps='yes | fish_config theme save Solarized\\ Dark' --description 'alias dark=yes | fish_config theme save Solarized\\ Dark'
    yes | fish_config theme save Solarized\ Dark $argv
end
