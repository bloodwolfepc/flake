{ inputs, outputs, pkgs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nh.nix
    ./nix.nix
    ./keyd.nix
    ./sops.nix
    ./locale.nix
    ./ssh.nix
    ./impermanence.nix
    ./yubikey.nix
  ] ++ (builtins.attrValues outputs.customNixosModules);

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config.allowUnfree = true;
  };

  hardware.enableRedistributableFirmware = true;
  security.sudo.extraConfig = ''
    Defaults timestamp_timeout = 120
  '';
  systemd = {
    extraConfig = ''
     DefaultTimeoutStopSec = 10s
    '';
  };

  system.stateVersion = "23.11";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
	programs.fuse.userAllowOther = true;

}
