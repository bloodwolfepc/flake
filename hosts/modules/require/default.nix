{ inputs, outputs, pkgs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager #gets homemanager
    ./audio/pipewire.nix
    ./system-services/keyd.nix
    ./system-configuration/nix.nix
    ./system-configuration/locale.nix
    ./security/sops.nix
    ./utils/nh.nix
  ] ++ (builtins.attrValues outputs.customNixosModules); #concatenate customNixosModules

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config.allowUnfree = true;
  };

  hardware.enableRedistributableFirmware = true;
  security.sudo.extraConfig = ''
    Defaults timestamp_timeout = 120
  '';
  #some of these can be moved around later but for now i'm fine with these being the same accross all systems
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
	
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;

  system.stateVersion = "23.11";

  programs.zsh.enable = true;
	programs.fuse.userAllowOther = true;

  systemd = {
    extraConfig = ''
     DefaultTimeoutStopSec = 10s
    '';
  };
}
