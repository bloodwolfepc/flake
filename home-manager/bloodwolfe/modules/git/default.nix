{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "git";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.git = {
      enable = true;
      userName = "bloodwolfepc";
      userEmail = "bloodwolfepc@gmail.com";
    };
    programs.gh.enable = true;
    sops.secrets."gh-hosts" = {
      path = "/home/bloodwolfe/.config/gh/hosts.yml";
    };
  };
in {
  inherit (attrs) options config;
}
