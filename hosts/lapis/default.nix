{ inputs, pkgs, ... }:

{
  imports =
    [ 
      
	inputs.hardware.nixosModules.common-cpu-intel
	inputs.hardware.nixosModules.common-gpu-amd
      ./hardware-configuration.nix

      inputs.disko.nixosModules.default
      ( import ../modules/option/disc/impermanence-btrfs.nix { device = "/dev/nvme0n1"; })
      ../modules/option/impermanence/impermanence-btrfs.nix

      ../modules/require
      #../modules/option/spec/powersave.nix

      ../modules/option/gui/gaming/steam.nix
      ../modules/option/gui/desktop-environment/hyprland.nix
      ../modules/option/utils/xdg-portal.nix
      #../modules/option/utils/openrgb.nix
      ../modules/option/virtualization/libvirt.nix
      ../modules/option/virtualization/docker.nix
      ../modules/option/virtualization/waydroid.nix
      ../modules/option/security/yubikey.nix

      ../modules/users/bloodwolfe
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
	
  networking.hostName = "lapis";
  networking.networkmanager.enable = true;
  users.users."bloodwolfe".initialPassword = "12345";
  services.openssh.enable = true;

  system.stateVersion = "23.11";

  programs.zsh.enable = true;
	programs.fuse.userAllowOther = true;

  systemd = {
    extraConfig = ''
     DefaultTimeoutStopSec = 10s
    '';
  };

}
