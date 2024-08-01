{ pkgs, ... }:
{
  imports = [ ./hyprland.nix ];
  home.packages = with pkgs; [
    spotify
  ];
	home.persistence."/persist/home/bloodwolfe" = {
    directories = [ 
      ".config/spotify"
    ];
  };
}
