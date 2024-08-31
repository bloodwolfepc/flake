{
  services.flatpak.enable = true;
	home.persistence."/persist/home/bloodwolfe" = {
		allowOther = true;
		directories = [
      ".cache/flatpak"
      ".local/share/flatpak"
    ];
  };
}
