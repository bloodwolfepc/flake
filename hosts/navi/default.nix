{ inputs, pkgs, config, ... }: {
  #Must use MBR
  imports =
    [       
      #inputs.hardware.nixosModules.<something>
      ./hardware-configuration.nix
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/require
      ../modules/option/security/yubikey.nix
      ../modules/option/networking/ssh.nix

      ../modules/users/bloodwolfe

      ../modules/option/virtualization/docker.nix
      ../modules/option/theme/stylix.nix

      ../modules/option/services/syncthing.nix
      ../../home/bloodwolfe/modules/daw/syncthing.nix
      ../../home/bloodwolfe/modules/art/syncthing.nix
      ../../home/bloodwolfe/modules/obs/syncthing.nix
      ../../home/bloodwolfe/modules/gaming/syncthing.nix
      ../../hardware/android-syncthing.nix
    ];
  networking.hostName = "navi";
  boot.loader.grub = { 
    enable = true;
    device = "/dev/disk/by-id/ata-T-FORCE_240GB_TPBF2312190010101467";
  }; 
  networking.useDHCP = true;
  sops.secrets = {
    "syncthing-key-navi" = {
      owner = "syncthing";
    };
    "syncthing-cert-navi" = {
      owner = "syncthing";
    };
  };
  services.syncthing = { 
    #guiAddress = "0.0.0.0:8383";
    key = config.sops.secrets."syncthing-key-navi".path;
    cert = config.sops.secrets."syncthing-cert-navi".path;
  };
}
