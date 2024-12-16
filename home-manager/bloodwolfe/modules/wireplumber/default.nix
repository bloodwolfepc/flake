{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "wireplumber";
    persistDirs = [
      ".local/state/wireplumber"
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
