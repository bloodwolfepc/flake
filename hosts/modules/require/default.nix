{ inputs, outputs, pkgs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager #gets homemanager
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

  system.stateVersion = "23.11";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
	programs.fuse.userAllowOther = true;

}
