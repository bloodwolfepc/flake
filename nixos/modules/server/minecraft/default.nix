{ lib, ... }: {
  imports = [
   ./proxy-mc.nix
   ./vanilla-mc.nix
   ./xyz-mc.nix
  ];

  options.srv.minecraft.servers = {
    proxy-mc = {
      enable = lib.mkEnableOption "Enable.";
      backup.enable = lib.mkEnableOption "Backup.";
    }; 
    hub-mc = {
      enable = lib.mkEnableOption "Enable.";
      backup.enable = lib.mkEnableOption "Backup.";
    };
    xyz-mc = {
      enable = lib.mkEnableOption "Enable.";
      backup.enable = lib.mkEnableOption "Backup.";
    };
    vanilla-mc = {
      enable = lib.mkEnableOption "Enable.";
      backup.enable = lib.mkEnableOption "Backup.";
    };
    modded-mc = {
      enable = lib.mkEnableOption "Enable.";
      backup.enable = lib.mkEnableOption "Backup.";
    };
  };
  config.srv.minecraft.servers = {
  #"for each server enable"
  };
    
}
