{ pkgs, ... }:
{
  home.packages = with pkgs; [
   retroarch #includes cores
   retroarch-assets
   retroarch-joypad-autoconfig
   easyrpg-player
  ];
}
