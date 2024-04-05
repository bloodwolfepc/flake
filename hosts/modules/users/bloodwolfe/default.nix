{ pkgs, config, ... }:
{
  users.users.bloodwolfe = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "networkmanager"
      "libvirtd"
      "docker"
    ];
  };

  home-manager.users.bloodwolfe = import ../../../../home/bloodwolfe/${config.networking.hostName}.nix;
}

