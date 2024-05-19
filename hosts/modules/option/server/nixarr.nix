{ inputs, config, ... }: {
  imports = [ inputs.nixarr.nixosModules.default ];
  sops.secrets."wg.conf" = {
    format = "binary";
    sopsFile = ../../../../secrets/wg.conf;
    #sopsFile = "/data/.secret/wg.conf";
  };
  systemd.services.wg.after = [ "NetworkManager.service" ];
  #services.nginx.enable = true;
  networking.nftables.enable = true;
  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";
    vpn = {
      enable = true;
      #wgConf = "/data/.secret/wg.conf"; #todo I can probably sops this
      wgConf = config.sops.secrets."wg.conf".path;
      #"$(cat ${config.sops.secrets."wg-conf".path})";
      #vpnTestService = {
      #  enable = true;
      #  port = 58403;
      #};
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
      enable = true; #9091
      vpn.enable = true;
      peerPort = 28960;
      #openFirewall = true;
    };
    bazarr.enable = true; #6767
    lidarr.enable = true; #8686
    lidarr.vpn.enable = true;
    readarr.enable = true; #8787
    sonarr.enable = true; #8989
    radarr.enable = true; #7878
    prowlarr.enable = true; #9797
  };
}
