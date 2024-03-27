{ pkgs, inputs, config, ...}:
{
  users.users.bloodwolfe = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "networkmanager"
    ];
  };

  home-manager.users.bloodwolfe = import ../../../../home/bloodwolfe/lapis.nix;
}

