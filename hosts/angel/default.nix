{ config, inputs, pkgs, ... }: {
  imports =
    [       
      inputs.hardware.nixosModules.asus-zephyrus-ga402
      ./hardware-configuration.nix
      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/option/spec/powersave.nix
      ../modules/option/spec/asus.nix

      ../modules/require
      #../modules/preset/laptop.nix


      ../../hardware/behringer-404-hd.nix
      ../modules/option/audio/musnix.nix
      ../modules/option/audio/low-latency-audio.nix
      

      ../modules/preset/full-system.nix

      ../modules/users/bloodwolfe


      ../modules/option/gui/wine.nix
      #../modules/option/virtualization/docker.nix

      ../modules/option/theme/stylix.nix
      ../modules/option/services/syncthing.nix

      ../../home/bloodwolfe/modules/option/gui/editors/sound-syncthing.nix     #../modules/option/gui/gaming/jovian-software.nix
    ];
  monitors = [
    #( 
    #  import ../../hardware/msi-g241.nix { 
    #    primary = true;
    #    x = 0;
    #)
    {
      primary = true;
      port = "DP-3";
      width = 1920;
      height = 1080;
      refreshRate = 144;
      x = 0;
      workspace = "1";
    }
  ];
  networking.hostName = "angel";
  networking.networkmanager.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  programs.kdeconnect.enable = true;
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
  }; #TODO undervolt
}
