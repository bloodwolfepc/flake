{
  networking.networkmanager = {
    enable = true;
    unmanaged = [ "interface-name:ve-*" ];
  };
  services.resolved.enable = true;
  #networking.resolvconf.enable = true;
}
