{
	inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		#nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		#nixpkgs.follows = "unstable";

    hardware.url = "github:nixos/nixos-hardware";

		#flake-utils-plus.url = "github:gytis-ivaskevicius/flake-utils-plus";
		#flake-utils-plus.inputs.nixpkgs.follows = "nixpkgs";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nur.url = "github:nix-community/NUR";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
  
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    #sops-nix.url = "github:mix92/sops-nix";
    #inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:bloodwolfepc/die";

	};

	outputs = inputs@{ self, nixpkgs, home-manager, ... }:
	let 

    inherit (self) outputs;

		systems = [
      "x86_64-linux"
    ];

		lib = nixpkgs.lib // home-manager.lib;

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});

		pkgsFor = lib.genAttrs systems (system: import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		});

	in
	{
    inherit lib;
    customNixosModules = import ./custom-modules/nixos;
    customHomeManagerModules = import ./custom-modules/home-manager;
    overlays = import ./overlays {inherit inputs outputs; };
    customPackages = forEachSystem (pkgs: import ./custom-packages { inherit pkgs; });
    #devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
    #formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

		nixosConfigurations = {

      lapis = lib.nixosSystem {
        modules = [ ./hosts/lapis ];
        specialArgs = { inherit inputs outputs; };
      };

      angel = lib.nixosSystem {
        modules = [ ./hosts/angel ];
        specialArgs = { inherit inputs outputs; };
      };

      waterdreamer = lib.nixosSystem {
        modules = [ ./hosts/waterdreamer ];
        specialArgs = { inherit inputs outputs; };
      };
    };

    homeConfigurations = {
      "bloodwolfe@lapis" = lib.homeManagerConfiguration {
        modules = [ ./home/bloodwolfe/lapis.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };

      "bloodwolfe@angel" = lib.homeManagerConfiguration {
        modules = [ ./home/bloodwolfe/angel.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };

      "bloodwolfe@waterdreamer" = lib.homeManagerConfiguration {
        modules = [ ./home/bloodwolfe/waterdreamer.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
	};
}
