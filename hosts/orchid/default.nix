#this is a configuration for for a non-specific system for usb bootable media
{ inputs, pkgs, ... }: {
  imports =
    [       
      ./hardware-configuration.nix
      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/sda1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/require

      ../modules/preset/pc.nix

      ../modules/users/bloodwolfe
    ];
  networking.hostName = "orchid";
}
