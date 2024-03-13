{ home-manager, self, inputs, lib, ... }:
{
programs.zsh = {
	enable = true;
	dotDir = ".config/zsh";
	zplug = {
		enable = true;
		plugins = [
			{ name = "laggardkernal/zsh-thefuck"; }
			{ name = "zsh-users/zsh-syntax-highlighting"; }
			{ name = "zsh-users/zsh-autosuggestions"; }
		];
	};
	shellAliases = {
		nv = "nvim";
	};
	history = {
		save = 10000;
		size = 10000;
		path = "$HOME/.cache/zsh_history";
	};
	profileExtra = ''
		neofetch
	'';

	initExtra = ''
    autoload -Uz compinit promptinit
    compinit
    promptinit
    # This will set the default prompt to the walters theme
    prompt walters #promp -p and prompt -l for themes
    PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
    autoload -Uz compiit
    compinit #sshhashknownhosts todo
    zstyle ':completion:*' menu select
    zstyle ':completion::complete:*' gain-privileges 1
    #historysearch
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
	'';
	};
}

