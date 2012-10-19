[ $# -ne 1 ] && return
[ -f $HOME/.gitconfig ] && return
ln -s $1/git/gitconfig $HOME/.gitconfig