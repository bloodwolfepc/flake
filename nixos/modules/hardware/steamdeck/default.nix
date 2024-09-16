{ inputs, pkgs, ... }: {
  imports = [
    inputs.jovian.nixosModules.default
  ];
  jovian.devices = {
    steamdeck = {
      enable = true;
      autoUpdate = true;
    };
  };
  #SOFTWARE MODULE
  jovian = {
    steam = { 
      enable = true;
      desktopSession = "${pkgs.hyprland}/bin/Hyprland";
      #environment = { };
    };
    decky-loader = {
      enable = true;
      #extraPackages = []; 
      stateDir = "/persist/system/var/lib/decky-loader";
      #TODO https://github.com/mirobouma/MusicControl
    };
  };
}



