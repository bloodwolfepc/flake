{ inputs, pkgs, config, ... }: {
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

  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  services.syncthing = { 
    enable = true;
    environment.STNODEFAULTFOLDER = "true"; 
    dataDir = "/syncthing/data";
    configDir = "/syncthing/.config";
    overrideDevices = true;
    overrideFolders = true;
    key = config.sops.secrets."syncthing-key".path;
    cert = config.sops.secrets."syncthing-cert".path;
    guiAddress = "0.0.0.0:8384";
    settings = {
      #devices = { 
      #  "navi" = { id = "" ; };
      #  #"lapis" = { id = "" ; };
      #  #"phone1" = { id = "" ; };
      #};
      #folders = {
      #  path = "/syncthingtest";
      #  devices = [ "navi" ];
      #  ignorePerms = true;
      #};

      gui = {
        user = "bloodwolfe";
        password = config.sops.secrets."syncthing-password";
      };
    };   
  };
  
	#fileSystems."/persist".neededForBoot = true;
	#environment.persistence."/persist/system" = {
  #  directores = [
  #    "/ 
  #
}
