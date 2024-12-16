{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "htop";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.htop = {
      enable = true;
    };
  };
in {
  inherit (attrs) options config;
}
