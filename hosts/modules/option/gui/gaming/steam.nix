{ inputs,  pkgs, config, lib, ... }: let
    monitor = lib.head (lib.filter (m: m.primary) config.monitors); #i wonder how this works
    #gamescopeArgs = [ ];
in {
  imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];
  hardware.steam-hardware.enable = true;
  programs.steam = {
  	enable = true;
    platformOptimizations.enable = true;
  	remotePlay.openFirewall = true;
  	dedicatedServer.openFirewall = true;
  	gamescopeSession = { 
      enable = true;
      args = [
        #"--output-width 1920"
        #"--output-height 1080"
        #"--nested-refresh 144"
        #"--nested-unfocused-refresh 144"
        #"--immediate-flips"
        #"--rt"
        #"--expose-wayland"
        #"--borderless"
        #"--fullscreen"
        ##"--sdr-gamut-wideness 1"
        ##"--hdr-enabled"
        #"--stats-path /home/bloodwolfe/gamescopelog"
        ##"--adaptive-sync"
        ##"--force-grab-cursor"
        #"--steam"
        #"--mangoapp"
      ]; 
    };
  	extraCompatPackages = with pkgs; [
      proton-ge-bin    
      #steamtinkerlaunch
      #mangohud
    ];
    extraPackages = with pkgs; [
      xorg.libXcursor
      xorg.libXi
      xorg.libXinerama
      xorg.libXScrnSaver
      libpng
      libpulseaudio
      libvorbis
      stdenv.cc.cc.lib
      libkrb5
      keyutils
    ];
  };
  environment.systemPackages = with pkgs; [
    #mangohud
    steamPackages.steamcmd
    steam-run
    #vkbasalt
    #vkbasalt-cli
    #steamtinkerlaunch #BROKEN https://github.com/NixOS/nixpkgs/issues/210018
  ];
#TODO i believe there is a way to get monitor information though nix expressions
  programs.gamescope = {  
    enable = true;
    capSysNice = true; #BROKEN: https://github.com/NixOS/nixpkgs/issues/208936
    args = [
      "--output-width ${toString monitor.width}"
      "--output-height ${toString monitor.height}"
      "--nested-refresh ${toString monitor.refreshRate}"
      "--nested-unfocused-refresh ${toString monitor.refreshRate}"
      "--prefer-output ${monitor.port}"
      "--immediate-flips"
      "--rt"
      "--expose-wayland"
      "--borderless"
      "--fullscreen"
      "--stats-path /home/bloodwolfe/gamescopelog.txt"
      "--steam"
      "--mangoapp"
      "--backend sdl"
      
      #"--filter fsr"
      #"--scaler auto"
      #"--nested-width 1920"
      #"--nested-height 1080"
      #"--sdr-gamut-wideness 1"
      #"--hdr-enabled"
      #"--adaptive-sync"
      #"--force-grab-cursor"

      #DEBUG
      "--debug-events"
      #"--force-composition"
    ];
    #env = {
    #  LD_PRELOAD = ""; #https://github.com/ValveSoftware/gamescope/issues/163
    #};
  };
}
