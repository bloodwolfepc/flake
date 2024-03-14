{ lib, pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
    
        mainBar = {
          layer = "top";
          position = "top";
          height = 12;
          modules-left = [ "hyprland/submap" "hyprland/scratchpad" "hyprland/window" ];
          modules-center = [ "image#album-art" "custom/media" ];
          #"custom/lyrics" ];
          modules-right = [ "pulseaudio" "netowrk" "cpu" "memory" "battery" "clock#date" "clock" ];
        };
    #    let
    #      refresh = 1;
    #    in
    #      "hyprland/scratchpad" = {
    #	format = "{icon} {count}";
    #	show-empty = "false";
    #	format-icons = "";
    };
    style =
      ''
      * {
      border: none;
      border-radius: 0;
      font-family: unscii;
      }
      '';
  };
}
