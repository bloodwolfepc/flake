{ inputs,  pkgs, config, lib, ... }: {
  imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];
  hardware.steam-hardware.enable = true;
  programs.steam = {
  	enable = true;
    platformOptimizations.enable = true;
  	remotePlay.openFirewall = true;
  	dedicatedServer.openFirewall = true;
  	gamescopeSession = { 
      enable = true;
      args = [ ]; 
    };
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      steamtinkerlaunch
    ];
    #extraPackages = with pkgs; [
      #xorg.libXcursor
      #xorg.libXi
      #xorg.libXinerama
      #xorg.libXScrnSaver
      #libpng
      #libpulseaudio
      #libvorbis
      #stdenv.cc.cc.lib
      #libkrb5
      #keyutils
      #mangohud
      #gamescope
    #];
  };
  environment.systemPackages = with pkgs; [
    steamPackages.steamcmd
    steam-run
    protonup-ng
    protontricks
    #vkbasalt
    #vkbasalt-cli
    #steamtinkerlaunch #BROKEN https://github.com/NixOS/nixpkgs/issues/210018
  ];
}
