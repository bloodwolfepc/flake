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
      #".cache/zsh_history" #write to persist
      ".cache/mozilla"
      ".mozilla"
			#{
			#	directory = ".local/share/Steam";
			#	method = "symlink";
			#}	
      ".local/share/Steam"
      ".local/share/zoxide"
      ".config/spotify"

		];
		files = [
      ".config/gh/hosts.yml" #TODO place this somewhere less worse
			".screenrc"
      #".config/sops/age/keys.txt"
		];
		allowOther = true;
	};
}
