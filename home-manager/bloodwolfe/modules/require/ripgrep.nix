{ pkgs, ... }:
{
  programs.ripgrep = {
    enable = true;
    #package = [
    #  pkgs.ripgrep-all
    #];
  };
  home.packages = with pkgs; [
    ripgrep-all
  ];
}
