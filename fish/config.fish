if status is-interactive
    # Commands to run in interactive sessions can go here
	fish_vi_cursor
	set fish_cursor_default block
	set fish_cursor_insert line
	set fish_cursor_visual block
    fzf_configure_bindings --directory=\ef
end

source /Users/dmotylev/.docker/init-fish.sh || true # Added by Docker Desktop

setenv_kubeconfig

fzf_configure_bindings --directory=\ef
