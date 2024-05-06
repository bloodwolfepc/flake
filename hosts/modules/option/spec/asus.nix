{ pkgs, ... }: {
  services.asusd = {
    enable = true;
    enableUserService = true;
    #asusdConfig
    #ProfileConfig
    #animeConfig
    #auraConfig
    #fanCurvesConfig
    #userLedModesConfig
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
