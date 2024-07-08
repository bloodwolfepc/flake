{ inputs, pkgs, ... }: {
  imports = [
    inputs.jovian.nixosModules.default
  ];
  jovian = {
    steam = { 
      enable = true;
      #autostart = false;
      desktopSession = "/home/bloodwolfe/.nix-profile/bin/Hyprland";
      environment = { };
    };
    decky-loader = {
      enable = true;
      #extraPackages = []; 
      stateDir = "/persist/system/var/lib/decky-loader"; #write to persist (viable while not
      #using extraPackages)
      #TODO package https://github.com/mirobouma/MusicControl
#TODO setups for making hyprland work as the DE, not shutting down on "shutdown"
    };
  };
}

