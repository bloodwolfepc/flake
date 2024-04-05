{
  programs.mpv = {
    enable = true;
    defaultProfiles = [
     "gpu-hq"
    ];
    config = {
      cache-default = 4000000;
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}
