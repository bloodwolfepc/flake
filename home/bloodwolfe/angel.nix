{ config, ... }: { 
  wayland.windowManager.hyprland.extraConfig = ''
    submap = MONITOR
      bindi = ,f, focusmonitor, desc:Microstep MSI G241 0x000005ED
      bindi = ,d, focusmonitor, desc:BOE 0x0A1D
      bindi = ,s, focusmonitor, desc:Sceptre Tech Inc Sceptre F24 0x00000001
    submap = escape
  '';
  monitors = [
    {
      enabled = true;
      name = "desc:Microstep MSI G241 0x000005ED";
      width = 1920;
      height = 1080;
      refreshRate = 144;
      x = 0;
      y = 0;
    }
    {
      enabled = true;
      name = "desc:BOE 0x0A1D";
      width = 2560;
      height = 1600;
      refreshRate = 120;
      x = 1920;
      y = 0;
    }
    {
      enabled = true;
      name = "desc:Sceptre Tech Inc Sceptre F24 0x00000001";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      x = 4480;
      y = 0;
    }
  ];
  imports = [
    ./modules/preset/main.nix
    ../../hardware/home/wacom-intuos-pro.nix
    ../../hardware/home/rog-zypherus-g14.nix
    ../../hardware/android-home.nix
  ];
}
