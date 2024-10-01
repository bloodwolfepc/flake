{config, ... }: {
  sops.secrets = {
    "syncthing-key-angel" = {
      owner = "syncthing";
    };
    "syncthing-cert-angel" = {
      owner = "syncthing";
    };
  };
  services.syncthing = { 
    key = config.sops.secrets."syncthing-key-angel".path;
    cert = config.sops.secrets."syncthing-cert-angel".path;
  };
  imports = [
    ../modules/networking/syncthing.nix
    ../../home-manager/bloodwolfe/modules/daw/syncthing.nix
    ../../home-manager/bloodwolfe/modules/art/syncthing.nix
    ../../home-manager/bloodwolfe/modules/obs/syncthing.nix
    ../../home-manager/bloodwolfe/modules/gaming/syncthing.nix
    ../../home-manager/bloodwolfe/modules/require/syncthing.nix
    ../modules/extra-modules/android-syncthing.nix 
    ../../home-manager/bloodwolfe/modules/taskwarrior/syncthing.nix
  ];
  # special large data sync
  #services.syncthing.settings.folders = {
  #  "/data/games" = {
  #    path = "/data/games";
  #    devices = [ "navi" "lapis" "angel" ];
  #    ignorePerms = true;
  #  };
  #};
}
