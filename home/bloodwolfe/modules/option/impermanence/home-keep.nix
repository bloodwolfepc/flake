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
      #".cache/zsh_history"
      #".cache/mozilla"
			{
				directory = ".local/share/Steam";
				method = "symlink";
			}	
		];
		files = [
			".screenrc"
      ".config/sops/age/keys.txt"
		];
		allowOther = true;
	};
}
