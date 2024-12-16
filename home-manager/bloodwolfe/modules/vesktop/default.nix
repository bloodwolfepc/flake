{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "vesktop";
    packages = with pkgs; [
      vesktop
    ];
    syncDirs = [
      ".config/vesktop"
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
