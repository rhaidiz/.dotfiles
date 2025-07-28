function ll --wraps=ls --wraps='ls -la' --description 'alias ll=ls -la'
  ls -lah $argv; 
end
