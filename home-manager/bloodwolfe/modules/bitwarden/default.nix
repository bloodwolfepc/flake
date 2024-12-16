{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "bitwarden";
    packages = with pkgs; [
      bitwarden
      bitwarden-cli
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.rbw = {
      enable = true;
    };
  };
in {
  inherit (attrs) options config;
}
