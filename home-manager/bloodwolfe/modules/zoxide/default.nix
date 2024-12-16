{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "zoxide";
    persistDirs = [
      ".local/share/zoxide"
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
    programs.zsh.shellAliases = {
      z = "cd";
    };
  };
in {
  inherit (attrs) options config;
}
