{ pkgs, lib, ... }: {
  services.swaync = {
    enable = true;
    settings = { };
    style = { };
  };
  wayland.windowManager.hyprland = {
    extraconfig = lib.mkBefore ''
      submap = NML 
        bindi = n, exec, swaync-client -t
      submap = escape
    '';
  };
}
  
