{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam-tui #TODO, overlay with the official flake
  ];
}
