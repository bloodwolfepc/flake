{ pkgs, lib, config, ... }: {
  imports = [
    ./hyprland.nix
    ./hyprland-pass-oneshots.nix
    ./swaync.nix
    ./rofi.nix
    ./waybar.nix
    ./alacritty.nix
  ];
  home.packages = [
    pkgs.wayvnc
    pkgs.swww
    pkgs.grimblast
    
    pkgs.wl-clipboard
    pkgs.cliphist

    pkgs.playerctl

	  pkgs.xdg-desktop-portal
	  pkgs.xdg-desktop-portal-wlr
	  pkgs.xdg-desktop-portal-gtk
	  pkgs.xdg-desktop-portal-hyprland
    
    pkgs.lxqt.lxqt-policykit
    (pkgs.writeShellScriptBin "pc" ''
      ${pkgs.hyprland}/bin/Hyprland
    '')
  ];
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-hyprland
	    xdg-desktop-portal-wlr
	    xdg-desktop-portal-gtk
    ];
  };
  
  xdg.userDirs = {
    enable = true;
    createDirectories = false;
    desktop = "/home/bloodwolfe/desktop";
    documents = "/home/bloodwolfe/documents";
    download = "/home/bloodwolfe/downloads";
    music = "/home/bloodwolfe/music";
    pictures = "/home/bloodwolfe/pictures";
    videos = "/home/bloodwolfe/videos";
    extraConfig = {
      XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/pictures/snips";
    };
  };
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".config/kdeconnect"
    ];
  };
}
