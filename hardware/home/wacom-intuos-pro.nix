{ pkgs, ... }: {
  home.packages = with pkgs; [ xf86_input_wacom ];
  wayland.winodowManager.hyprland.settings = {
    input.tablet = { 
      transform = "6";
      region_size = "1920 1268";
    };
  };
}
  
