{ inputs, pkgs, config, ... }: {
  imports =
    [       
      #TODO nixos hardware modules
      ./hardware-configuration.nix
      ./syncthing.nix
      ./borg.nix
      ../modules/preset/server.nix
      ../modules/users/bloodwolfe
    ];
  networking.hostName = "navi";
  boot.loader.grub = { 
    enable = true;
    device = "/dev/disk/by-id/ata-T-FORCE_240GB_TPBF2312190010101467";
  }; 
  networking.useDHCP = true;
}
