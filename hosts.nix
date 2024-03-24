{ lib, inputs, system, home-manager, user, ...}:

{
	desktop = lib.nixosSystem {
		inherit system;
		specialArgs = {inherit user inputs; };
		modules = [
			./hosts/desktop.nix
			./hyprland.nix
			./steam.nix
				home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = { inherit user; };
				home-manager.users.${user} = {
					imports = [(import ./home.nix)];
				};
			}
		];
	};
}
