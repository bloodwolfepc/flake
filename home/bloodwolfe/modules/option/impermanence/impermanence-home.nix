{ inputs, ... }:
{
	imports = [
		inputs.impermanence.nixosModules.home-manager.impermanence
    ./home-keep.nix
	];
	home.stateVersion = "23.11";
}		
