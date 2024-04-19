{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
  ];
  programs.rbw = {
    enable = true;
    #settings =
    #  email
  };
}


