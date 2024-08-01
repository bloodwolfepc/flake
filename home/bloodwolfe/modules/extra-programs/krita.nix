{ pkgs, ... }:
{
  home.packages = with pkgs; [
    krita
  ];
	home.persistence."/sync/home/bloodwolfe" = {
    directories = [
      ".local/share/krita" 
    ];
    files = [
      ".config/kritarc"
      ".config/kritadisplayrc"
    ];
  };
}
