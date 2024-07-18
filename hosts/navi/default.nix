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
      ../modules/option/virtualization/docker.nix
    ];
  networking.hostName = "navi";
  boot.loader.grub = { 
    enable = true;
    device = "/dev/disk/by-id/ata-T-FORCE_240GB_TPBF2312190010101467";
    #efiSupport = true;
    #efiInstallAsRemovable = true;
    gfxmodeBios = "text"; 
  }; 
  #boot.loader.grub.device = "/dev/disk/by-id/ata-T-FORCE_240GB_TPBF2312190010101467";
  networking.useDHCP = true;

  #networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  #networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  #services.syncthing = { 
  #  enable = true;
  #  dataDir = "/home/bloodwolfe/documents/syncthing";
  #  configDir = "/home/bloodwofle/documents/syncthing/.config";
  #  overrideDevices = true;
  #  overrideFolders = true;
  #  settings = {
  #    devices = { 
  #      "device1" = { id = "" ; };
  #      #"device1" = { id = "" ; };
  #    };
  #    folders = {
  #      path = "/home/bloodwolfe/syncthingtest";
  #      devices = [ "device1" ];
  #      ignorePerms = true;
  #    };
  #  };   
  #};
	#fileSystems."/persist".neededForBoot = true;
	#environment.persistence."/persist/system" = {
  #  directores = [
  #    "/ 
  #
}
