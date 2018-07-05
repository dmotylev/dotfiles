#eval "$(gpg-agent --daemon --quiet)"
export GPG_TTY="$(/usr/bin/tty)"
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpgconf --launch gpg-agent
