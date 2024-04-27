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

      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
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


      

    
    
