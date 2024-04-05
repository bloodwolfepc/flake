{lib, inputs, pkgs, ... }:

{
  imports =
    [ 
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-gpu-amd
      inputs.hardware.nixosModules.common-pc-ssd
      inputs.hardware.nixosModules.common-pc

      ./hardware-configuration.nix

      ../modules/require

      ../modules/option/gui/gaming/steam.nix
      ../modules/option/gui/desktop-environment/hyprland.nix
      ../modules/option/utils/xdg-portal.nix
      ../modules/option/virtualization/virtualization.nix

      ../modules/users/bloodwolfe
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "lapis";
  networking.networkmanager.enable = true;

  services.openssh.enable = lib.mkForce false;

  system.stateVersion = "23.11";

  programs.zsh.enable = true;
  #users.defaultUserShell = pkgs.zsh;

  systemd = {
    extraConfig = ''
     DefaultTimeoutStopSec = 10s
    '';
  };

}
