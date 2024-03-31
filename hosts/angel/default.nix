{ inputs, pkgs, ... }:

{
  imports =
    [ 
      
      inputs.hardware.nixosModules.asus-zephyrus-ga402 #G14 GA402
      #inputs.hardware.nixosModules.common-cpu-amd
      #inputs.hardware.nixosModules.common-gpu-amd
      #inputs.hardware.nixosModules.common-pc-ssd
      #inputs.hardware.nixosModules.common-pc

      ./hardware-configuration.nix
      ../modules/require

      ../modules/option/steam.nix
      ../modules/option/hyprland.nix

      ../modules/users/bloodwolfe
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "angel";
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
