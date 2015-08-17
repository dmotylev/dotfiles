(
    readonly plug_vim_file="${DOTFILE_NAME}/vim.dotfile/autoload/plug.vim"
    if [[ ! -f "${plug_vim_file}" ]]; then
    	info "customizing ${DOTFILE_NAME}"
		curl -fLo ${DOTFILE_NAME}/vim.dotfile/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    success "${DOTFILE_NAME} customized"
)
