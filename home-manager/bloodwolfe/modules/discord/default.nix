{ pkgs, ... }: {
  imports = [ ./hyprland.nix ];
  home.packages = with pkgs; [
    vesktop
  ];
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".config/vesktop"
    ];
  };
}
