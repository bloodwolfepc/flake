{ inputs, pkgs, ... }: {
  #Must use MBR
  imports =
    [       
      #inputs.hardware.nixosModules.<something>
      ./hardware-configuration.nix
      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/sda"; })  #/dev/disk/by-id/ata-T-FORCE_240GB_TPBF2312190010101467
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/require
      ../modules/option/security/yubikey.nix
      ../modules/option/networking/ssh.nix


      ../modules/users/bloodwolfe

      ../modules/option/server/nixarr.nix
      ../modules/option/virtualization/docker.nix
    ];
  networking.hostName = "navi";
  boot.loader.grub.enable = true;
  boot.loader.grub.gfxmodeBios = "text";
  #boot.loader.grub.device = "/dev/sda";
  networking.useDHCP = true;

}
