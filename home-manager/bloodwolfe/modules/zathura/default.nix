{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "gimp";
    packages = with pkgs; [
      zathura
    ];
    syncDirs = [
      ".local/share/zathura"
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
