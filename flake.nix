{
	inputs = {
		#stable.url = "github:nixos/nixpkgs/nixos-23.11:";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs.follows = "unstable";
		
		flake-utils-plus.url = "github:gytis-ivaskevicius/flake-utils-plus";
		flake-utils-plus.inputs.nixpkgs.follows = "nixpkgs";

		nur.url = "github:nix-community/NUR";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		#neofetch.url = "github:dylanaraps/neofetch";
		#neofetch.inputs.nixpkgs.follows = "nixpkgs";
	
		neovim.url = "github:nix-community/neovim-nightly-overlay";

		hyprland.url = "github:hyprwm/Hyprland";

		#discord.url = "github:InternetUnexplorer/discord=overlay";
		#discord.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs@{ unstable, nixpkgs, flake-utils-plus, home-manager, nur, neovim, self, ... }:
	let 
		system = "x86_64-linux";
		user = "bloodwolfe";
	
		pkgs =  import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};

		lib = nixpkgs.lib;
	in
	{
		nixosConfigurations = (
			import ./hosts.nix {
				inherit (nixpkgs) lib;
				inherit inputs user system home-manager;
			}
		);
	};
}
		



















#inputs.flake-utils-plus.lib.mkFlake {
#			inherit inputs self;
#			supportedSystems = [ "x86_64-linux" ];
#
#			#channels
#			channelsConifg = {
#				allowUnfree = true;
#			};
#
#			sharedOverlays = with inputs; [
#				self.overlay
#				nur.overlay
#				#neovim.overlay
#			];
#
#			channels = {
#
#				stable = {
#					input = inputs.stable;
#				};
#				
#				unstable = {
#					input = inputs.unstable;
#					#overlaysBuilder = channels: [
#					#	(final: prev: {
#					#		inherit (channels.stable) pass-secret-service;
#					#	})
#					#];
#				};
#			};
#			#hosts
#			hostDefaults = let
#				sys = "x86_64-linux";
#			in {
#				system = sys;
#				modules = with self.moduleSets; system ++ hardware;
#				channelName = "unstable";
#				specialArgs = { inherit inputs; system = sys; };
#			};
#
#			hosts = with inputs; {
#				desktop = {
#					modules = [
#						./hardware/desktop-hardware-config.nix
#						./systems/desktop-system-config.nix
#						./users/bloodwolfe.nix
#					];
#				};
#				test = {
#					modules = [
#						./hardware/test-hardware-config.nix
#						./system/test-system-config.nix
#						./users/bloodwolfe.nix
#					];
#				};
#			};
#			#modules
#			#nixosModules = let
#			#	moduleList = [
#			#		<systems/modules>
#			#		<hardware/modules>
#			#		<users/modules>
#			#	];
#			nixosModules = inputs.flake-utils-plus.lib.exportModules [
#				./systems/modules
#				./hardware/modules
#				./users/modules
#			];
#
#
#			moduleSets = {
#				system = [
#					<systems/modules>
#				];
#				hardware = [
#					<hardware/modules>
#				];
#				user = [
#					<users/modules>
#				];
#			};
#			#overlay
#			overlay = import ./pkgs;
#
#			#outputsbuilder apps shell
#			
#			#outputsBuilder = channels: {
#
#			#};
#		};
#
#}
#
#		
#
#				
#				
#			
#
#
#
#
#
#
#
#
#
#
#
#
#			#channels hosts modules overlay
#			#APPS SHELL
#			
#
#			
#
#
#			
#			
#
#
#
