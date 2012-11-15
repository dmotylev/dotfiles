check() {
	if [ $# -ne 1 -o -z "$1" ]; then
		return 1
	fi
	f="target/reports/junit/TEST-$1.txt"
	if [ ! -f $f ]; then
		return 2
	fi
	cat $f | grcat conf.check | less -RS
}

_check ()
{
	COMPREPLY=( $(compgen -W "$(ls target/reports/junit | sed -e 's#TEST-\(.*\)\.txt#\1#')" -- ${COMP_WORDS[COMP_CWORD]}) )
}

complete -F _check check
