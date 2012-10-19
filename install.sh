#!/bin/sh
backup_dotfiles() {
	if [ -d $1.backup ]; then
		echo "Error: $1.backup exist"
		exit 1
	fi
	test -e $1 && mv $1 $1.backup
}

unpack_dotfiles() {
	if which git &> /dev/null; then
		if [ -d "$1/.git" ]; then
			cd $1 &> /dev/null
			git pull || exit 1
			cd - &> /dev/null
		else
			backup_dotfiles $1
			git clone https://bitbucket.org/dmotylev/dotfiles.git $1	
		fi
	else
		backup_dotfiles $1
		mkdir -p $1
		curl -s https://bitbucket.org/dmotylev/dotfiles/get/master.tar.gz | tar zxo --strip-components 1 -C $1 -
	fi
}

DOTFILES=${HOME}/.dotfiles

unpack_dotfiles ${DOTFILES}

MODULES="bash git vim LaunchAgents"
for m in ${MODULES}; do
	. $DOTFILES/$m/install_dotfiles.sh ${DOTFILES}
done