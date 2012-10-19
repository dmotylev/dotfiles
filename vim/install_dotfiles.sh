[ $# -ne 1 ] && return

log_dotfiles "${CL_ERROR}Install Vim configuration..."

backup_dotfiles $HOME/.vim
backup_dotfiles $HOME/.vimrc
backup_dotfiles $HOME/.gvimrc

ln -s $1/vim $HOME/.vim
ln -s $1/vim/vimrc $HOME/.vimrc
ln -s $1/vim/gvimrc $HOME/.gvimrc