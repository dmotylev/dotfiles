hh() {
    if [[ $# == 0 ]]; then
      history
      return
    fi
    history | egrep "$*"
}

h() {
    hh "$@" | tail -10
}

alias \?='egrep'

unsetopt share_history
setopt histignorespace
