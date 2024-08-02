{ config, inputs, pkgs, lib, ... }: {
  imports = [       
    inputs.hardware.nixosModules.asus-zephyrus-ga402
    ./hardware-configuration.nix
    inputs.disko.nixosModules.default
    ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
    ../modules/option/impermanence/impermanence-btrfs.nix
    #../modules/option/spec/powersave.nix
    #../modules/option/spec/asus.nix

    ../modules/require
    #../modules/preset/laptop.nix


    ../../hardware/behringer-404-hd.nix
    ../modules/option/audio/musnix.nix
    ../modules/option/audio/low-latency-audio.nix
    

    ../modules/preset/full-system.nix

    ../modules/users/bloodwolfe


    #../modules/option/gui/wine.nix
    #../modules/option/virtualization/docker.nix

    ../modules/option/theme/stylix.nix
    ../modules/option/services/syncthing.nix

    #../../home/bloodwolfe/modules/option/gui/editors/sound-syncthing.nix     #../modules/option/gui/gaming/jovian-software.nix
    ../../home/bloodwolfe/modules/daw/syncthing.nix

  ];
  monitors = [
    {
      enabled = true;
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      x = 0;
      y = 0;
    }
    {
      enabled = true;
      name = "eDP-2";
      width = 2560;
      height = 1600;
      refreshRate = 60;
      x = 1920;
      y = 0;
    }
  ];
  boot.loader.systemd-boot.enable = true;
  programs.rog-control-center.enable = true;
  programs.light.enable = true;
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
  services.power-profiles-daemon.enable = true;
  services.supergfxd.enable = true;
  services.asusd.enable = true;
}
