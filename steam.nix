{ pkgs, config, ... }:
{
programs.steam = {
	enable = true;
	remotePlay.openFirewall = true;
	dedicatedServer.openFirewall = true;
	extest.enable = true;
	#extraCompatPackages = [ ]
};
}
