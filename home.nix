{ config, pkgs, lib, user, ... }:

{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.11"; 
  home.packages = with pkgs; [
	thefuck
	git
	#gh
	pkgs.gitAndTools.gh
	git
	sops
	gnupg
 	hello
	neofetch
	tree
	zsh
	lf
	ranger
	swaynotificationcenter
	xdg-desktop-portal
	xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk
	xdg-desktop-portal-hyprland
	polkit-kde-agent
	ksnip
	wofi
	alacritty
	xfce.thunar
];
	#home.packages = [ pkgs.gitAndTools.gh ];
	programs.gh.enable = true;
	programs.git.enable = true;


  home.file = {
    
  };

    home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
	
programs.neovim = {
	enable = true;
	extraLuaConfig = lib.fileContents ./nvim-init.lua;
    #set number relativenumber
  #;
};

#imports = [
#(import ../modules/zsh/default.nix)
#];

programs.zsh = {
	enable = true;
	enableCompletion = true;
	enableAutosuggestions = true;
	syntaxHighlighting.enable = true;
	dotDir = "$HOME/.config/zsh";


	zplug = {
		enable = true;
		plugins = [
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
    #bindkey '^[[A' history-substring-search-up
    #bindkey '^[[B' history-substring-search-down
	'';
	};

	wayland.windowManager.hyprland = {
		enable = true;
		#extraConfig = lib.fileContents xxx;
	};
programs.waybar = {
	enable = true;
};
}
