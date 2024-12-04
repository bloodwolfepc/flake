{ lib, ... }: {
  imports = [
    ./krita
    ./gimp
    ./beeref
  ];
  options = {
    programs.krita = {
      enable = lib.mkEnableOption "Enable Krita.";
      sync.enable = lib.mkEnableOption "Sync Krita.";
    };
    programs.gimp = {
      enable = lib.mkEnableOption "Enable Gimp.";
      sync.enable = lib.mkEnableOption "Sync Gimp.";
    };
    programs.beeref = {
      enable = lib.mkEnableOption "Enable Beeref.";
      sync.enable = lib.mkEnableOption "Sync Beeref.";
    };
  };
  config = {
    programs.krtia = {
      enable = true;
      sync.enable = true;
    };
    programs.gimp = {
      enable = true;
      sync.enable = true;
    };
    programs.beeref = {
      enable = true;
      sync.enable = true;
    };
  };

  #standin
}
