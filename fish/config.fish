if status is-interactive
	# Commands to run in interactive sessions can go here
	fish_vi_cursor
	set fish_cursor_default block
	set fish_cursor_insert line
	set fish_cursor_visual block
	set --universal tide_right_prompt_items
	fzf_configure_bindings --directory=\ef
	# enable grapheme clustering in ghostty
	printf "\033[?2027h"
end

source /Users/dmotylev/.docker/init-fish.sh || true # Added by Docker Desktop

setenv_kubeconfig
