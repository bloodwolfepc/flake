{ pkgs, ... }: {
  programs.spotify-player = {
    enable = true;
    settings = {
      #theme = "default";
      enable_notify = false;
    };
  };
}
  #if auth file exists then
  #spotify_player authenticate EOF >>
  #USERNAME
  #PASSWORD
  #spotify_player
  #else
  #spotify_player
