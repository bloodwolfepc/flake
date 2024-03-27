{ pkgs, ... }:
{
  fonts.fontconfig.enbale = true;
  home.packages = with pkgs; [
    unscii
  ];
}
