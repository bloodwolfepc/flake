
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
      settings = (import ./settings.nix).settings;
      extraConfig = (import ./extra-config.nix).extraConfig;
    };
  };
in {
  inherit (attrs) options config;
}
