{ inputs, pkgs, config, ... }: {
  imports =
    [       
      #TODO nixos hardware modules
      ./hardware-configuration.nix
      ./syncthing.nix
      ./borg.nix
      ../modules/preset/server.nix
      ../modules/users/bloodwolfe
      
      ../modules/server/minecraft
      ./ddns.nix
    ];
  networking = {
    hostName = "navi";
    useDHCP = true;
    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "eno1";
      enableIPv6 = true;
    };
  };
}
