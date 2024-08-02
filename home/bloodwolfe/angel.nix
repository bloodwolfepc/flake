{ config, ... }: { 
  monitors = [
    {
      enabled = true;
      name = "DP-3";
      width = 1920;
      height = 1080;
      refreshRate = 144;
      x = 0;
      y = 0;
    }
    {
      enabled = true;
      name = "eDP-2";
      width = 2560;
      height = 1600;
      refreshRate = 60;
      x = 1920;
      y = 0;
    }
  ];
  imports = [
    ./modules/preset/main.nix
    ../../hardware/home/wacom-intuos-pro.nix
    ../../hardware/home/rog-zypherus-g14.nix
  ];
}
