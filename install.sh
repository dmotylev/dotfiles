#!/bin/sh
unpack_dotfiles() {
	if which git &> /dev/null; then
		git clone https://bitbucket.org/dmotylev/dotfiles.git $1	
	else
		mkdir -p $1
		curl -s https://bitbucket.org/dmotylev/dotfiles/get/master.tar.gz | tar zxo --strip-components 1 -C $1 -
	fi
}

DOTFILES=${HOME}/.dotfiles2

mv ${DOTFILES} ${DOTFILES}.backup
unpack_dotfiles ${DOTFILES}

. $DOTFILES/bash/install_dotfiles.sh ${DOTFILES}


#####
# cleaning up...
#
#cd -
#rm -fr $TMPDIR

#DOTFILES=.dotfiles
#cd $HOME

#ln -s $DOTFILES/gitconfig .gitconfig

#ln -s $DOTFILES/vim .vim
#ln -s $DOTFILES/vim/vimrc .vimrc
#ln -s $DOTFILES/vim/gvimrc .gvimrc

#ln -s $DOTFILES/bash .bash
#ln -s $DOTFILES/bash/profile .bash_profile

#cd $DOTFILES
