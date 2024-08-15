{
  imports = [ 
    ./modules/preset/main.nix
  ];
  monitors = [
    {
      enabled = true;
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
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
}
