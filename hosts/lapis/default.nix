{ inputs, config, pkgs, ... }: {
  imports =
    [  
	    inputs.hardware.nixosModules.common-cpu-intel
	    inputs.hardware.nixosModules.common-gpu-amd
      ./hardware-configuration.nix
      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/option/spec/openrgb.nix
      ../modules/option/spec/focusrite-low-latency-audio.nix
      ../modules/require

      ../modules/preset/full-system.nix

      ../modules/users/bloodwolfe


      ../modules/option/gui/wine.nix
    ];
  networking = {
    hostName = "lapis";
    useDHCP = true;
    defaultGateway = {
      address = "192.168.0.1";
      interface = "enp6s0";
    };
    boot.loader.efi.canTouchEfiVariables = true;
    interfaces = {
      enp6s0 = {
        #ipv4.addresses = [
        #  {
        #    address = "192.168.0.189"; #189
        #    prefixLength = 24;
        #  }
        #];
        #ipv6.addresses = [
        #  {
        #    address = "2a01:4f8:1c1b:16d0::1";
        #    prefixLength = 64;
        #  }
        #];
      };
    };
    #defaultGateway6 = {
    #  address = "fe80::1";
    #};
  };    
  #sops.secrets."noip-pass" = { };
  #services.ddclient = {
  #  enable = true;
  #  protocol = "duckdns"; 
  #  server = "www.duckdns.org";
  #  domains = [ "bloodwolfe.duckdns.org" ];
  #  use = "web, web=ifconfig.me";
  #  #"cmd, cmd=/persist/duckdns.sh"; 
  #  username = "haschabert@gmail.com";
  #  passwordFile = config.sops.secrets."noip-pass".path;
  #  interval = "300";
  #};
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      #libvdpau-va-gl 
    ];   
  }; 
  #services.xserver.enable = true;
  #services.xserver.videoDrivers = [ "amdgpu" ];
  #hardware.amdgpu.initrd.enable = true; #UPDATE
  boot.initrd.kernelModules = [ "amdgpu" ];
 # programs.corectrl = {
 #   enable = true;
 #   gpuOverclock.enable = true;
 # };
  programs.thunar.enable = true;
  services.tumbler.enable = true;
}
