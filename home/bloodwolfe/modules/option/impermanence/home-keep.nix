{
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
			"Downloads"
			"Music"
			"Pictures"
			"Documents"
			"Videos"
      "Projects"
			".nixops"
			".local/share/keyrings"
			".local/share/direnv"
      ".cache/mozilla"
      ".mozilla"
      
      ".wine"
			#{
			#	directory = ".local/share/Steam";
			#	method = "symlink";
			#}	
      ".local/share/Steam"
      ".local/share/zoxide"
      ".config/spotify"
      ".cache/spotify-player" #TODO replace with EOF shell scirpt 

      
      #no nix workstation solution, probably host these dirs
      ".config/REAPER"
      ".config/GIMP"
      ".config/obs-studio"
      
      ".local/share/krita" 
      ".local/share/bottles"
		];
		files = [
      ".config/gh/hosts.yml" #TODO place this somewhere less worse
			".screenrc" 
      ".ssh/known_hosts"
      
      #no nix workstation solution, probably host these dirs
      ".config/kritarc"
      ".config/kritadisplayrc"
		];
		allowOther = true;
	};
}
