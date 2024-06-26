{ inputs, ... }: {
  imports =
    [  
      ./hardware-configuration.nix

      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix
      ../modules/require

      ../modules/option/spec/jovian-hardware-steamdeck.nix
      ../modules/option/gui/gaming/jovian-software.nix

      ../modules/option/gui/gaming/steam.nix

      ../modules/option/gui/desktop-environment/hyprland.nix
      ../modules/option/gui/desktop-environment/xdg-portal.nix

      ../modules/option/virtualization/libvirt.nix
      ../modules/option/virtualization/docker.nix
      ../modules/option/virtualization/waydroid.nix

      ../modules/option/security/yubikey.nix

      ../modules/users/bloodwolfe
    ];
  networking.hostName = "waterdreamer";
}
