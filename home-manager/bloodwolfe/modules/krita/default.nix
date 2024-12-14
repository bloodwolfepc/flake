{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "krita";
    packages = with pkgs; [
      krita
    ];
    syncDirs = [
      "krita"
      ".local/share/krita" 
      ".config/DIR-kritarc"
      ".config/DIR-kritadisplayrc"
    ];
    inherit extraHomeConfig;
    inherit config;
  }; 
  extraHomeConfig = cfg : {
    file = lib.mkIf cfg.enable {
      ".config/kritarc".source = config.lib.file.mkOutOfStoreSymlink
        "/sync${config.home.homeDirectory}/.config/DIR-kritarc/kritarc";
      ".config/kritadisplayrc".source = config.lib.file.mkOutOfStoreSymlink
        "/sync${config.home.homeDirectory}/.config/DIR-kritadisplayrc/kritadisplayrc";
    };
  };
in {
  inherit (attrs) options config;
}
