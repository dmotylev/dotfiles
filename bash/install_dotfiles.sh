[ $# -ne 1] && return
mv $HOME/.bash $HOME/.bash.backup
mv $HOME/.bash_profile $HOME/.bash_profile.backup
ln -s $1/bash $HOME/.bash
ln -s $1/bash/profile $HOME/.bash_profile