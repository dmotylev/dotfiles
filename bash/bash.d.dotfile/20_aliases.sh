alias git=hub
alias ..='cd ..'
alias -- -="cd -"
alias g='egrep'
alias gam='python /usr/local/gam/gam.py'
alias ldapsearch='ldapsearch -y ~/.ldapsearch -H ldaps://ldap.2reallife.net:636 -D "uid=dmotylev,ou=Users,dc=2reallife,dc=net"'
alias rfm='mpc clear && mpc add "http://mp3lg4.tdf-cdn.com/9915/rfm_122021.mp3" && mpc play'
alias t='todo.sh'
complete -F _todo t
