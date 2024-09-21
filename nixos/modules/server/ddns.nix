#TODO container DDNS https://gist.github.com/clamydo/9691c48552efcd6d338407d58c900a4a
{ config, lib, inputs, ... }: {
  config.sops.secrets = { "ddns" = { }; };
  containers.ddns = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "192.168.100.99";
    localAddress = "192.168.100.99";
    forwardPorts = [
      { containerPort = 53; hostPort = 53; }
    ];
    config = { config, pkgs, ... }: {
      imports = [ inputs.sops-nix.nixosModules.sops ];
      system.stateVersion = "24.05";
      networking = {
        firewall = { enable = true; allowedTCPPorts = [ 53 ];
      };
      useHostResolvConf = lib.mkForce false;
      };
      services.resolved.enable = true;
      config.sops.
      services.ddclient = {
        enable = true;
        protocol = "namecheap";
        login = "";
        domains = ["waterdreamer.net"];
        passwordFile = "";
      };
    };
  }; 
}
