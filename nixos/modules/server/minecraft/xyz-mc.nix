{ config, lib, inputs, ... }: {
  containers.xyz-mc = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "192.168.100.4";
    localAddress = "192.168.100.14";
    forwardPorts = [
      { containerPort = 25591; hostPort = 25591; }
      { containerPort = 35581; hostPort = 25581; } 
    ];
    bindMounts."world" = {
      hostPath = "/data/minecraft/xyz-mc/world";
      mountPoint = "/srv/minecraft/xyz-mc/world";
      isReadOnly = false;
    };
    config = { pkgs, ... }: {
      imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
      system.stateVersion = "24.05";
      networking = {
        firewall = { enable = true; allowedTCPPorts = [
          25591
          25581
        ];
      };
      useHostResolvConf = lib.mkForce false;
      };
      services.resolved.enable = true;
      nixpkgs.config.allowUnfree = true;
      services.minecraft-servers = {
        enable = true;
        eula = true;
        openFirewall = true;
        servers = {
          "xyz-mc" = {
            enable = true;
            package = pkgs.fabricServers.fabric;
            serverProperties = {
              server-port = 25591;
              gamemode = "creative";
              simulation-distance = 20;
              enable-rcon = true;
              broadcast-rcon-to-ops = true;
              max-players = 10;
              online-mode = false;
              allow-nether = false;
              white-list=true;
            };
            symlinks = {
              "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
                fabric-proxy-lite = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/8dI2tmqs/versions/AQhF7kvw/FabricProxy-Lite-2.9.0.jar";
                  hash = "sha256-wIQA86Uh6gIQgmr8uAJpfWY2QUIBlMrkFu0PhvQPoac";
                };
                worldedit = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/1u6JkXh5/versions/vBzkrSYP/worldedit-mod-7.3.6.jar";
                  hash = "sha256-rhXBnUgZouFryjZSfd1TQNB5HXGglz8sB0lHdyMkG4Y";
                };
                carpet = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/TQTTVgYE/versions/f2mvlGrg/fabric-carpet-1.21-1.4.147%2Bv240613.jar";
                  hash = "sha256-B5/IpOBz6ySwEP/MWI5Z+TuYQUPhfY7xn7sLav8PGdk";
                };
              });
            };
            files = {
              "ops.json".value = [
                {
                  name = "bloodwolfepc";
                  uuid = "2ea0c95d-1faf-4f7d-ba93-abe0462f5ec7";
                  level = 4;
                }
                {
                  name = "DrunkDriverDUI";
                  uuid = "0cc9de07-aaa3-4e65-b6ab-b3d2ccb1ebf0";
                  level = 4;
                }
              ];
              "config/FabricProxy-Lite.toml" = pkgs.writeTextFile {
                name = "FabricProxy-Lite.toml";
                text = ''
                  hackOnlineMode = true
                  hackEarlySend = false
                  hackMessageChain = true
                  disconnectMessage = "This server requires you to connect with Velocity."
                  secret = "ExampleForwardingSecret"
                '';
              };
              "whitelist.json".value = [
                {
                  name = "bloodwolfepc";
                  uuid = "2ea0c95d-1faf-4f7d-ba93-abe0462f5ec7";
                }
                {
                  name = "DrunkDriverDUI";
                  uuid = "0cc9de07-aaa3-4e65-b6ab-b3d2ccb1ebf0";
                }
              ];
            };
          };
        };
      };
    };
  }; 
}
