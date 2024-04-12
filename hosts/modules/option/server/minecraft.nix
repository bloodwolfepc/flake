{
  services.minecraft-server = {
    enbale = true;
    dataDir = "/var/lib/minecraft";
    eula = true;
    openFirewall = true;
    declarative = true;
    serverProperties = {
      server-port = 43000;
      difficulty = 3;
      gamemode = 1;
      max-players = 5;
      motd = "die";
    };
  };
}
