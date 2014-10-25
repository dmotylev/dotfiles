_psc_rst=$(tput sgr0)
_psc_path=$(tput setaf 238)
_psc_git_dirty=$(tput setaf 1)
_psc_git_ready=$(tput setaf 130)
_psc_git_clean=$(tput setaf 4)
_psc_prompt=$(tput setaf 6)
_psc_smiley=$(tput setaf 4)
_psc_frowny=$(tput setaf 1)

__psc_git_branch () {
  _git_branch=$(git branch -q 2> /dev/null)
  if [ $? -ne 0 ]; then
    return 0
  fi
  _git_branch=$(echo "$_git_branch" | sed -n '/^\*/s/^\* //p')
  if git diff --quiet &> /dev/null; then
    if [ $(git status --porcelain | wc -l) -eq 0 ]; then
      _git_color=$_psc_git_clean
    else
      _git_color=$_psc_git_ready
    fi
  else
    _git_color=$_psc_git_dirty
  fi
  printf " $_git_color($_git_branch)"
}

__psc_precmd_hook () {
  timer=${timer:-$SECONDS}
}

__psc_postcmd_hook () {
  _cmd_code=$?
  if [ $_cmd_code -eq 0 ]; then
    _cmd_color=$_psc_smiley
    _cmd_char=""
  else
    _cmd_color=$_psc_frowny
    _cmd_char="$_cmd_code"
  fi
  _cmd_time=$(($SECONDS - $timer))
  if [ $_cmd_time -eq 0 ]; then
    _cmd_times=""
  else
    _cmd_times="$(test -z ${_cmd_char} || echo ":")${_cmd_time}s"
  fi
  _cmd_result="${_cmd_char}${_cmd_times}"
  if [ -z $_cmd_result ]; then
    __psc_last_cmd_result=""
  else
    __psc_last_cmd_result=$(printf "${_cmd_color}(${_cmd_result}) ")
  fi
  unset timer _cmd_times _cmd_time _cmd_color _cmd_char _cmd_code _cmd_result
}

trap '__psc_precmd_hook' DEBUG
PROMPT_COMMAND=__psc_postcmd_hook
export PS1='\[${__psc_last_cmd_result}${_psc_path}\]\[${_psc_path}\w\]$(__psc_git_branch)\n\[$_psc_prompt\]\$\[$_psc_rst\] '
export PS2='> '
export PS4='+ '
