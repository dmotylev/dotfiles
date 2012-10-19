[ $# -ne 1 ] && return
[ -f $HOME/.gitconfig ] && return

echo Install git config...

ln -s $1/git/gitconfig $HOME/.gitconfig