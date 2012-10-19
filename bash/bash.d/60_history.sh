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