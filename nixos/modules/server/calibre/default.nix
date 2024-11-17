{
  virtualisation.oci-containers.containers.calibre-web = {
    image = "ghcr.io/linuxserver/calibre-web";
    ports = [ "8083:8083" ];
    volumes = [
      "/data/media/library/books:/books"
      "/data/media/.calibre-web:/config"
    ];
  };
  virtualisation.oci-containers.containers.calibre = {
    image = "lscr.io/linuxserver/calibre:latest";
    ports = [ "9532:8080" ];
    volumes = [
      "/data/media/library/books:/books"
      "/data/media/.calibre:/config"
    ];
  };
}




#for some reason I cant connect to this, using podman for now

#{ pkgs, config, lib, inputs, ... }: {
#  containers.calibre = {
#    autoStart = true;
#    ephemeral = true;
#    privateNetwork = true;
#    hostAddress = "10.10.11.4";
#    localAddress = "10.10.10.4";
#    bindMounts."library" = {
#      hostPath = "/data/media/library";
#      mountPoint = "/data/media/library";
#      isReadOnly = false;
#    };
#    forwardPorts = [
#      { containerPort = 8083; hostPort = 8083; } 
#      { containerPort = 8080; hostPort = 8080; }
#    ];
#    config = { pkgs, ... }: {
#      system.stateVersion = "24.05";
#      networking = {
#        firewall = { enable = true; allowedTCPPorts = [
#          8080
#          8083
#        ];
#      };
#      useHostResolvConf = lib.mkForce false;
#      };
#      services.resolved.enable = true;
#      security.acme = {
#        acceptTerms = true;
#        defaults.email = "bloodwolfepc@gmail.com";
#      };
#      services.nginx = {
#        enable = true;
#        virtualHosts.localhost = {
#          enableACME = true;
#          forceSSL = true;
#          locations."/calibre-web" = {
#            proxyPass = "https://localhost:8083";
#            extraConfig =
#              "proxy_ssl_server_name on;" +
#              "proxy_pass_header Authorication;"
#            ;
#          };
#        };
#      };
#      services.calibre-server = {
#        enable = true; #8080
#        libraries = [ "/data/library" ];
#      };
#      services.calibre-web = {
#        enable = true; #8083
#        #options = {
#        #  reverseProxyAuth = {
#        #    enable = true;
#        #  };
#        #};
#      };
#    };
#  };
#}
#      
