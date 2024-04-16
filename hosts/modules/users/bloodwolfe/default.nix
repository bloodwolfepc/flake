{ pkgs, config, ... }:
{
  sops.secrets.bloodwolfe-password.neededForUsers = true;
  users.mutableUsers = true;

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
    ];
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/id_default.pub)
    ];
  };

  home-manager.users.bloodwolfe = import ../../../../home/bloodwolfe/${config.networking.hostName}.nix;
}

