{config, ... }: {
  sops.secrets = {
    "syncthing-key-navi" = {
      owner = "syncthing";
    };
    "syncthing-cert-navi" = {
      owner = "syncthing";
    };
  };
  services.syncthing = { 
    key = config.sops.secrets."syncthing-key-navi".path;
    cert = config.sops.secrets."syncthing-cert-navi".path;
  };
  imports = [
    ../modules/networking/syncthing.nix
    ../../home-manager/bloodwolfe/modules/daw/syncthing.nix
    ../../home-manager/bloodwolfe/modules/art/syncthing.nix
    ../../home-manager/bloodwolfe/modules/obs/syncthing.nix
    ../../home-manager/bloodwolfe/modules/gaming/syncthing.nix
    ../modules/extra-modules/android-syncthing.nix
  ];
  # special large data sync
  services.syncthing.settings.folders = {
    "/data/games" = {
      path = "/sync/games";
      devices = [ "navi" "lapis" "angel" ];
      ignorePerms = true;
    };
  };
}
