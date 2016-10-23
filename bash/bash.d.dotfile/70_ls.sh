[ $(type -p dircolors) ] || alias dircolors="$(brew--prefix coreutils)/libexec/gnubin/dircolors"
eval $(dircolors $DOTFILES_ROOT/bash/dircolors.256dark)
alias ls='ls --color=auto'
alias ll='ls -ltrhp'
alias la='ls -trhAp'
alias l='ls -p'

export GREP_OPTIONS="--color=auto"
