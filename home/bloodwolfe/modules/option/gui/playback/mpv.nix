{ lib, ... }:
{
  programs.mpv = {
    enable = true;
    #defaultProfiles = [
    # "gpu-hq"
    #];
    #config = {
    #  #cache-default = 4000000;
    #  ytdl-format = "bestvideo[height<=?1080][vcodec!*=av01]+bestaudio/best";
    #  profile = lib.mkDefault "gpu-hq";
    #  scale = "ewa_lanczossharp";
    #  cscale = "ewa_lanczossharp";
    #  slang = "en";
    #  sub-auto = "all";
    #  #fs = "yes";
    #  hwdec = "vaapi";
    #  vo = "gpu";
    #  gpu-context ="wayland";
    #};
  };
}
