{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "appimages";
    syncDirs = [
      "appimages"
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
