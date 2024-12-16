{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "ssh";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.ssh = { 
      enable = true;
    };
    sops.secrets = {
      "ssh-angel" = {
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };
    };
  };
in {
  inherit (attrs) options config;
}
