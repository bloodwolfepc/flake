{ lib }: 
  with builtins;
  with lib;
rec {
  #inherit (builtins) attrNames listToAttrs hasAttr isAttrs getAttr removeAttrs intersectAttrs;
  mkSyncthingAttrs = devices: dirs: genAttrs dirs (dir: { dir = {
    path = dir;
    inherit devices;
    ignorePerms = true;
  };});
  #add a colision safety check between sync and persist arrays
  #allow for making imports

  mkApplicationOptions = {
    name,
    attrSpace ? "bwcfg",
    extraOpts ? {}
  }: {
    options = {
      ${attrSpace}.${name} = {
        enable = mkEnableOption "enable ${attrSpace} ${name}";
        persist = {
          enable  = mkEnableOption "enable persist ${attrSpace} ${name}";
        };
        sync = {
          enable = mkEnableOption "enable sync ${attrSpace} ${name}";
        };
      };
    } // extraOpts;
  };
  
  mkHomeApplication = args:
    mkApplication (args // {type = "home"; });

  mkApplication = {
    name ? throw "No name given.",
    command ? "null",
    key ? "null",
    type ? "host",
    attrSpace ? "bwcfg",
    packages ? [ ],
    extraConfig ? { },
    extraHomeConfig ? { },
    extraOpts ? { },
    persistDirs ? [ ],
    persistFiles ? [ ],
    persistRootDir ? "/persist",
    syncDirs ? [ ],
    syncFiles ? [ ],
    syncRootDir ? "/sync",
    syncDefaultDevices ? [ "navi" "angel" ],
    syncExtraDevices ? [ ],
    config
  }: let
      cfg = config.${attrSpace}.${name};
      applicationOptions = mkApplicationOptions {
        inherit name attrSpace extraOpts;
      };
      extraConfig' = mkIf cfg.enable (
        if isFunction extraConfig
        then extraConfig cfg
        else extraConfig
      );  
      extraHomeConfig' = mkIf cfg.enable (
        if lib.isFunction extraHomeConfig
        then extraHomeConfig cfg
        else extraHomeConfig
      );
      allSyncDevices = syncDefaultDevices ++ syncExtraDevices;
  in {
    inherit (applicationOptions) options;
    config = {#mkIf cfg.enable {
      ${attrSpace}.${name} = {
        enable = mkDefault false;
        persist.enable = mkDefault false;
        sync.enable = mkDefault false;
      };
      services.syncthing = mkIf (cfg.sync.enable && cfg.enable && syncDirs != [ ]) {
        settings.folders = mkSyncthingAttrs allSyncDevices syncDirs;
      };
      wayland.windowManager.hyprland = mkIf (config.wayland.windowManager.hyprland.enable && cfg.enable) {#mkIf key != null {#(config.${attrSpace}.hyperland.enable && key != null) {
        extraConfig = lib.mkBefore ''
          submap = EXEC
            bindi = , ${key} submap , EXEC_${name}
          submap = escape
          submap = EXEC_${name}    
	          bindi = , ${config.kb_RIGHT}, layoutmsg, preselect r
	          bindi = , ${config.kb_DOWN}, layoutmsg, preselect d
	          bindi = , ${config.kb_UP}, layoutmsg, preselect u
	          bindi = , ${config.kb_LEFT}, layoutmsg, preselect l
	          bindi = , ${config.kb_RIGHT}, exec, ${command}
	          bindi = , ${config.kb_DOWN}, exec, ${command}
	          bindi = , ${config.kb_UP}, exec, ${command}
	          bindi = , ${config.kb_LEFT}, exec, ${command}
            ${config.globals.passOneshots};
          submap = escape
          submap = EXEC_WS
            bindi = , ${key}, workspace, name:${name}
            bindi = , ${key}, exec, ${command}
          submap = escape
          submap = WS
            bindi = , ${key}, workspace, name:${name}
          submap = escape
        '';
      };
      home = {#(mkIf type == home) {
        inherit packages;
        persistence = mkIf cfg.enable {
          "${persistRootDir}${config.home.homeDirectory}" = mkIf cfg.persist.enable {
            directories = persistDirs;
            files = persistFiles;
          };
          "${syncRootDir}${config.home.homeDirectory}" = mkIf cfg.sync.enable {
            directories = syncDirs;
            files = syncFiles;
          };
        };
        file = mkIf cfg.enable (
          mkMerge (map (syncFile: {
            "${syncFile}".source = config.lib.file.mkOutOfStoreSymlink
              "${syncRootDir}${config.home.homeDirectory}/.extra-syncs/${syncFile}";
          }) syncFiles)
        );
      } // extraHomeConfig;
    } // extraConfig';
  };
}
