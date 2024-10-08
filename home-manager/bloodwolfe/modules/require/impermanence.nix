{ config, inputs, ... }: {
	imports = [
		inputs.impermanence.nixosModules.home-manager.impermanence
	];
	home.persistence."/sync/home/bloodwolfe" = {  
    allowOther = true; 
    directories = [ 
			"music"
			"videos"
      "projects"
      "git"
      "containerfiles"
      "containers"
      "qemu"
      "wine"
      "pictures"
    ];
  };
	home.persistence."/persist/home/bloodwolfe" = {
		allowOther = true;
		directories = [
			".local/share/keyrings"
			".local/share/direnv"
      ".local/state/wireplumber"
      ".local/share/containers"
		];
		files = [
			".screenrc" 
		];
	};
}
