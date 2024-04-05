{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = {
      pkgs.firefox.override = [
        pkgs.firefox
      ];
    };
  };
}
