{ pkgs, ... }:

{
  imports =
    [ 

      ./hardware-configuration.nix
      ../modules/require

      ../modules/option/steam.nix
      ../modules/option/hyprland.nix

      ../modules/users/bloodwolfe
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "waterdreamer";
  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "23.11";

  programs.zsh.enable = true;
  #users.defaultUserShell = pkgs.zsh;

  systemd = {
    extraConfig = ''
     DefaultTimeoutStopSec = 10s
    '';
  };

}
