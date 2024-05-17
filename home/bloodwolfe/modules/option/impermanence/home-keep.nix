{
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
			"Downloads"
			"Music"
			"Pictures"
			"Documents"
			"Videos"
      "Projects"
			".ssh"
			".nixops"
			".local/share/keyrings"
			".local/share/direnv"
      ".cache/mozilla"
      ".mozilla"
			#{
			#	directory = ".local/share/Steam";
			#	method = "symlink";
			#}	
      ".local/share/Steam"
      ".local/share/zoxide"
      ".config/spotify"
      ".config/obs-studio"
      ".cache/spotify-player" #TODO replace with EOF shell scirpt 
      #krita, reaper and gimp need better setups
		];
		files = [
      ".config/gh/hosts.yml" #TODO place this somewhere less worse
			".screenrc"
      #".config/sops/age/keys.txt"
		];
		allowOther = true;
	};
}
