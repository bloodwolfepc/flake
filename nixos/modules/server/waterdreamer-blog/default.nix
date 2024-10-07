{ lib, pkgs, ...}: {
  containers.waterdreamer-blog = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "10.10.11.3";
    localAddress = "10.10.10.3";
    config = { pkgs, ... }: {
      system.stateVersion = "24.05";
      networking = {
        firewall = { enable = true; allowedTCPPorts = [
          80 443
        ];
      };
      useHostResolvConf = lib.mkForce false;
      };
      services.resolved.enable = true;
      security.acme = {
        acceptTerms = true;
        defaults.email = "bloodwolfepc@gmail.com";
      };
      services.nginx = {
        enable = true;
        virtualHosts."blog.waterdreamer.net" = {
          enableACME = true;
          forceSSL = true;
          root = "/var/www/blog";
          proxyWebsockets = true;
        };
      };
    };
  };
}
