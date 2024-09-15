{ pkgs, ... }: { 
  virtualisation = {
    oci-containers.backend = "podman";
    podman = {
      enable = false;
      dockerCompat = true;
    };  
  };
  environment.systemPackages = [ pkgs.distrobox ];
}
