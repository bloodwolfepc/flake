{ pkgs, ... }:
{
  hardware.steam-hardware.enable = true;
  programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true;
  	dedicatedServer.openFirewall = true;
  	gamescopeSession.enable = true;
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
    #steamtinkerlaunch #BROKEN https://github.com/NixOS/nixpkgs/issues/210018
  ];
#TODO i believe there is a way to get monitor information though nix expressions
  programs.gamescope = {  
    enable = true;
    #capSysNice = true;
    args = [
      "--output-width 1920"
      "--output-height 1080"
      "--nested-refresh 144"
      "--nested-unfocused-refresh 144"
      "--immediate-flips"
      "--rt"
      "--expose-wayland"
      "--borderless"
      "--fullscreen"
      #"--sdr-gamut-wideness 1"
      #"--hdr-enabled"
      "--stats-path /home/bloodwolfe/gamescopelog"
      #"--adaptive-sync"
      #"--force-grab-cursor"
    ];
  };
}
