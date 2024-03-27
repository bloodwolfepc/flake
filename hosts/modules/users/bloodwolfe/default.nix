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

  home-manager.user.bloodwolfe = import ../../../../home/bloodwolfe/lapis.nix;
}

