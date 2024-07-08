{ inputs, ... }:
{
	imports = [
		inputs.impermanence.nixosModules.home-manager.impermanence
    ./home-keep.nix
	];
}		
