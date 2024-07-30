{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    monitor = map
      (m:
        let 
          resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
          position = "${toString m.x}x${toString m.y}";
        in
        "${m.name},${if m.enabled then "${resolution},${position},1" else "disable"}"
      )
      (config.monitors);
  };
  
    #"monitor" = [
    #  "eDP-2, 2560x1600@60, 0x0, 1"
    # #"HDMI-A-1, 1920x1080@60, -2560x0, 1" # vrr, 1"
    #  #"eDP-2, 1920x1080@60, 0x0, 1"
    #  #"HDMI-A-1, 1920x180@75, -1920x0, 1"
    #  ",preferred,auto,1"
    #];
  imports = [
    ./modules/preset/main.nix
    ../../hardware/home/wacom-intuos-pro.nix
  ];
}
