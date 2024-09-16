{ config, lib, inputs, ... }: {
  containers.vanilla-mc = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "192.168.100.3";
    localAddress = "192.168.100.13";
    forwardPorts = [
      { containerPort = 25571; hostPort = 25571; }
      { containerPort = 35581; hostPort = 25581; } 
    ];
    config = { pkgs, ... }: {
      imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
      system.stateVersion = "24.05";
      networking = {
        firewall = { enable = true; allowedTCPPorts = [
          25571
          25581
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
          "vanilla-mc" = {
            enable = true;
            package = pkgs.papermc;
            serverProperties = {
              server-port = 25571;
              gamemode = "survival";
              simulation-distance = 4;
              enable-rcon = true;
              broadcast-rcon-to-ops = true;
              max-players = 100;
              online-mode = false;
            };
            symlinks = {
              "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
                worldedit = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/1u6JkXh5/versions/yAujLUIK/worldedit-bukkit-7.3.6.jar";
                  hash = "sha256-85MQWheIaM/9mdvjnykGHESwx1vqy11apZwIDNQjyXk";
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
              ];
            };
          };
        };
      };
    };
  }; 
}
