{ pkgs, ... }: {
  services.asusd = {
    enable = true;
    enableUserService = true;
    #ProfileConfig
  };
  environment.systemPackages = with pkgs; [
    asusctl
  ];
  services.supergfxd = {
    enable = true;
    #path = [ pkgs.pciutils ];
  };
  services.switcherooControl.enable = true;
  services.power-profiles-daemon.enable = true;
  programs.rog-control-center.enable = true;
}
