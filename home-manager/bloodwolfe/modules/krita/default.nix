{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "krita";
    packages = with pkgs; [
      krita
    ];
    syncDirs = [
      "krita"
      ".local/share/krita" 
    ];
    syncFiles = [
      ".config/kritarc"
      ".config/kritadisplayrc"
    ];
    inherit config;
  }; 
  #extraHomeConfig = cfg : {
  #  file = lib.mkIf cfg.enable {
  #    ".config/kritarc".source = config.lib.file.mkOutOfStoreSymlink
  #      "/sync${config.home.homeDirectory}/.config/DIR-kritarc/kritarc";
  #    ".config/kritadisplayrc".source = config.lib.file.mkOutOfStoreSymlink
  #      "/sync${config.home.homeDirectory}/.config/DIR-kritadisplayrc/kritadisplayrc";
  #  };
  #};
in {
  inherit (attrs) options config;
}
