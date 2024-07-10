{ inputs, pkgs, ... }: {
  #Must use MBR
  imports =
    [       
      #inputs.hardware.nixosModules.<something>
      ./hardware-configuration.nix
      inputs.disko.nixosModules.default
      #( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/sda"; })
      # { device = "/dev/disk/by-id/ata-T-FORCE_240GB_TPBF2312190010101467"; })      
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/require
      ../modules/option/security/yubikey.nix
      ../modules/option/networking/ssh.nix


      ../modules/users/bloodwolfe

      #../modules/option/server/nixarr.nix
      #../modules/option/virtualization/docker.nix
    ];
  networking.hostName = "navi";
  boot.loader.grub = { 
    enable = true;
    #efiSupport = true;
    #efiInstallAsRemovable = true;
    gfxmodeBios = "text"; 
  }; 
  #boot.loader.grub.device = "/dev/disk/by-id/ata-T-FORCE_240GB_TPBF2312190010101467";
  networking.useDHCP = true;
  

}
