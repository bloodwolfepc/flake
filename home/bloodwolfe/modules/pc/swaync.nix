{ pkgs, lib, ... }: {
  services.swaync = {
    enable = true;
    #settings = { };
    #style = { };
  };
  wayland.windowManager.hyprland = {
    extraConfig = lib.mkBefore ''
      submap = NML 
        bindi = , n, exec, swaync-client -t
      submap = escape
    '';
  };
}
  
