{ pkgs, config, lib, inputs, ... }: {
  containers.waterdreamer = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "10.10.11.2";
    localAddress = "10.10.10.2";
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
        virtualHosts.localhost = {
          locations."/" = {
            return = "200 '<html><body>connection to waterdreamer.net</body></html>'";
            extraConfig = ''
              default_type text/html;
            '';
            proxyWebsockets = true;
          };
          #enableACME = true;
          #forceSSL = true;
          #root = "/var/www/blog";
        };
      };
    };
  };
}
