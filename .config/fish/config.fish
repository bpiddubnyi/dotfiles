if status is-interactive
    # Commands to run in interactive sessions can go here
    /opt/homebrew/bin/brew shellenv | source
    direnv hook fish | source
    source "$HOME/.cargo/env.fish"
    fish_add_path -g -m $HOME/.local/bin \
    	$HOME/go/bin \
		/Users/p/.opencode/bin
    
    #    set -gx DOCKER_DEFAULT_PLATFORM linux/amd64
	set -gx EDITOR vim
    set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

    if test -d (brew --prefix)"/share/fish/completions"
        set -a fish_complete_path (brew --prefix)/share/fish/completions
    end
    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -a fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

    # git
    set -g __fish_git_prompt_shorten_branch_len 10
    set -g __fish_git_prompt_show_informative_status true
end

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

