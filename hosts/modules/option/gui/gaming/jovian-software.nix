{ inputs, ... }: {
  imports = [
    inputs.jovian.nixosModules.default
  ];
  jovian.steam = { 
    enable = true;
    autostart = false;
    desktopSession = "Hyprland";
    environment = { };
    #user = "bloodwolfe";
    decky-loader = {
      enable = false;
      extraPackages = [];
    };
  };
}

