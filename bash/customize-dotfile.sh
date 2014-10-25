(
    if ! [ -f bash/profile.dotfile ]; then
        info "customize ${DOTFILE_NAME}"

        sed \
            -e "s#__DOTFILES_ROOT__#$DOTFILES_ROOT#g" \
            bash/profile.dotfile.example > bash/profile.dotfile

    fi
    success "${DOTFILE_NAME} customized"
)
