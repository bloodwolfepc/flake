{ inputs,  pkgs, config, lib, ... }: let
    #monitor = lib.head (lib.filter (m: m.primary) config.monitors);
    #gamescopeArgs = [ ];
in {
  programs.gamescope = {  
    enable = false;
    capSysNice = true; #BROKEN in steam: https://github.com/NixOS/nixpkgs/issues/208936
    args = [
      "--output-width 1920"
      "--output-height 1080"
      "--nested-refresh 144"
      "--nested-unfocused-refresh 144"
      #"--prefer-output XXX"
      "--immediate-flips"
      "--rt"
      "--expose-wayland"
      "--borderless"
      "--fullscreen"
      "--stats-path /home/bloodwolfe/gamescopelog.txt"
      "--steam"
      "--mangoapp"
      "--backend sdl"
      "--filter fsr"
      "--scaler auto"
      "--nested-width 1920"
      "--nested-height 1080"
      "--sdr-gamut-wideness 1"
      "--hdr-enabled"
      "--adaptive-sync"
      "--force-grab-cursor"
    ];
  };
}
    #  "--output-width ${toString monitor.width}"
    #  "--output-height ${toString monitor.height}"
    #  "--nested-refresh ${toString monitor.refreshRate}"
    #  "--nested-unfocused-refresh ${toString monitor.refreshRate}"
    #  "--prefer-output ${monitor.name}"
