{ inputs, ... }: {
  imports =
    [       
      inputs.nixos-generators.noxosModules.all-formats 
      ../modules/require
      ../modules/preset/iso.nix
      ../modules/users/bloodwolfe
    ];
  networking.hostName = "meadow";
  nixpkgs.hostPlatform = "x86_64-linux"; 
}
