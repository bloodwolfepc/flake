{ pkgs, config, ... }: {
  sops.secrets.bloodwolfe-pass.neededForUsers = true;
  users.mutableUsers = false;
  users.groups.data = {
    name = "data";
  };

  users.users.bloodwolfe = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.bloodwolfe-pass.path;
    #useDefaultShell = true;
    shell = pkgs.zsh;
    extraGroups = [
      "syncthing"
      "wheel"
      "audio"
      "video"
      "networkmanager"
      "libvirtd"
      "docker"
      "keys"
      "data"
      "libvirtd"
      "realtime"
    ];
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/id_angel.pub)
    ];
  };

  home-manager.users.bloodwolfe = import ../../../../home-manager/bloodwolfe/${config.networking.hostName}.nix;
}

