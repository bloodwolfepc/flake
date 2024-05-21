{ inputs, config, ... }: {
  imports = [ inputs.nixarr.nixosModules.default ];
  sops.secrets."wg.conf" = {
    format = "binary";
    sopsFile = ../../../../secrets/wg.conf;
  };
  systemd.services.wg.after = [ "NetworkManager.service" ];
  networking.nftables.enable = true;
  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";
    vpn = {
      enable = true;
      wgConf = config.sops.secrets."wg.conf".path;
      #vpnTestService = {
      #  enable = true;
      #  port = 58403;
      #};
    };
    jellyfin = { #8096
      enable = true; 
      expose.https = {
        enable = true;
        domainName = "bloodwolfe.duckdns.org";
        #acmeMail = "bloodwolfe@bloodwolfe.duckdns.org";
        acmeMail = "bloodwolfepc@gmail.com";
      };
    };
    transmission = { #9091
      enable = true; 
      vpn.enable = true;
      peerPort = 28960;
    };
    bazarr.enable = true; #6767
    lidarr.enable = true; #8686
    readarr.enable = true; #8787
    sonarr.enable = true; #8989
    radarr.enable = true; #7878
    prowlarr.enable = true; #9696
  };
}
