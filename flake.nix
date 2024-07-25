
#use sig

#project send, nextcloud, or filebrowser
#TODO 
#screenshots are weird
#mailmutt
#callendar, todo
#firefox extension, local host webpage
#spt player login
#cacheix 
#bin-cache
#depersist Downloads but ensure creation, alias the downloads folder/ other stuff too.
#quick terminal pop up
#reorg/clear archives, archiving automation, reorg emulators
#reorg hyprland, swww, swaync
#waydroid
#wayvnc
#wine solutions, read docs
#pipewire read docs
#gimp, krita, reaper sftp or nix solution
#discord solutions, likely with arrpc + browser, discordo
#nvim fixes
#tmux fixes, ssh solutions
#lf solutions
#gtk, qt theme changes, theme chagnes general
#VM usage

#nixarr:
#ffmpeg commands
#vpn remote access
#borg backup .state dir
#fine grain perm setting
#location migration

#angel:
#passthough
#ignore lid state when external monitor is plugged in
#perform a minimal hyperland launch if not plugged in 
#target 7watts idle

#vps for vpn, syncthing, mailserver possbily
#hydra, forge server
#deploy-rs, nixops, nixos anywhere
#switch to mkOption usage, nixutilsplus

#navi:
#migrate hosting

#is it possible to user home manager configurations on the root user?
#hyprland should switch from using a key for every workspace to to having dedicated workspaces for some keys

#package:
#ynodesktop
#crossover
#neocities cli

#other:
#color callibration with colord & displaycal
#monitor configuraiton
#snipe-it or glpi
#piknik clipboard share
#zsh hostname color coding

#netdata
#wireshark

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
    #  url = "gitlab:simple-nixos-mailserver/nixos-mailserver";
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
    nixvim = {
      url = "github:bloodwolfepc/nixvim";
    };
    
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #steam-tui = {
    #  url = "github:dmadisetti/steam-tui";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
    };

    stylix = {
      url = "github:danth/stylix";
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
    devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
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
      
      navi = lib.nixosSystem {
        modules = [ ./hosts/navi ];
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
      
      "bloodwolfe@navi" = lib.homeManagerConfiguration {
        modules = [ ./home/bloodwolfe/waterdreamer.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
	};
}
#day 1: Eat breakfast
#day 2: Eat lunch
#day 3: Eat dinner
#day 4: Go to bed
#day 5: Go to the store
#day 6: Apply for jobs
#day 7: Go to a friend's
#day 8: Go to bed

#day 1: Eat breakfast
#day 2: Eat lunch
#day 3: Eat dinner
#day 4: Go to bed
#day 5: Go to the store
#day 6: Apply for jobs
#day 7: Go to a friend's
#day 8: Go to bed

#day 1: Eat breakfast
#day 2: Eat lunch
#day 3: Eat dinner
#day 4: Go to bed
#day 5: Go to the store
#day 6: Apply for jobs
#day 7: Go to a friend's
#day 8: Go to bed
