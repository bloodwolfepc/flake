{ pkgs, config , ... }: {
  services.transmission = {
    enable = true;
    openFirewall = true;
    download-dir = "/home/bloodwolfe/Downloads";
    #settings = {
    #}
  };
  services.sonarr = {
    enable = true;
    openFirewall = true;
  };
  services.radarr = { #f
    enable = true;
    openFirewall = true;
  };
  environment.SystemPackages = with pkgs; [
    jackett
    bazarr

    transmission_4-gtk
  ];
  #services.rtorrent = {
  #  enable = true;
  #  openFirewall = true;
  #};
}
