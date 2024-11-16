{
	programs.fish = {
		enable = true;

		shellAliases = {
				nya = "sudo";
				rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#nwix";
		};

		interactiveShellInit = ''
		set fish_greeting

		function fish_prompt --description 'Write out the prompt'
			set -l last_status $status
			set -l normal (set_color normal)
			set -l status_color (set_color brgreen)
			set -l cwd_color (set_color $fish_color_cwd)
			set -l vcs_color (set_color brpurple)
			set -l prompt_status ""

			set -l pink (set_color F5A9B8)
			set -l blue (set_color 5BCEFA)

			# Since we display the prompt on a new line allow the directory names to be longer.
			set -q fish_prompt_pwd_dir_length
			or set -lx fish_prompt_pwd_dir_length 0

			# Color the prompt differently when we're root
			set -l suffix 'λ'

			# For Root~
			if functions -q fish_is_root_user; and fish_is_root_user
					if set -q fish_color_cwd_root
							set cwd_color (set_color $fish_color_cwd_root)
					end
					set suffix '#'
			end

			# Color the prompt in red on error
			if test $last_status -ne 0
					set status_color (set_color $fish_color_error)
					set prompt_status $status_color "[" $last_status "]" $normal
			end

			echo -s $blue (prompt_pwd) $normal ' >~<' $vcs_color (fish_vcs_prompt) $normal ' ' $prompt_status
			echo -n -s $pink $suffix ' ' $normal
		end
		'';
	};
}
