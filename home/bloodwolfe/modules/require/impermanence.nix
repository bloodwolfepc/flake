{ config, inputs, ... }: {
	imports = [
		inputs.impermanence.nixosModules.home-manager.impermanence
	];
	home.persistence."/persist/home/bloodwolfe" = {
		allowOther = true;
		directories = [
			".local/share/keyrings"
			".local/share/direnv"
      ".local/state/wireplumber"

			"music"
			"videos"
      "projects"
      "git"
      "wine"
      "pictures"
		];
		files = [
			".screenrc" 
		];
	};
}
