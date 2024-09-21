{ pkgs, config, inputs, lib, ... }: {
  containers.proxy-mc = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "192.168.100.2";
    localAddress = "192.168.100.12";
    forwardPorts = [
      { containerPort = 25565; hostPort = 25565; }
      { containerPort = 35567; hostPort = 25567; } 
    ];
    config = { pkgs, ... }: {
      imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
      system.stateVersion = "24.05";
      networking = {
        firewall = { enable = true; allowedTCPPorts = [
          25565
          25567
        ];
      };
      useHostResolvConf = lib.mkForce false;
      };
      services.resolved.enable = true;
      services.minecraft-servers = {
        enable = true;
        eula = true;
        openFirewall = true;
        servers = {    
          proxy-mc = {
            enable = true;
            package = pkgs.velocityServers.velocity;
            serverProperties = { server-port = 25565; };
            symlinks = { 
              "forwarding.secret" = pkgs.writeTextFile {
                name = "forwarding.secret";
                text = "ExampleForwardingSecret";
              };
              "velocity.toml" = pkgs.writeTextFile {
              name = "velocity.toml";
              text = ''
                config-version = "2.7"
                bind = "0.0.0.0:25565"
                motd = "<#09add3>never knows best.."
                show-max-players = 100
                online-mode = true
                force-key-authentication = false
                prevent-client-proxy-connections = false
                player-info-forwarding-mode = "modern"
                forwarding-secret-file = "forwarding.secret"
                announce-forge = true
                kick-existing-players = false
                ping-passthrough = "DISABLED"
                enable-player-address-logging = true
                [servers]
                  vanilla-mc = "192.168.100.3:25590"
                  xyx-mc = "192.168.100.4:25591"
                try = [
                    "vanilla-mc"
                ]
                [forced-hosts]
                "localhost" = [
                  "vanilla-mc"
                ]
                [advanced]
                compression-threshold = 256
                compression-level = -1
                login-ratelimit = 3000
                connection-timeout = 5000
                read-timeout = 30000
                haproxy-protocol = false
                tcp-fast-open = false
                bungee-plugin-message-channel = true
                show-ping-requests = false
                failover-on-unexpected-server-disconnect = true
                announce-proxy-commands = true
                log-command-executions = false
                log-player-connections = true
                accepts-transfers = false
                [query]
                enabled = false
                port = 25565
                map = "Velocity"
                show-plugins = false
              '';
            };};
          };
        };
      };
    };
  };
}
