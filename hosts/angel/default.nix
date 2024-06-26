{ inputs, pkgs, ... }: {
  imports =
    [       
      inputs.hardware.nixosModules.asus-zephyrus-ga402
      ./hardware-configuration.nix
      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/option/spec/powersave.nix
      ../modules/option/spec/asus.nix
      ../modules/require

      ../modules/preset/laptop.nix

      ../modules/users/bloodwolfe

      #../modules/option/gui/gaming/jovian-software.nix
    ];
  networking.hostName = "angel";
  networking.networkmanager.enable = true;
  #TODO undervolt
}
