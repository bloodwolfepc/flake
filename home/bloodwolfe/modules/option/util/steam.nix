{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steamPackages.steamcmd
    steam-run
  ];
}
