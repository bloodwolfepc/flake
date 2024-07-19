{ config, ... }: {
  sops.secrets = {
    "syncthing-key" = {
      owner = "syncthing";
    };
    "syncthing-cert" = {
      owner = "syncthing";
    };
    "syncthing-password" = {
      owner = "syncthing";
    };
  };
  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true"; 
  services.syncthing = { 
    enable = true;
    #dataDir = "/syncthing/data";
    configDir = "/var/lib/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    key = config.sops.secrets."syncthing-key".path;
    cert = config.sops.secrets."syncthing-cert".path;
    guiAddress = "0.0.0.0:8384";
    settings = {
      devices = { 
        "navi" = { id = "IOZE6I7-TPMOBII-WVPA62C-ZWJEHAO-HSDYXS3-SYBX6OI-NXBLSI3-2YQUJA4" ; };
      #  #"lapis" = { id = "" ; };
      #  #"android" = { id = "" ; };
      };
      folders = {
        "test" = {
          path = "/syncthingtest";
          devices = [ "navi" "lapis" ];
          ignorePerms = false;
        };
        "test-home" = {
          path = "/home/bloodwolfe/syncthingtest";
          devices = [ "navi" "lapis" ];
          ignorePerms = false;
        };
      };
    };
  };
}

