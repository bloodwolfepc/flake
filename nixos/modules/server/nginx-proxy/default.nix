{ pkgs, config, lib, inputs, ... }: {
  containers.nginx-proxy = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "10.10.11.1";
    localAddress = "10.10.10.1";
    forwardPorts = [
      { containerPort = 80; hostPort = 80; }
      { containerPort = 443; hostPort = 443; }
    ];
    config = { pkgs, ... }: {
      system.stateVersion = "24.05";
      networking = {
        firewall = { enable = true; allowedTCPPorts = [
          80 443
        ];};
        useHostResolvConf = lib.mkForce false;
      };
      services.resolved.enable = true;
      security.acme = {
        acceptTerms = true;
        defaults.email = "bloodwolfepc@gmail.com";
      };
      services.nginx = {
        enable = true;
        ## Use recommended settings
        #recommendedGzipSettings = true;
        #recommendedOptimisation = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;
        ## Only allow PFS-enabled ciphers with AES256
        #sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";
        #appendHttpConfig = ''
        #  # Add HSTS header with preloading to HTTPS requests.
        #  # Adding this header to HTTP requests is discouraged
        #  map $scheme $hsts_header {
        #      https   "max-age=31536000; includeSubdomains; preload";
        #  }
        #  add_header Strict-Transport-Security $hsts_header;
      
        #  # Enable CSP for your services.
        #  #add_header Content-Security-Policy "script-src 'self'; object-src 'none'; base-uri 'none';" always;
      
        #  # Minimize information leaked to other domains
        #  add_header 'Referrer-Policy' 'origin-when-cross-origin';
      
        #  # Disable embedding as a frame
        #  add_header X-Frame-Options DENY;
      
        #  # Prevent injection of code in other mime types (XSS Attacks)
        #  add_header X-Content-Type-Options nosniff;
      
        #  # This might create errors
        #  proxy_cookie_path / "/; secure; HttpOnly; SameSite=strict";
        #'';
        ## Add any further config to match your needs, e.g.:
        virtualHosts = {
          "waterdreamer.net" = {
            enableACME = true;
            forceSSL = true;
            locations."/" = {
              proxyPass = "https://10.10.10.2:443";
              extraConfig =
                "proxy_ssl_server_name on;" +
                "proxy_pass_header Authorization;"
              ;
            };
          };
          "blog.waterdreamer.net" = {
            enableACME = true;
            forceSSL = true;
            locations."/" = {
              proxyPass = "https://10.10.10.3:443";
              extraConfig =
                "proxy_ssl_server_name on;" +
                "proxy_pass_header Authorization;"
              ;
            };
          };
          "read.waterdreamer.net" = {
            enableACME = true;
            forceSSL = true;
            locations."/" = {
              proxyPass = "https://10.10.10.5:443";
              extraConfig =
                "proxy_ssl_server_name on;" +
                "proxy_pass_header Authorization;"
              ;
            };
          };
          "media.waterdreamer.net" = {
            enableACME = true;
            forceSSL = true;
            locations."/" = {
              proxyPass = "https://10.10.10.5:443";
              extraConfig =
                "proxy_ssl_server_name on;" +
                "proxy_pass_header Authorization;"
              ;
            };
          };
        };
      };
    };
  };
}
