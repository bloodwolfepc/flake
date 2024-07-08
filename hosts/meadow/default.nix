{ inputs, ... }: {
  imports =
    [       
      inputs.nixos-generators.nixosModules.all-formats 
      ../modules/require
      ../modules/preset/iso.nix
      ../modules/users/bloodwolfe
    ];
  networking.hostName = "meadow";
  nixpkgs.hostPlatform = "x86_64-linux"; 
}
