{ pkgs, ... }:
{
  home.packages = with pkgs; [
    browsh
  ];
}
