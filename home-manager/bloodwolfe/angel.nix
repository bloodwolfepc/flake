{ config, ... }: { 
  wayland.windowManager.hyprland.extraConfig = ''
    submap = MONITOR
      bindi = ,f, focusmonitor, desc:Microstep MSI G241 0x000005ED
      bindi = ,d, focusmonitor, desc:BOE 0x0A1D
      bindi = ,s, focusmonitor, desc:Sceptre Tech Inc Sceptre F24 0x00000001
    submap = escape
  '';
  imports = [
    ../../nixos/angel/monitors.nix
    ./modules/preset/main.nix
    ./modules/hardware/rog-zypherus-g14.nix
    ./modules/hardware/wacom-intuos-pro.nix
  ];
}
