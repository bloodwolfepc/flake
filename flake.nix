{
  inputs = {
  	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
    hardware.url = "github:nixos/nixos-hardware";
  
  	home-manager = {
      url = "github:nix-community/home-manager";
  	  inputs.nixpkgs.follows = "nixpkgs";
    };
  
    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";
    #};
    #hyprfocus = {
    #  url = "github:VortexCoyote/hyprfocus";
    #  inputs.hyprland.follows = "hyprland";
    #};
    #hypr-darkwindow = {
    #  url = "github:micha4w/Hypr-DarkWindow/tags/v0.36.0"; 
    #  inputs.hyprland.follows = "hyprland";
    #};
  
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    impermanence = {
      url = "github:nix-community/impermanence";
    };
  
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nixos-mailserver = {
    #  url = "gitlab:simple-nixos-mailserver/nixos-mailserver/nixos-unstable";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  
    nixvim = {
      url = "github:bloodwolfepc/die";
    };
  
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    nixarr = {
      url = "github:rasmus-kirk/nixarr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
#TODO create an USB bootable nospec host
      };
    };
	};
}
