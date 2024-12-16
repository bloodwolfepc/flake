{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "xdg";
    syncDirs = [
      "desktop"
      "documents"
      "music"
      "pictures"
      "videos"
      "snips"
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    xdg = {
      enable = true;
      portal = let
        hyprland = config.wayland.windowManager.hyprland.package;
      in {
        enable = true;
        configPackages = [
          hyprland
        ];
        extraPortals = with pkgs; [ 
          xdg-desktop-portal-hyprland
	        xdg-desktop-portal-wlr
	        xdg-desktop-portal-gtk
        ];
      };
      userDirs = let 
        me = config.home.homeDirectory;
      in {
        enable = true;
        createDirectories = false;
        desktop = "${me}/desktop";
        documents = "${me}/documents";
        download = "${me}/downloads";
        music = "${me}/music";
        pictures = "${me}/pictures";
        videos = "${me}/videos";
        extraConfig = {
          XDG_SCREENSHOTS_DIR = "${me}/snips";
        };
      };
    }; 
  };
in {
  inherit (attrs) options config;
}
