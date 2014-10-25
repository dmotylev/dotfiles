(
    if ! [ -f git/gitconfig.dotfile ]; then
        info "customize $DOTFILE_NAME"

        git_credential_helper='cache'
        if [[ "$(uname -s)" == "Darwin" ]]; then
            git_credential_helper='osxkeychain'
        fi

        read -p "$(prompt 'What is your github author name?')" -e git_user_name
        read -p "$(prompt 'What is your github author email?')" -e git_user_email
        sed \
            -e "s/__GIT_USER_NAME__/$git_user_name/g" \
            -e "s/__GIT_USER_EMAIL__/$git_user_email/g" \
            -e "s/__GIT_CREDENTIAL_HELPER__/$git_credential_helper/g" \
            git/gitconfig.dotfile.example > git/gitconfig.dotfile

        success "$DOTFILE_NAME customized"
    fi
)
