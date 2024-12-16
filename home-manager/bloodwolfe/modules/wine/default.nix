#for a working working clipboard
#wl-paste -t text -w xclip -selection clipboard

{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "wine";
    packages = with pkgs; [
      wineWowPackages.stagingFull

      #wineWowPackages.stable
      #wine
      #(wine.override { wineBuild = "wine64"; })
      #wine64
      #wineWowPackages.staging 
      #wineWowPackages.stagingFull
      #winetricks
      #wineWowPackages.waylandFull 
    ];
    syncDirs = [
      "wine"
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
