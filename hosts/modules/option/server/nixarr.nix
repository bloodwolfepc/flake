{ inputs , ... }: {
  imports = [ inputs.nixarr ];
  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";
    vpn = {
      enable = true;
      wgconf = "/data/.secret/wg.conf";
    };
    jellyfin = {
      enable = true;
      #expose.https = {
        #enable = true;
        #domainName = "";
        #acmeMail = "";
      #}
    };
    transmission = {
      enable = true;
      #vpn.enable = true;
      #peerPort = 50000;
    };
    bazarr.enable = true;
    lidarr.enable = true;
    readarr.enable = true;
    sonarr.enable = true;
    radarr.enable = true;
    prowlarr.enable = true;
  };
}
