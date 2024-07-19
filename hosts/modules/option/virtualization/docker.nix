{ ... }: { 
  virtualisation.docker = {  
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings.data-root = "/data/docker";
  };  
}
