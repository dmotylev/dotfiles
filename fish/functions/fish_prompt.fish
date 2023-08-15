function fish_mode_prompt
end

function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brred)
    set -l prompt_status ""

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_use_informative_chars true

    set -g __fish_git_prompt_char_stagedstate '•'
    set -g __fish_git_prompt_color_stagedstate yellow

    set -g __fish_git_prompt_char_dirtystate '◦'
    set -g __fish_git_prompt_color_dirtystate red
    
    set -g __fish_git_prompt_char_untrackedfiles '‥'
    set -g __fish_git_prompt_color_untrackedfiles white
    
    set -g __fish_git_prompt_showcleanstate 0
    set -g __fish_git_prompt_color_cleanstate green

    set -g __fish_git_prompt_showcolorhints true
    set -g __fish_git_prompt_color brblack
    set -g __fish_git_prompt_color_branch blue
    set -g __fish_git_prompt_color_branch_dirty red
    set -g __fish_git_prompt_color_branch_staged yellow
    set -g __fish_git_prompt_color_prefix brblack
    set -g __fish_git_prompt_color_suffix brblack
    set -g __fish_git_prompt_color_merging yellow


    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_describe_style default



    # Color the prompt differently when we're root
    set -l suffix '%'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color yellow)
        echo -s $status_color "... exit code $last_status"
    end

    echo -s $cwd_color (prompt_pwd) $vcs_color (fish_git_prompt) $normal ' ' $prompt_status
    echo -n -s $status_color $suffix ' ' $normal
end
