{ lib, pkgs, ...}:

{
  programs.waybar = {
    enable = true;
#    mainBar = {
#      layer = "top";
#      position = "top";
#      height = 15;
#    };
#    modules-left = [ "hyprland/scratchpad" "hyprland/window" ];
#    modules-center = [ "image#album-art" "custom/media" "custom/lyrics" ];
#    modules-right = [ "pulseaudio" "netowrk" "cpu" "memory" "custom/weather" "battery" "clock#date" "clock" "tray" ];
#    let
#      refresh = 1;
#    in
#      "hyprland/scratchpad" = {
#	format = "{icon} {count}";
#	show-empty = "false";
#	format-icons = "";
#

  };
}
