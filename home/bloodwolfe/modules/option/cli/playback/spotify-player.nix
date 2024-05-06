{ pkgs, ... }:
{ #TODO remove notifications
  home.packages = with pkgs; [
    spotify-player
  ];
  #if auth file exists then
  #spotify_player authenticate EOF >>
  #USERNAME
  #PASSWORD
  #spotify_player
  #else
  #spotify_player
}
