{ pkgs, config , ... }: {
  services.transmission = {
    enable = true;
    openFirewall = true;
    settings = {
      download-dir = "/home/bloodwolfe/Downloads";
    };

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
  services.jackett = {
    enable = true;
    openFirewall = true;
  };
  services.bazarr = {
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    transmission_4-gtk
  ];
  #services.rtorrent = {
  #  enable = true;
  #  openFirewall = true;
  #};
}
