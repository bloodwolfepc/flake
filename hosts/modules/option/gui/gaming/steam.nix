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
  };
  environment.systemPackages = with pkgs; [
    #mangohud
    steamPackages.steamcmd
    steam-run
    steamtinkerlaunch #BROKEN https://github.com/NixOS/nixpkgs/issues/210018
  ];
}
