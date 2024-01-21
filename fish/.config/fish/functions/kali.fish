function kali --wraps=docker\ ps\ -a\ --format\ \'\{\{.Names\}\}\'\ \|\ grep\ \'kalibox\'\ \&\&\ docker\ start\ -i\ kalibox\ \|\|\ docker\ run\ -it\ --name=kalibox\ kalilinux/kali-rolling\ bash --description alias\ kali=docker\ ps\ -a\ --format\ \'\{\{.Names\}\}\'\ \|\ grep\ \'kalibox\'\ \&\&\ docker\ start\ -i\ kalibox\ \|\|\ docker\ run\ -it\ --name=kalibox\ kalilinux/kali-rolling\ bash
  docker ps -a --format '{{.Names}}' | grep 'kalibox' && docker start -i kalibox || docker run -it --name=kalibox kalilinux/kali-rolling bash $argv
        
end
