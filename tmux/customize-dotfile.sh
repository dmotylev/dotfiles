(
    readonly tmux_plugins_dir="${DOTFILE_NAME}/tmux.dotfile/plugins"
    readonly tmux_tpm_dir="${tmux_plugins_dir}/tpm"
    [ -z "$(type -p git)" ] && fail "git required for customizing ${DOTFILE_NAME}"
    if [ -z "$(find ${tmux_tpm_dir} -type f -maxdepth 1 2> /dev/null)" ]; then
        info "customizing ${DOTFILE_NAME}"
        mkdir -p ${tmux_plugins_dir}
        git clone https://github.com/tmux-plugins/tpm ${tmux_tpm_dir}
    fi
    success "${DOTFILE_NAME} customized"
)
