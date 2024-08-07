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
    group = "syncthing";
    configDir = "/var/lib/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    #guiAddress = "0.0.0.0:8384";
    settings = {
      devices = { 
        "navi" = { id = "IOZE6I7-TPMOBII-WVPA62C-ZWJEHAO-HSDYXS3-SYBX6OI-NXBLSI3-2YQUJA4" ; };
        "lapis" = { id = "KKJZICE-YNDNRKY-2IFRHWP-76JK2D2-C27NC3V-OYYPDQY-BZ5SBNP-3CZ3DQD" ; };
        "angel" = { id = "DCWVWTS-URQEQL6-BC6CD3H-CJB3343-FF6FZDR-VJ6IH4W-IRTI3LS-CCC45Q6" ; };
        "android" = { id = "YKJBYMX-G4CSQXM-5UFX3SU-FM4A3MA-UYNW4QM-446NP74-NVNSCZZ-VQEK4QS" ; };
      };
    };
  };
}

