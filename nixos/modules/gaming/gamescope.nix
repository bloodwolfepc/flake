{ inputs,  pkgs, config, lib, ... }: let

    #steam steam://open/bigpicture
    #monitor = lib.head (lib.filter (m: m.primary) config.monitors);
    #gamescopeArgs = [ ];
    
    #gamescope steam steam://open/bigpicture > ~/output.log 2>&1 &
in {
  programs.gamescope = {  
    enable = true;
    capSysNice = false; #BROKEN in steam: https://github.com/NixOS/nixpkgs/issues/208936
    #args = [
    #   "--output-width 1920"
    #   "--output-height 1080"
    #   "--nested-width 1920"
    #   "--nested-height 1080"
    #   "--nested-refresh 144"
    #   "--nested-unfocused-refresh 144"
    #   
    #   #"--prefer-output DP-1"
    #   "--immediate-flips"
    #   "--rt"
    #   "--expose-wayland"
    #   #"--borderless"
    #   #"--fullscreen"
    #   #"--stats-path /tmp/gamescopelog"
    #   #"--mangoapp"
    #   "--backend sdl" #will break without
    #   "--steam"
    #   #"--filter fsr"
    #   #"--scaler auto"
    #   #"--sdr-gamut-wideness 1"
    #   #"--hdr-enabled"
    #   #"--adaptive-sync"
    #   #"--force-grab-cursor"
    #];
  };
}
    #  "--output-width ${toString monitor.width}"
    #  "--output-height ${toString monitor.height}"
    #  "--nested-refresh ${toString monitor.refreshRate}"
    #  "--nested-unfocused-refresh ${toString monitor.refreshRate}"
    #  "--prefer-output ${monitor.name}"
