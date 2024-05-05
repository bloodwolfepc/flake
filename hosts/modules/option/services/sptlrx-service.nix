{ config, pkgs, ... }: {
  sops.secrets."spotify-cookie" = {};
  systemd.services."sptlrx-service" = {
    script = '' 
      ${pkgs.sptlrx}/bin/sptlrx pipe --cookie $(cat ${config.sops.secrets."spotify-cookie".path}) > /tmp/lyrics.txt
      #/home/bloodwolfe/.nix-profile/bin/sptlrx pipe --cookie $(cat $HOME/cookie/spotify) > /tmp/lyrics.txt
    '';
    serviceConfig = {
      User = "sptlrx-service";
      WorkingDirectory = "/var/lib/sptlrx-service";
    };
  };
  users.users.sptlrx-service = {
    home = "/var/lib/sptlrx-service";
    createHome = true;
    isSystemUser = true;
    group = "sptlrx-service";
  };
  users.groups.sptlrx-service = { };
  environment.systemPackages = with pkgs; [
    sptlrx
  ];
}
