{ pkgs, ... }: { 
  virtualisation = {
    containers.enable = true;
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };  
  };
  environment.systemPackages = with pkgs; [
    distrobox 
    podman-tui
    dive
  ]; 
	environment.persistence."/persist/system" = {
		directories = [
      "/var/lib/containers"
    ];
  };
}
