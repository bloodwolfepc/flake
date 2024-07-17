{ pkgs, ... }: {
  environment.persistence."/persist/system".directories = [
    { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
  ];
  services.colord.enable = true;
  environment.systemPackages = with pkgs; [
    displaycal 
  ];
}
