{ inputs, lib, ... }:
{
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];

      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "flakes" "nix-command" "repl-flake" ];
      warn-dirty = false;
      system-features = [ "kvm" "big-parallel" "nixos-test" ];
      flake-registry = "";

      substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];

#    gc = {
#      automatic = true;
#      dates = "weekly";
#      randomizedDelaySec = "10m";
#      options = "--delete-older-than +20";
#    };
  };
}


      

    
    
