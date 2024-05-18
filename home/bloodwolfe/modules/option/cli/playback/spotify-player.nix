{ pkgs, ... }: {
  programs.spotify-player = {
    enable = true;
    settings = {
      #theme = "default";
      enable_notify = false;
      device = {
        name = "spotify-player";
        device_type = "speaker";
        volume = 80;
        bitrate = 320;
        audio_cache = false;
        normalization = false;
        copy_command = {
          command = "wl-copy";
          args = [];
        };
      };
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
