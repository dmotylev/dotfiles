[ $# -ne 1 ] && return

echo Install bash profile...

backup_dotfiles $HOME/.bash
backup_dotfiles $HOME/.bash_profile

ln -s $1/bash $HOME/.bash
ln -s $1/bash/profile $HOME/.bash_profile