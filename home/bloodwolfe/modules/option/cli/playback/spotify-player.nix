{ pkgs, ... }:
{ #TODO remove notifications
  home.packages = with pkgs; [
    spotify-player
  ];
}
