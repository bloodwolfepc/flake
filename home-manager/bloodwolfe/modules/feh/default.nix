{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "feh";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.feh = {
      enable = true;
    };
  };
in {
  inherit (attrs) options config;
}
