{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "westerm";
    command = "${pkgs.westerm}/bin/westerm";
    key = "t";
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
