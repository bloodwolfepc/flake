{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "wezterm";
    command = "${pkgs.wezterm}/bin/wezterm";
    key = "w";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.wezterm = {
      enable = true;
    };
  };
in {
  inherit (attrs) options config;
}
