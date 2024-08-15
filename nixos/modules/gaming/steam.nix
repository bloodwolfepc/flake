{ inputs,  pkgs, config, lib, ... }: #let
    #monitor = lib.head (lib.filter (m: m.primary) config.monitors); #i wonder how this works
    #gamescopeArgs = [ ];
#in {
  {
  imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];
  hardware.steam-hardware.enable = true;
  programs.steam = {
  	enable = true;
    platformOptimizations.enable = true;
  	remotePlay.openFirewall = true;
  	dedicatedServer.openFirewall = true;
  	gamescopeSession = { 
      enable = false;
      args = [ ]; 
    };
  	extraCompatPackages = with pkgs; [
      proton-ge-bin    
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
    steamPackages.steamcmd
    steam-run
    #vkbasalt
    #vkbasalt-cli
    #steamtinkerlaunch #BROKEN https://github.com/NixOS/nixpkgs/issues/210018
  ];
}
