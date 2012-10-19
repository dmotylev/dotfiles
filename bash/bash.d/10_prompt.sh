#!/bin/bash
_psc_rst=$(tput sgr0)
_psc_sbrkt=$(tput setaf 3)
_psc_path=$(tput setaf 8)
_psc_git_dirty=$(tput setaf 196)
_psc_git_ready=$(tput setaf 226)
_psc_git_clean=$(tput setaf 4)
_psc_prompt=$(tput setaf 6)
_psc_history_no=$(tput setaf 8)
_psc_smiley=$(tput setaf 4)
_psc_frowny=$(tput setaf 1)

__psc_git_branch()
{
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
  printf " $_git_color$_git_branch"
}

function __psc_precmd_hook {
  timer=${timer:-$SECONDS}
}

function __psc_postcmd_hook {
  if [ $? -eq 0 ]; then
    _cmd_color=$_psc_smiley
    _cmd_char="✔ "
  else
    _cmd_color=$_psc_frowny
    _cmd_char="✘ "
  fi
  _cmd_time=$(($SECONDS - $timer))
  if [ $_cmd_time -eq 0 ]; then
    _cmd_times=""
  else
    _cmd_times="${_cmd_time}s "
  fi
  __psc_last_cmd_result=$(printf "${_cmd_color}${_cmd_char}${_cmd_times}")
  unset timer _cmd_times _cmd_time _cmd_color _cmd_char
}

trap '__psc_precmd_hook' DEBUG
PROMPT_COMMAND=__psc_postcmd_hook

export PS1='\[${_psc_sbrkt}\][\[${__psc_last_cmd_result}${_psc_path}\]\w$(__psc_git_branch) \[$_psc_history_no\]\!\[$_psc_sbrkt\]]\n\[$_psc_prompt\]\$\[$_psc_rst\] '
export PS2='> '
export PS4='+ '
