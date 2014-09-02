#!/bin/bash
MFA_HOME=$HOME/.mfa

function mfa {
	[[ "$1" == "x" ]] && {
		echo "usage: mfa <profile>"
		return 1
	}
	read -s -p Password: passwd
	local totpkey=$(gpg --passphrase $passwd --batch --quiet -d $MFA_HOME/$1.mfa.asc 2> /dev/null)
	[[ -z "$totpkey" ]] && {
		echo $(tput dl1)$(tput hpa 0)"no totp key"
		return 1
	}
	local otp=$(oathtool --totp --b $totpkey)
	echo $otp | pbcopy
	echo $(tput dl1)$(tput hpa 0)$otp" (in clipboard)"
}

function _mfadevices {
	local profiles=$(find $MFA_HOME -name \*.mfa.asc -exec basename {} ';' | sed -E 's/^(.*)\.mfa\.asc/\1/')
	local cur=${COMP_WORDS[COMP_CWORD]}
	[ $COMP_CWORD -eq 1 ] && COMPREPLY=($(compgen -W $profiles -- $cur))
}

complete -F _mfadevices mfa
