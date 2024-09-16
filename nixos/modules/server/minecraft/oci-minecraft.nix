{
  networking.firewall.allowedTCPPorts = [25565];
  networking.firewall.allowedUDPPorts = [24454];
  virtualisation.oci-containers.containers = let
    defaultVersion = "1.20.1";
    volumesDir = "/persist/home/bloodwolfe/oci";
    motd = "never knows best.";
  in {
    "proxy-mc" = {
      image = "itzg/mc-proxy";
      ports = [ "25565:25577" ];
      environment = {
        TYPE = "VELOCITY";
        ENABLE_RCON = true;
        ENABLE_SECURE_PROFILE = false;
      };
    };
    "vanilla-mc" = {
      image = "itzg/minecraft-server";
      autoStart = true;
      ports = ["25565:25565" "24454:24454/udp"];
      environment = {
        EULA = "TRUE";
        VERSION = defaultVersion;
        MEMORY = "4G";
        TYPE = "VANILLA";
      };
      volumes = ["${volumesDir}/vanilla-mc:/data:rw"];
    };
  };
}
