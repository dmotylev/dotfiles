[ $# -ne 1 ] && return

log_dotfiles "${CL_INFO}Install grc color profiles..."

backup_dotfiles $HOME/.grc

ln -s $1/grc/profiles $HOME/.grc
