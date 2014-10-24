customize_gitconfig () {
    if ! [ -f git/gitconfig.dotfile ]; then
        info 'customize gitconfig'

        git_credential='cache'
        if [[ "$(uname -s)" == "Darwin" ]]; then
            git_credential='osxkeychain'
        fi

        read -p "$(prompt 'What is your github author name?')" -e git_authorname
        read -p "$(prompt 'What is your github author email?')" -e git_authoremail
        sed \
            -e "s/AUTHORNAME/$git_authorname/g" \
            -e "s/AUTHOREMAIL/$git_authoremail/g" \
            -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" \
            git/gitconfig.dotfile.example > git/gitconfig.dotfile

        success 'gitconfig'
    fi
}

customize_gitconfig
