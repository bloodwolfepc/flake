{ ... }: { 
  virtualisation.docker = {  
    enable = true;
    storageDriver = "btrfs";
    #rootless = {
    #  enable = true;
    #  setSocketVariable = true;
    #};
    daemon = {
      settings = {
        data-root = "/data/docker";
        userland-proxy = false;
        experimental = true;
        #ipv6 = true;
      };
    };
  };  
}
