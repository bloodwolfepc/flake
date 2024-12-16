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

  mkApplicationOptions = {
    name,
    attrSpace ? "bwcfg",
    extraOpts ? {}
  }: {
    options = rec {
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

  #use a command field, and use that commnad in a submapping, also pass the submap as an arg
  #use a special key to launch programs
  #add a colision safety check between sync and persist arrays
  #allow persist and sync files, use the krita method to sync special files
  mkApplication = {
    name ? throw "No name given.",
    command,
    key,
    type ? "host",
    attrSpace ? "bwcfg",
    packages ? [ ],
    extraConfig ? { },
    extraHomeConfig ? { },
    extraOpts ? { },
    peristDirs ? [ ],
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
      extraConfig' = if lib.isFunction extraConfig
        then extraConfig cfg
        else extraConfig;
      extraHomeConfig' = if lib.isFunction extraHomeConfig
        then extraHomeConfig cfg
        else extraHomeConfig;
      allSyncDevices = syncDefaultDevices ++ syncExtraDevices;
  in {
    inherit (applicationOptions) options;
    config = mkIf cfg.enable {
      services.syncthing = mkIf cfg.sync.enable {
        settings.folders = mkSyncthingAttrs allSyncDevices syncDirs;
      };
      home = { #if type is home
        inherit packages;
        persistence = {
          "${persistRootDir}${config.home.homeDirectory}" = mkIf cfg.persist.enable {
            directories = persistDirs;
          };
          "${syncRootDir}${config.home.homeDirectory}" = mkIf cfg.sync.enable {
            directories = syncDirs;
          };
        };
      } // extraHomeConfig';
    } // extraConfig';
  };
}
