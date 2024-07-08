{ inputs, ... }: {
  imports = [
    inputs.jovian.nixosModules.default
  ];
  jovian.devices = {
    #for devices which aren't a steamdeck jovian has jovian.hardware modules
    steamdeck = {
      enable = true;
      autoUpdate = true;
    };
  };
}



