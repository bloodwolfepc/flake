{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mangohud
    goverlay
    vkbasalt
    vkbasalt-cli
  ];
}
