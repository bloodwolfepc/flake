{config, ... }: {
  #sops.secrets = {
  #  "syncthing-key-angel" = {
  #    owner = "syncthing";
  #  };
  #  "syncthing-cert-angel" = {
  #    owner = "syncthing";
  #  };
  #};
  #services.syncthing = { 
  #  key = config.sops.secrets."syncthing-key-angel".path;
  #  cert = config.sops.secrets."syncthing-cert-angel".path;
  #};
}
