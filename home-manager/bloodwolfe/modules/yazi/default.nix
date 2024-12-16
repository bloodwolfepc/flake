{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "yazi";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.yazi = {
      enable = true;
    };
  };
in {
  inherit (attrs) options config;
}
