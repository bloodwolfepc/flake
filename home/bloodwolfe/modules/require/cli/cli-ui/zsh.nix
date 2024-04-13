{ pkgs, ... }:
{
  programs.zsh = {
  	enable = true;
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    enableCompletion = true;
    enableVteIntegration = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#ff00ff,bg=cyan,bold,underline";
    };
    #defaultKeymap = "viins";
    #completionInit = "autoload -U compinit && compinit && promptinit";
    syntaxHighlighting.enable = true;
  	history = {
  		save = 10000;
  		size = 10000;
  		path = "$HOME/.cache/zsh_history";
      expireDuplicatesFirst = true;
  	};
  
    historySubstringSearch = {
      enable = true;
      #searchDownKey = [ "^j" ];
      #searchUpKey = [ "^k" ];
    };
  	profileExtra = ''
  		hyfetch
  	'';
  
  	shellAliases = {
  		#vi = "nix run ~/die --";
  		vi-bu = "nvim";
  		update = "sudo nixos-rebuild switch --flake .#lapis | gay -g";
  		neocities = "~/gem/neocities-ruby/bin/neocities";
  
  		#cat-og = "/bin/cat";
  		cat = "lolcat";
  
  		#cd-og = "/bin/cd";
  		cd = "z";
  	};
    #TODO change zsh readkey engine
    initExtraFirst = ''
      function zvm_config() {
        ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
        ZVM_VI_VISUAL_ESCAPE_BINDKEY=jk
        ZVM_VI_OPPEND_ESCAPE_BINDKEY=jk
      }
    '';
  	initExtra = ''
      prompt walters 
      PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
      eval "$(zoxide init zsh)"
  	'';
  };
}

