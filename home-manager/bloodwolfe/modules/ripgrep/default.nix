{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "ripgrep";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.ripgrep = {
      enable = true;
      package = pkgs.ripgrep-all;
    };
  };
in {
  inherit (attrs) options config;
}
