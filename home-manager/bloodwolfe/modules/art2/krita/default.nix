{ pkgs, config, lib, ... }: let
  lib' = import ../../../../../lib/default.nix;
  dirs.persist = [
    "krita"
    ".local/share/krita" 
    ".config/DIR-kritarc"
    ".config/DIR-kritadisplayrc"
  ];
  syncthingAttrs = lib'.mkSyncthingAttrs dirs.persist;
  #syncthingAttrs = lib.genAttrs dirs.persist (item: {
  #  path = "${item}";
  #  devices = [ "navi" "lapis" "angel" ];
  #  ignorePerms
    

  #services.syncthing.settings.folders = {
  #  "/sync/home/bloodwolfe/krita" = {
  #    path = "/sync/home/bloodwolfe/krita";
  #    devices = [ "navi" "lapis" "angel" ];
  #    ignorePerms = true;
  #  };
    
  cfg = config.programs.krita;  
in {
  config = lib.mkIf cfg.enable {
    services.syncthing = lib.mkIf cfg.sync.enable {
      settings.folders = syncthingAttrs;
    };
    home = {
      packages = with pkgs; [
        krita 
      ];
      persistence = lib.mkIf cfg.sync.enable {
        "/sync${config.home.homeDirectory}" = {
          directores = dirs.persist;
        };
      };
      #hacky solution for getting kritarc into a syncable directory
      file = lib.mkIf cfg.sync.enable {
        ".config/kritarc".source = config.lib.file.mkOutOfStoreSymlink
          "/sync${config.home.homeDirectory}/.config/DIR-kritarc/kritarc";
        ".config/kritadisplayrc".source = config.lib.file.mkOutOfStoreSymlink
          "/sync${config.home.homeDirectory}/.config/DIR-kritadisplayrc/kritadisplayrc";
      };
    };
  };
}
