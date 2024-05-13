{ inputs , ... }: {
  imports = [ inputs.nixarr.nixosModules.default ];
  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";
    vpn = {
      enable = true;
      wgConf = "/data/.secret/wg.conf"; #todo I can probably sops this
      #vpnTestService = {
      #  enable = true;
      #  port = 58403;
      #};
      #openssh.expose.vpn.enable = true;
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
      vpn.enable = true;
      uiPort = 9091;
      #peerPort = 1673;
    };
    bazarr.enable = true; #6767
    lidarr.enable = true; #8686
    readarr.enable = true; #8787
    sonarr.enable = true; #8989
    radarr.enable = true; #7878
    prowlarr.enable = true; #9797
  };
}
