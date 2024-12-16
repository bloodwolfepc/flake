
{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "libreoffice";
    syncDirs = [
      ".config/libreoffice"
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    home.packages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.en_US
    ];
  };
in {
  inherit (attrs) options config;
}
