{
  programs.kdeconnect.enable = true;
	home.persistence."/persist/home/bloodwolfe" = {
		allowOther = true;
		directories = [
      ".config/kdeconnect"
    ];
  };
}
