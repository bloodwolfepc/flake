{ inputs, ... }: {
  imports = [ inputs.musnix.nixosModules.default ];
  musnix = {
    kernal.realtime = true;
    #rtirq = {};
  };
}
