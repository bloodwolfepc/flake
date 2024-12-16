{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "nix-index";
    persistDirs = [
      ".cache/nix-index"
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
  };
in {
  inherit (attrs) options config;
}
