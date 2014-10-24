brew_prefix=$(brew --prefix)
if [ $? -eq 0 -a -f ${brew_prefix}/etc/bash_completion ]; then
	. ${brew_prefix}/etc/bash_completion
fi