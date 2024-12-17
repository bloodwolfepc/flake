{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "vesktop";
    key = "d";
    command = "${pkgs.vesktop}/bin/vesktop}";
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
