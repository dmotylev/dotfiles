customize_vim () {
    readonly vim_bundles_dir="${DOTFILE_NAME}/bundle"
    readonly vundle_dir="${vim_bundles_dir}/Vundle.vim"
    [ ! -x git ] && fail "git required for customizing ${DOTFILE_NAME}"
    if [ -z "$(find ${vundle_dir} -type f -maxdepth 1 2> /dev/null)" ]; then
        info "customizing ${DOTFILE_NAME}"
        mkdir -p ${vim_bundles_dir}
        git clone https://github.com/gmarik/Vundle.vim.git ${vundle_dir}
    fi
    success "${DOTFILE_NAME} customized"
}

customize_vim
