{ pkgs, ... }:
{
  home.packages = with pkgs; [
   spotify
  ];
	home.persistence."/persist/home/bloodwolfe" = {
    directores = [ 
      ".config/spotify"
    ];
  };
}
