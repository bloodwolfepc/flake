{
	home.persistence."/persist/home" = {
		directories = [
			"Downloads"
			"Music"
			"Pictures"
			"Documents"
			"Videos"
      "Projects"
			".gnupg"
			".ssh"
			".nixops"
			".local/share/keyrings"
			".local/share/direnv"
			{
				directory = ".local/share/Steam";
				method = "symlink";
			}	
		];
		files = [
			".screenrc"
		];
	};
}
