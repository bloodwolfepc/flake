
#TODO 
#screenshots are weird
#mailmutt
#callendar
#firefox extension, local host webpage
#spt player login
#cacheix 
#bin-cache
#depersist Downloads but ensure creation, alias the downloads folder too
#quick terminal pop up
#reorg/clear archives, archiving automation

#nixarr:
#ffmpeg commands
#vpn remote access
#borg backup .state dir
#fine grain perm setting

#pipewire 
#gimp, krita, reaper sftp or nix solution

#discord solutions
#nvim fixes
#tmux fixes, ssh solutions
#lf solutions
{
  inputs = {
  	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
    hardware.url = "github:nixos/nixos-hardware";
  
  	home-manager = {
      url = "github:nix-community/home-manager";
  	  inputs.nixpkgs.follows = "nixpkgs";
    };
  
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

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hydra = {
      url = "github:nixos/hydra";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nixos-mailserver = {
    #  url = "gitlab:simple-nixos-mailserver/nixos-mailserver/nixos-unstable";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    
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

    neovim = {
      url = "github:bloodwolfepc/dead";
    };
    
    hyprland = {
      #url = "github:hyprwm/Hyprland";
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #steam-tui = {
    #  url = "github:dmadisetti/steam-tui";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
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
      
      meadow = lib.nixosSystem {
        modules = [ ./hosts/meadow ];
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
      
      "bloodwolfe@meadow" = lib.homeManagerConfiguration {
        modules = [ ./home/bloodwolfe/waterdreamer.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
	};
}
