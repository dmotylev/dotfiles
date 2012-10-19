#!/bin/bash
export HISTCONTROL=erasedups:ignoreboth
export HISTSIZE=30000
export HISTIGNORE="rm ~/.bash_history:ls:l:la:ll:h:ls -l:ls -la:history:cd .:cd:cd ..:?:..:g:-:h"
export HISTTIMEFORMAT="%d.%m %H:%M  "
shopt -s histappend
_history() {
	if [ $# -eq 0 ]; then
		history
		return
	fi
	history | egrep $*
}
alias ?=_history

alias no_history='history -d $((HISTCMD-1))'
alias no_history_last='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'

no_history_range() {
	for i in $(seq $1 $2); do
		history -d $1
	done
}
