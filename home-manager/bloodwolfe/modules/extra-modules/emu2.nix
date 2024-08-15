{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emu2
  ];
}
