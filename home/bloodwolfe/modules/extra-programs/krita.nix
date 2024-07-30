{ pkgs, ... }:
{
  home.packages = with pkgs; [
    krita
  ];
	home.persistence."/sync/home/bloodwolfe" = {
    directores = [
      ".local/share/krita" 
    ];
    files = [
      ".config/kritarc"
      ".config/kritadisplayrc"
    ];
  };
}
