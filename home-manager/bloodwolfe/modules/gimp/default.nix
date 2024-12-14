{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "gimp";
    syncDirs = [
      "gimp"
      ".config/GIMP"
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
