{
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".config/kdeconnect"
    ];
  };
}
