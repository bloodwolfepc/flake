{ pkgs, ... }: { 
  virtualisation = {
    docker = {  
      enable = true;
      storageDriver = "btrfs";
      #rootless = {
      #  enable = true;
      #  setSocketVariable = true;
      #};
      daemon = {
        settings = {
          data-root = "/docker";
          userland-proxy = false;
          experimental = true;
          #ipv6 = true;
        };
      };
    };
    podman = {
      enable = false;
      dockerCompat = true;
    };  
  };
  environment.systemPackages = [ pkgs.distrobox ];
}
