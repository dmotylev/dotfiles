[ $# -ne 1 ] && return
[ -e $HOME/.slate.js -o -L $HOME/.slate.js ] && return

log_dotfiles "${CL_INFO}Instal slate config..."

ln -s $1/slate/slate.js $HOME/.slate.js
