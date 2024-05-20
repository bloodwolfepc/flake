{ pkgs, ... }:
{
  home.packages = with pkgs; [
    reaper

    yabridge
    yabridgectl
    #surge
    carla
    #faust

    #lsp-plugins
    #zam-plugins
#TODO package https://gitlab.com/drobilla/mda-lv2
#TODO add reakeys
  ];
}
