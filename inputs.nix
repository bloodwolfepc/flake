{
  inputs = {
  	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
    hardware.url = "github:nixos/nixos-hardware";
  
  	home-manager = {
      url = "github:nix-community/home-manager";
  	  inputs.nixpkgs.follows = "nixpkgs";
    };
  
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
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
  
    nixvim = {
      url = "github:bloodwolfepc/die";
    };
  
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    #nixos-anywhere = {
    #  url = "github:nix-community/nixos-anywhere";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    #musnix = {
    #  url = "github:musnix/musnix";
    #};
  
    nixarr = {
      url = "github:rasmus-kirk/nixarr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
