{
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
			"Downloads"
			"Music"
			"Pictures"
			"Documents"
			"Videos"
      "Projects"
			#".gnupg"
			".ssh"
      #".config/sops"
			".nixops"
			".local/share/keyrings"
			".local/share/direnv"
      ".ssh"
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
