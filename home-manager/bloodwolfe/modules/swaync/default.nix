{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "swaync";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {  
    services.swaync = {
      enable = true;
      #settings = { }; #TODO style
      #style = { };
    };
    wayland.windowManager.hyprland = {
      extraConfig = lib.mkBefore ''
        submap = NML 
          bindi = , n, exec, swaync-client -t
        submap = escape
      '';
    };
  };
in {
  inherit (attrs) options config;
}
