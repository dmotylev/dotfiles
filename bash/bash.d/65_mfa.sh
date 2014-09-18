#!/bin/bash
MFA_HOME=$HOME/.mfa

function mfa-token {
	[[ $# != 3 ]] && {
		echo "usage: mfa-token {add|update} <id> <token>"
		return 1
	}
	local command="$1"
	local id="$2"
	local token="$3"
	local vault="$MFA_HOME/$id.mfa.asc"
	case $(echo $command|tr "[:upper:]" "[:lower:]") in
		add)
			[[ -f $vault ]] && {
				echo "error: token $id already exists (use update command to replace it)"
				return 1
			}
			echo $token | gpg --armor -e > $vault
			;;
		update)
			[[ ! -f $vault ]] && {
				echo "error: token $id does not exist (use add command to create it)"
				return 1
			}
			echo $token | gpg --armor -e > $vault
			;;
		*)
			echo "error: unknown command $command"
			return 1
			;;
	esac
}

function mfa {
	[[ $# != 1 ]] && {
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
	local tokens=$(find $MFA_HOME -name \*.mfa.asc -exec basename {} ';' | sed -E 's/^(.*)\.mfa\.asc/\1/')
	local cur=${COMP_WORDS[COMP_CWORD]}
	[[ $COMP_CWORD -eq 1 ]] && COMPREPLY=($(compgen -W "$tokens" -- $cur))
}

complete -o nospace -F _mfadevices mfa
