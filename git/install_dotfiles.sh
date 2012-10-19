[ $# -ne 1 ] && return
[ -e $HOME/.gitconfig ] && return

log_dotfiles "${CL_INFO}Install git config..."

ln -s $1/git/gitconfig $HOME/.gitconfig