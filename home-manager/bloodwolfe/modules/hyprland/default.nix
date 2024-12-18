
#TODO clipboard history management, screenshots
#command to toogle gaps
# bind that:
#moves firefox to a position of the aftive workspace and another to return it
#wvkbd-mobintl -L 400 -fn Unscii -bg 000000 -fg 000000 -fg-sp 000000 -press 000000|00 -press-sp 000000|00

{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "hyprland";
    packages = with pkgs;[
      (writeShellScriptBin "pc" ''
        ${hyprland}/bin/Hyprland
      '')
      wayvnc
      swww
      wl-mirror
      grimblast
      wl-clipboard
      xorg.xrandr
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      xwayland.enable = true;
    };
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
    };
  };
in {
  inherit (attrs) options config;
  imports = [
    ./settings.nix
    ./extra-config.nix
    ./modesetting.nix
    ./options.nix
  ];
}
