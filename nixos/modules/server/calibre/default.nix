{ pkgs, config, lib, inputs, ... }: {
  containers.calibre = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostBridge = "10.10.11.3";
    localAddress = "10.10.10.3";
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
      
