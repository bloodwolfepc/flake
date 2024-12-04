{ pkgs, config, inputs, lib, ... }: let 
  cfg = config.srv.minecraft.${srv.name};
  srv = {
    name = "vanilla-mc";
  };
  net = {
    hostAddress = "10.11.0.2";
    localAddress = "10.11.0.102";
    ports = { 
      minecraft = "25565";
      rcon = "35567";
    };
  };
  containerAttrs = let
    worlds = [ "world" "world_nether" "world_the_end" ];
    bindMountAttrs = world: {
      hostPath = "/data/srv/minecraft/${srv.name}/${world}";
      mountPoint = "/srv/minecraft/${srv.name}/${world}";
      isReadOnly = false;
    };
  in {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    ports = lib.attrValues net.ports;
    hostAddress = net.hostAddress;
    localAddress = net.localAddress;
    forwardPorts = lib.attrValues (lib.genAttrs (builtins.attrNames net.ports) (portName: {
      containerPort = net.ports.${portName};
      hostPort = net.ports.${portName};
    }));
    bindmounts = lib.genAttrs worlds bindMountAttrs;
    config = { pkgs, ... }: containerAttrs';
  };
  containerAttrs' = { 
    imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
    system.stateVersion = "24.05";
    networking = {
      firewall = { 
        enable = true;
        allowedTCPPorts = [ net.ports.minecraft net.ports.rcon ];
      };
      useHostResolvConf = lib.mkForce false;
    };
    services.resolved.enable = true;
    services.minecraft-server = serverConf; 
  }; 
  serverConf = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers = {    
      srv.name = serverConf';
    };
  };
  serverConf' = {
    enable = true;
    package = pkgs.papermc;
    serverProperties = { server-port = net.ports.minecraft; };
    symlinks = { 
      "forwarding.secret" = pkgs.writeTextFile {
        name = "forwarding.secret";
        text = "ExampleForwardingSecret";
      };
      "mods" = {
      };
    };
    files = {
      "ops.json" = {};
      "config/paper-global.yml" = {};
    };
  };
in {
  config.containers.proxy-mc = lib.mkEnableOption cfg.enable {
    config = containerAttrs;
  };
}
