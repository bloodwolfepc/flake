{ inputs, pkgs, ... }: {
  #Must use MBR
  imports =
    [       
      #inputs.hardware.nixosModules.<something>
      ./hardware-configuration.nix
      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/require


      ../modules/users/bloodwolfe

    ];
  networking.hostName = "navi";
}
