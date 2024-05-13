{ pkgs, config, ... }:
{
  sops.secrets.bloodwolfe-pass.neededForUsers = true;
  users.mutableUsers = false;

  users.users.bloodwolfe = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.bloodwolfe-pass.path;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "networkmanager"
      "libvirtd"
      "docker"
      "keys"
    ];
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/rainbow.pub)
    ];
  };

  home-manager.users.bloodwolfe = import ../../../../home/bloodwolfe/${config.networking.hostName}.nix;
}

