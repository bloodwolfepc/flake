{ pkgs, ... }:
{
  packages = with pkgs; [
    steamPackages.steamcmd
    steam-run
  ];
}
