{ pkgs, config, lib, inputs, ... }: let
  lib1 = pkgs.callPackage ./lib.nix { };
in {
  containers.calibre = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostBridge = "br0";
    localAddress = "192.168.100.5/24";
    forwardPorts = [
      { containerPort = 8080; hostPort = 8080; }
      { containerPort = 8083; hostPort = 8083; } 
    ];
    bindMounts."library" = {
      hostPath = "/data/library";
      mountPoint = "/library";
      isReadOnly = false;
    };
    config = { pkgs, ... }: {
      system.stateVersion = "24.05";
      networking = {
        #useDHCP = lib.mkForce true;
        firewall = { enable = true; allowedTCPPorts = [
          8080
          8083
        ];
      };
      useHostResolvConf = lib.mkForce false;
      };
      services.resolved.enable = true;
      services.calibre-server = {
        enable = true;
      };
      services.calibre-web = {
        enable = true;
      };
    };
  };
}
      
