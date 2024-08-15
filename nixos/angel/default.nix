{ config, inputs, pkgs, lib, ... }: {
  imports = [       
    inputs.disko.nixosModules.default
    ( import ../modules/disko/ephemeral-btrfs.nix { device = "/dev/nvme0n1"; })
    inputs.hardware.nixosModules.asus-zephyrus-ga402
    ./hardware-configuration.nix
    ./monitors.nix
    ./syncthing.nix
    ../modules/users/bloodwolfe
    ../modules/preset/main.nix
    ../modules/hardware/behringer-404-hd
    ../modules/hardware/gpu-passthrough.nix
    ../modules/hardware/rog-zypherus-g14.nix
  ];
  networking.hostName = "angel";
}
