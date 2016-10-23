declare -rA PS_C=(
    [RESET]=$(tput sgr0)
    [PATH]=$(tput setaf 238)
    [GIT_DIRTY]=$(tput setaf 1)
    [GIT_READY]=$(tput setaf 130)
    [GIT_CLEAN]=$(tput setaf 4)
    [PROMPT]=$(tput setaf 6)
    [ERROR]=$(tput setaf 1)
)

declare -A PS_PARTS=([GIT_BRANCH]="" [LASTCMD]="")

PS_UPDATE_GIT_BRANCH () {
    PS_PARTS[GIT_BRANCH]=""
    local branch
    if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
        [[ "$branch" == "HEAD" ]] && branch='detached*'
    else
        return
    fi

    local color=${PS_C[GIT_DIRTY]}
    if git diff --quiet &> /dev/null; then
        [[ "$(git status --porcelain 2> /dev/null)" == "" ]] \
            && color=${PS_C[GIT_CLEAN]} \
            || color=${PS_C[GIT_READY]}
    fi
    PS_PARTS[GIT_BRANCH]=" $color($branch)"
}

PS_UPDATE_LASTCMD () {
    local code=$? 
    PS_PARTS[LASTCMD]=""
    [[ $code -eq 0 ]] && return
    PS_PARTS[LASTCMD]="${PS_C[ERROR]}(${code}) "
}

PROMPT_COMMAND="PS_UPDATE_LASTCMD; PS_UPDATE_GIT_BRANCH"
export PS1='\[${PS_PARTS[LASTCMD]}\]\[${PS_C[PATH]}\w\]\[${PS_PARTS[GIT_BRANCH]}\]\n\[${PS_C[PROMPT]}\]\$\[${PS_C[RESET]}\] '
export PS2='> '
export PS4='+ '
