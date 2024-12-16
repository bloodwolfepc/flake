{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "btop";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.btop = {
      enable = true;
    };
  };
in {
  inherit (attrs) options config;
}
