brew_prefix=$(brew --prefix)
if [ $? -eq 0 -a -f ${brew_prefix}/etc/bash_completion ]; then
	. ${brew_prefix}/etc/bash_completion
fi
if [ -f ${brew_prefix}/share/bash-completion/bash_completion ]; then
	. ${brew_prefix}/share/bash-completion/bash_completion
fi
