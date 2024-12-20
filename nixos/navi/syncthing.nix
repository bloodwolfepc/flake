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
    ../../home-manager/bloodwolfe/modules/require/syncthing.nix
    ../modules/extra-modules/android-syncthing.nix 
    ../../home-manager/bloodwolfe/modules/taskwarrior/syncthing.nix
    ../../home-manager/bloodwolfe/modules/fcitx5/syncthing.nix
    ../../home-manager/bloodwolfe/modules/libreoffice/syncthing.nix
    ../../home-manager/bloodwolfe/modules/zathura/syncthing.nix
    
    
    ../../home-manager/bloodwolfe/modules/gaming/syncthing.nix
    ../../home-manager/bloodwolfe/modules/prismlauncher/syncthing.nix
    ../../home-manager/bloodwolfe/modules/retroarch/syncthing.nix
    ../../home-manager/bloodwolfe/modules/qutebrowser/syncthing.nix
    
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
