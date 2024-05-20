{ inputs, config, ... }: {
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
    #interfaces.enp6s0.useDHCP = true;
    #useDHCP = true;
    #interfaces.wlo1 = { #wireless
    #  useDHCP = true;
    #  ipv4.addresses = [
    #    {
    #      address = "";
    #      prefixLength = 23;
    #    }
    #  ];
    #  ipv6.addresses = [
    #    {
    #    }
    #  ];
    #};
  };    
  sops.secrets."noip-pass" = { };
  services.ddclient = {
    #configFile = pkgs.writeText "my-config-fiel" ''
    #  protocol=duckdns
    #  use=web, web=checkup.dyndns.com
      
      
    
    enable = true;
    protocol = "duckdns"; 
    server = "www.duckdns.org";
    domains = [ "bloodwolfe.duckdns.org" ];
    use = "web, web=ifconfig.me";
    #"cmd, cmd=/persist/duckdns.sh"; 
    username = "haschabert@gmail.com";
    passwordFile = config.sops.secrets."noip-pass".path;
    interval = "300";
  };
}
