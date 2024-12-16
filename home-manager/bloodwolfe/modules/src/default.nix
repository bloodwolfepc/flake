{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "src";
    syncDirs = [
      "src"
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
