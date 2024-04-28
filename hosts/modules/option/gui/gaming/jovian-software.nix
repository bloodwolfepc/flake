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
      #https://github.com/mirobouma/MusicControl
    };
  };
}

