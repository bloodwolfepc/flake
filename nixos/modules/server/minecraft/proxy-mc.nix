{ pkgs, config, inputs, lib, ... }: let 
  cfg = config.srv.minecraft.proxy-mc;
  srv = {
    name = "proxy-mc";
    motd =  "<#09add3>never knows best.";
  };
  net = {
    hostAddress = "10.11.0.1";
    localAddress = "10.11.0.101";
    ports = { 
      minecraft = "25565";
      rcon = "35567";
    };
  };
  containerAttrs = { 
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    ports = [ net.ports.minecraft net.ports.rcon ];
    #use ports here
    forwardPorts = [
      { containerPort = net.ports.minecraft; hostPort = net.ports.minecraft; }
      { containerPort = net.ports.rcon; hostPort = net.ports.rcon; }
    ];
    config = { pkgs, ... }: containerAttrs';
  };
  containerAttrs' = { 
    imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
    system.stateVersion = "24.05";
    networking = {
      firewall = { 
        enable = true;
        allowedTCPPorts = net.ports;
      };
      useHostResolvConf = lib.mkForce false;
    };
    services.resolved.enable = true;
    services.minecraft-server = proxyConf; 
  }; 
  proxyConf = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers = {    
      srv.name = proxyConf';
    };
  };
  proxyConf' = {
    enable = true;
    package = pkgs.velocityServers.velocity;
    serverProperties = { server-port = net.ports.minecraft; };
    symlinks = { 
      "forwarding.secret" = pkgs.writeTextFile {
        name = "forwarding.secret";
        text = "ExampleForwardingSecret";
      };
    };
    files."velocity.toml".value = velocity-toml;
  };
  velocity-toml = {
    config-version = "2.7";
    bind = "0.0.0.0:${net.ports.minecraft}";
    motd = "${cfg.motd}";
    show-max-players = 100;
    online-mode = true;
    force-key-authentication = false;
    prevent-client-proxy-connections = false;
    player-info-forwarding-mode = "modern";
    forwarding-secret-file = "forwarding.secret";
    announce-forge = true;
    kick-existing-players = false;
    ping-passthrough = "DISABLED";
    enable-player-address-logging = true;
    servers = {
      vanilla-mc = "192.168.100.3:25590";
      xyx-mc = "192.168.100.4:25591";
    };
    try = [
      "vanilla-mc"
    ];
    forced-hosts = {
      "localhost" = [
        "vanilla-mc"
      ];
    };
    advanced = {
      compression-threshold = 256;
      compression-level = "-1";
      login-ratelimit = 3000;
      connection-timeout = 5000;
      read-timeout = 30000;
      haproxy-protocol = false;
      tcp-fast-open = false;
      bungee-plugin-message-channel = true;
      show-ping-requests = false;
      failover-on-unexpected-server-disconnect = true;
      announce-proxy-commands = true;
      log-command-executions = false;
      log-player-connections = true;
      accepts-transfers = false;
    };
    query = {
      enabled = false;
      port = net.ports.minecraft;
      map = "Velocity";
      show-plugins = true;
    };  
  };
in {
  config.containers.proxy-mc = lib.mkEnableOption cfg.enable {
    config = containerAttrs;
  };
}
