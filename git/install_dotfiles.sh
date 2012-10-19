[ $# -ne 1 ] && return
[ -f $HOME/.gitconfig ] && return

log_dotfiles "${CL_ERROR}Install git config..."

ln -s $1/git/gitconfig $HOME/.gitconfig