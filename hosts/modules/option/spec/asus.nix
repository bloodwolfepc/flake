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
  exvironment.systemPackages = with pkgs; [
    asusctl
  ];
}
