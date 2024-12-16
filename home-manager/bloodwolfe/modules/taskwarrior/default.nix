{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "taskwarrior";
    packages = with pkgs; [
      taskwarrior-tui
    ]; 
    syncDirs = [
      ".config/task" #TODO should only worry about taskrc
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.taskwarrior = { 
      enable = true; 
      package = pkgs.taskwarrior3;
    };
  };
in {
  inherit (attrs) options config;
}
