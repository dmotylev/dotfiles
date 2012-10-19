#!/bin/sh
unpack_dotfiles() {
	if which git &> /dev/null; then
		git clone https://bitbucket.org/dmotylev/dotfiles.git $1	
	else
		mkdir -p $1
		curl -s https://bitbucket.org/dmotylev/dotfiles/get/master.tar.gz | tar zxo --strip-components 1 -C $1 -
	fi
}

DOTFILES=${HOME}/.dotfiles
#
# try to backup current setup
#
mv ${DOTFILES} ${DOTFILES}.backup

unpack_dotfiles ${DOTFILES}

MODULES="bash git vim LaunchAgents"
for m in ${MODULES}; do
	. $DOTFILES/$m/install_dotfiles.sh ${DOTFILES}
done