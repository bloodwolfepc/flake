{ pkgs, ... }: {
  imports = [ ./hyprland.nix ];
  programs.firefox = {
    enable = true;
  };
	home.persistence."/persist/home/bloodwolfe" = {
    directories = [
      ".mozilla"
      ".cache/mozilla"
    ];
  };
}
