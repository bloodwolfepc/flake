{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "thefuck";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.thefuck = {
      enable = true;
    };
  };
in {
  inherit (attrs) options config;
}
