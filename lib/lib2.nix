{ lib, pkgs, config }: let
  mkSyncthingAttrs = dirs: {
    folders = builtins.map (dir: { folder = dir; }) dirs;
  };
in {
  name,
  packages,
  persistDirs,
  extraConfig ? {}
}: {
  config = lib.mkIf (config.pograms.${name}.enable) {
    services.syncthing = lib.mkIf (config.programs.${name}.sync.enable) {
      settings.folders = mkSyncthingAttrs persistDirs;
    };
    home = {
      packages = packages;
      persistence = lib.mkIf (config.programs.${name}.sync.enable) {
        "/sync${config.home.homeDirectory}" = {
          directores = persistDirs;
        };
      };
      ${name}.configuration = extraConfig;
    };
  };
}
