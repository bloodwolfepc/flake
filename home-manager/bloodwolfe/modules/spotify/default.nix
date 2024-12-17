{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "spotify";
    key = "s";
    command = "${pkgs.spotify}/bin/spotify";
    packages = with pkgs; [
      spotify
    ];
    persistDirs = [
      ".config/spotify"
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
