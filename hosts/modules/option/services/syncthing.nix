{ config, ... }: {
  #each device needs its own key, cert, and id
  #nix-shell -p syncthing --run "syncthing -generate=myconfig"
  sops.secrets = {
    "syncthing-password" = {
      owner = "syncthing";
    };
  };
  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true"; 
  services.syncthing = { 
    enable = true;
    configDir = "/var/lib/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    #guiAddress = "0.0.0.0:8384";
    settings = {
      devices = { 
        "navi" = { id = "IOZE6I7-TPMOBII-WVPA62C-ZWJEHAO-HSDYXS3-SYBX6OI-NXBLSI3-2YQUJA4" ; };
        "lapis" = { id = "KKJZICE-YNDNRKY-2IFRHWP-76JK2D2-C27NC3V-OYYPDQY-BZ5SBNP-3CZ3DQD" ; };
        "android" = { id = "YKJBYMX-G4CSQXM-5UFX3SU-FM4A3MA-UYNW4QM-446NP74-NVNSCZZ-VQEK4QS" ; };
      };
      #folders will need to be set up differently for each machine
      #however if the target is to mirror the other system this should work
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

